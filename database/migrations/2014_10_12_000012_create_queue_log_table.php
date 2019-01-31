<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQueueLogTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::connection('astk')->create('queue_log', function (Blueprint $table) {
            $table->increments('id');
            $table->timestamp('time')->nullable();
            $table->string('callid',255)->nullable();
            $table->string('queuename',255)->nullable();
            $table->string('agent',255)->nullable();
            $table->string('event',255)->nullable();
            $table->string('data',255)->nullable();
            $table->string('data1',255)->nullable();
            $table->string('data2',255)->nullable();
            $table->string('data3',255)->nullable();
            $table->string('data4',255)->nullable();
            $table->string('data5',255)->nullable();
            $table->timestamp('created')->nullable()->default(DB::raw('CURRENT_TIMESTAMP'));
            //$table->string('',255)->nullable();
        });

        Schema::connection('astk')->create('agent_status', function (Blueprint $table) {
            $table->string('agentId',255)->nullable();
            $table->string('agentName', 255)->nullable();
            $table->string('agentStatus',255)->nullable();
            $table->timestamp('timestamp')->nullable();
            $table->string('callid',255)->nullable();
            $table->string('queue',255)->nullable();
            //$table->string('',255)->nullable();
        });

        Schema::connection('astk')->create('call_status', function (Blueprint $table) {
            $table->string('callId', 255)->nullable();
            $table->string('callerId', 255)->nullable();
            $table->string('status',255)->nullable();
            $table->timestamp('timestamp')->nullable();
            $table->string('queue',255)->nullable();
            $table->string('agent',255)->nullable();
            $table->string('position',255)->nullable();
            $table->string('originalPosition',255)->nullable();
            $table->string('holdtime',255)->nullable();
            $table->string('keyPressed',255)->nullable();
            $table->integer('callduration')->nullable();
            //$table->string('',255)->nullable();
        });

        Schema::connection('astk')->create('queue_log_processed', function (Blueprint $table) {
            $table->increments('recid');
            $table->integer('origid')->nullable();
            $table->string('callid',255)->nullable();
            $table->string('queuename')->nullable();
            $table->string('agentdev',255)->nullable();
            $table->string('event',255)->nullable();
            $table->string('data1',255)->nullable();
            $table->string('data2',255)->nullable();
            $table->string('data3',255)->nullable();
            $table->timestamp('datetime')->nullable();
            $table->integer('callduration')->nullable();
            //$table->string('',255)->nullable();
        });

        //
        // Create Triggers
        //

        DB::connection('astk')->unprepared('
        CREATE TRIGGER `update_processed` AFTER INSERT ON `queue_log`
          FOR EACH ROW BEGIN
            INSERT INTO queue_log_processed (callid,queuename,agentdev,event,data1,data2,data3,datetime)
            VALUES (NEW.callid,NEW.queuename,NEW.agent,NEW.event,NEW.data1,NEW.data2,NEW.data3,NEW.time);
          END
        ');

        DB::connection('astk')->unprepared('
        CREATE TRIGGER `bi_queueEvents` BEFORE INSERT ON `queue_log`
          FOR EACH ROW BEGIN
            IF NEW.event = \'ADDMEMBER\' THEN
                INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'READY\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "READY", timestamp = NEW.time, callid = NULL, queue  = NEW.queuename;
            ELSEIF NEW.event = \'REMOVEMEMBER\' THEN
                INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'LOGGEDOUT\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "LOGGEDOUT", timestamp = NEW.time, callid =  NULL, queue = NEW.queuename;
            ELSEIF NEW.event = \'AGENTLOGIN\' THEN
                INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'LOGGEDIN\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "LOGGEDIN", timestamp = NEW.time, callid = NULL, queue = NEW.queuename;
            ELSEIF NEW.event = \'AGENTLOGOFF\' THEN
                INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'LOGGEDOUT\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "LOGGEDOUT", timestamp = NEW.time, callid = NULL, queue = NEW.queuename;
            ELSEIF NEW.event = \'PAUSE\' THEN
                INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'PAUSE\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "PAUSE", timestamp = NEW.time, callid = NULL, queue = NEW.queuename;
            ELSEIF NEW.event = \'UNPAUSE\' THEN
                INSERT INTO `agent_status` (agentId,agentStatus,timestamp,callid,queue) VALUES (NEW.agent,\'READY\',NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "READY", timestamp = NEW.time, callid = NULL, queue = NEW.queuename;
            ELSEIF NEW.event = \'ENTERQUEUE\' THEN
                REPLACE INTO `call_status` VALUES
                (NEW.callid,NEW.data2,
                \'inQue\',
                NEW.time,
                NEW.queuename,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL,
                0);
            ELSEIF NEW.event = \'CONNECT\' THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                holdtime = NEW.data1,
                agent = NEW.agent
                where callid = NEW.callid;
                INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES
                (NEW.agent,NEW.event,
                NEW.time,
                NEW.callid,
                NEW.queuename)
                ON DUPLICATE KEY UPDATE
                agentStatus = NEW.event,
                timestamp = NEW.time,
                callid = NEW.callid,
                queue = NEW.queuename;
            ELSEIF NEW.event in (\'COMPLETECALLER\',\'COMPLETEAGENT\') THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                originalPosition = NEW.data3,
                holdtime = NEW.data1,
                callduration = NEW.data2,
                agent = NEW.agent
                where callid = NEW.callid;
                INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES  (NEW.agent,NEW.event,NEW.time,NULL,NEW.queuename) ON DUPLICATE KEY UPDATE agentStatus = "READY", timestamp = NEW.time, callid = NULL, queue = NEW.queuename;
            ELSEIF NEW.event in (\'TRANSFER\') THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                holdtime = NEW.data1,
                callduration = NEW.data3,
                agent = NEW.agent
                where callid = NEW.callid;
                INSERT INTO agent_status (agentId,agentStatus,timestamp,callid,queue) VALUES
                (NEW.agent,\'READY\',NEW.time,NULL,NEW.queuename)
                ON DUPLICATE KEY UPDATE
                agentStatus = "READY",
                timestamp = NEW.time,
                callid = NULL,
                queue = NEW.queuename;
            ELSEIF NEW.event in (\'ABANDON\',\'EXITEMPTY\') THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                position = NEW.data1,
                originalPosition = NEW.data2,
                holdtime = NEW.data3,
                agent = NEW.agent
                where callid = NEW.callid;
            ELSEIF NEW.event = \'EXITWITHKEY\' THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                position = NEW.data2,
                keyPressed = NEW.data1,
                agent = NEW.agent
                where callid = NEW.callid;
            ELSEIF NEW.event = \'EXITWITHTIMEOUT\' THEN
                UPDATE `call_status` SET
                callid = NEW.callid,
                status = NEW.event,
                timestamp = NEW.time,
                queue = NEW.queuename,
                position = NEW.data1,
                agent = NEW.agent
                where callid = NEW.callid;
            END IF;
          END
        ');

        //DB::connection('astk')->unprepared('
        //');


    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('astk')->dropIfExists('queue_log');
        Schema::connection('astk')->dropIfExists('queue_log_processed');
        Schema::connection('astk')->dropIfExists('call_status');
        Schema::connection('astk')->dropIfExists('agent_status');
    }
}
