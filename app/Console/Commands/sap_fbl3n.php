<?php

namespace App\Console\Commands;

use App\Model\ItemFbl3n;
use Illuminate\Console\Command;
use Rap2hpoutre\FastExcel\FastExcel;

class sap_fbl3n extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sap:fbl3n';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Import the registers action FBL3N in SAP';

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

        $collection = (new FastExcel)->import('import-fbl3n.xlsx');

        // Using ProgressBar
        $bar = $this->output->createProgressBar(count($collection));
        foreach($collection as $line){
            $fbl3n = new ItemFbl3n();
            //$this->info();
            $fbl3n->importLine($line);
            $bar->advance();
        }
        $bar->finish();

        $this->info("\nDone!");
    }
}
