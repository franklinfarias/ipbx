<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use PAMI\Message\Event\ExtensionStatusEvent;

class ExtensionStatus implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $extension = "";
    public $status = "";
    public $statusText = "";

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($obj)
    {
        if ($obj instanceof ExtensionStatusEvent){
            $this->extension = $obj->getExtension();
            $this->status  = $obj->getStatus();
            $this->statusText  = $this->getExtensionStatusText($obj->getStatus());
        } else {
            $this->extension = "NotFound";
            $this->status  = "NotFound";
            $this->statusText  = "NotFound";
        }

    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        //return new PrivateChannel('channel-name');
        return ['extension-status'];
    }

    /**
     * Get Status Extension by code
     *
     * @param $code
     * @return string
     */
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
