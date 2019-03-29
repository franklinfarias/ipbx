<?php
/* These are (in order) the options we can pass to pami client:
 *
 * The hostname or ip address where asterisk ami is listening
 * The scheme can be tcp:// or tls://
 * The port where asterisk ami is listening
 * Username configured in manager.conf
 * Password configured for the above user
 * Connection timeout in milliseconds
 * Read timeout in milliseconds
 */

require('../vendor/autoload.php');

use PAMI\Client\Impl\ClientImpl as PamiClient;
use PAMI\Listener\IEventListener as PamiEventListener;
use PAMI\Message\Event\EventMessage as PamiEventMessage;
use PAMI\Message\Event\ExtensionStatusEvent as PamiExtensionStatusEvent;
use PAMI\Message\Event\AgentsEvent as PamiAgentsEvent;
use PAMI\Message\Event\StatusCompleteEvent as PamiStatusCompleteEvent;
use PAMI\Message\Action\StatusAction as PamiStatusAction;
use PAMI\Message\Action\CommandAction as PamiCommandAction;
use PAMI\Message\Action\AgentsAction as PamiAgentsAction;

$pamiClientOptions = array(
    'host' => '172.12.0.4',
    'scheme' => 'tcp://',
    'port' => 5038,
    'username' => 'pami',
    'secret' => 'd2b60781fd',
    'connect_timeout' => 10000,
    'read_timeout' => 10000
);

//$pamiClient = new PamiClient($pamiClientOptions);
// Open the connection
//$pamiClient->open();
// Close the connection
//$pamiClient->close();

class A implements PamiEventListener
{
    public function handle(PamiEventMessage $event)
    {
        //echo "<br>";
        //echo "<h1>Event Listener</h1>";
        //var_dump($event);
        //echo "<br>";

        if ($event instanceof PamiExtensionStatusEvent) {
            //echo "<br>";
            //echo "<h1>Event Listener: PamiExtensionStatusEvent</h1>";
            ////var_dump($event);
            //echo "Extension: ".$event->getExtension()." Status: ".$this->getExtensionStatusText($event->getStatus());
            event(new App\Events\ExtensionStatus($event));
        }

        if ($event instanceof PamiAgentsEvent) {
            echo "<br>";
            echo "<h1>Event Listener: PamiAgentsEvent</h1>";
            var_dump($event);
        }

        if ($event instanceof PamiStatusCompleteEvent) {
            echo "<br>";
            echo "<h1>Event Listener: PamiStatusCompleteEvent</h1>";
            var_dump($event);
        }

        if ($event instanceof PamiStatusAction) {
            echo "<br>";
            echo "<h1>Event Listener: PamiStatusAction</h1>";
            var_dump($event);
        }

        if ($event instanceof PamiAgentsAction) {
            echo "<br>";
            echo "<h1>Event Listener: PamiAgentsAction</h1>";
            var_dump($event);
        }
    }

    public function getExtensionStatusText($code){
        switch ($code) {
            case -1:
                return "Extension not found";
            case 0:
                return "Idle";
            case 1:
                return "In Use";
            case 2:
                return "Busy";
            case 4:
                return "Unavailable";
            case 8:
                return "Ringing";
            case 16:
                return "On Hold";
            default:
                return "Not identified";
        }
    }
}


$eventNames = array(
    'StatusComplete',
    'ExtensionStatus',
    'Agents',
);

$eventValues = array(
    'Agents' => array(
        'TalkingToChannel' => 'TalkingToChannel',
        'TalkingTo' => 'TalkingTo',
        'LoggedInTime' => 'LoggedInTime',
        'LoggedInChan' => 'LoggedInChan',
        'Name' => 'Name',
        'Status' => 'Status',
        'Agent' => 'Agent'
    ),
    'ExtensionStatus' => array(
        'Privilege' => 'Privilege',
        'Status' => 'Status',
        'Exten' => 'Extension',
        'Hint' => 'Hint',
        'Context' => 'Context',
    ),
    'StatusComplete' => array(
        'Items' => 'Items'
    ),
);

try
{

    foreach ($eventNames as $eventName) {

        $a = new PamiClient($pamiClientOptions);
        $a->registerEventListener(new A());
        $a->open();

        /*echo "<br>";
        echo "<h1>Event Listener: StatusAction</h1>";
        var_dump($a->send(new PamiStatusAction()));


        echo "<br>";
        echo "<h1>Event Listener: AgentsAction</h1>";
        var_dump($a->send(new PamiAgentsAction('')));
        */
        /*$time = time();
        while(true)//(time() - $time) < 60) // Wait for events.
        {
            usleep(1000); // 1ms delay
            // Since we declare(ticks=1) at the top, the following line is not necessary
            $a->process();
        }*/

        $running = true;
        $time = time();
        while($running) {
        //while ((time() - $time) < 60){
            $a->process();
            usleep(1000);
        }

        $a->close(); // send logoff and close the connection.
    }
} catch (Exception $e) {
    echo $e->getMessage() . "\n";
}

