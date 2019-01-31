<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class queueLogToDB extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'queuelog:import';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import queue logs to database';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $start = mktime();

        $PATH_QUEUE_LOG = env('ASTK_PATH_QUEUE_LOG','/var/log/asterisk/');

        $handle = fopen($PATH_QUEUE_LOG . "queue_log", "r");
        $linecount = 0;
        while(!feof($handle)){
            $line = fgets($handle);
            $linecount++;
        }
        fclose($handle);
        $handle = fopen($PATH_QUEUE_LOG . "queue_log", "r");
        if ($handle) {
            $bar = $this->output->createProgressBar($linecount);
            while (($line = fgets($handle)) !== false) {
                $array = explode("|",$line);
                $time = gmdate('Y-m-d H:i:s', $array[0]);
                $callId = trim($array[1]);
                $queueName = trim($array[2]);
                $agent = trim($array[3]);
                $event = trim($array[4]);
                $data1 = (count($array) > 5 ? trim($array[5]) : '');
                $data2 = (count($array) > 6 ? trim($array[6]) : '');
                $data3 = (count($array) > 7 ? trim($array[7]) : '');
                $data4 = (count($array) > 8 ? trim($array[8]) : '');
                $data5 = (count($array) > 9 ? trim($array[9]) : '');

                $rs = DB::connection('astk')->select("select count(*) as qtd from asteriskcdrdb.queue_log ".
                      "where time = '$time' AND callid = '$callId' AND queuename = '$queueName' AND event = '$event'");

                //dd("$time|$callId|$queueName|$agent|$event");

                if ($rs[0]->qtd <= 0){
                    DB::connection('astk')->insert("INSERT INTO queue_log (time,callid,queuename,agent,event,data1,data2,data3,data4,data5) VALUES ('$time','$callId','$queueName','$agent','$event','$data1','$data2','$data3','$data4','$data5')");
                    //$this->info(" \nInserted: $line");
                } else {
                    //$this->info(" \nExists: $line");
                }
                $bar->advance();
            }
            $bar->finish();
            fclose($handle);
        } else {
            $this->info(" \nerror opening the file.");
        }

        $timeDiff = date("H:i:s", mktime() - $start);

        $this->info("\nTime $timeDiff. Done!");
    }
}
