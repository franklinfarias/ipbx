USE asteriskcdrdb;
--
-- Functions
--
DELIMITER $$
CREATE FUNCTION asteriskcdrdb.fncTimeToInt (tTime TIME)
RETURNS int(11)
COMMENT 'Retorna Hora no formato inteiro'
BEGIN
    RETURN HOUR(tTime) * 3600 + MINUTE(tTime) * 60 + SECOND(tTime);
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION `fncIntToTime` (dtData INT)
RETURNS varchar(12)
COMMENT 'Retorna Hora no formato HH:MM:SS'
BEGIN
    DECLARE sumHoras INT;
    DECLARE horaCalc INT;
    DECLARE minutoCalc INT;
    DECLARE segundoCalc INT;
    /*-->> Método para cálculo de HORAS*/
    SET sumHoras = dtData;
    SET horaCalc = FLOOR(sumHoras / 3600);
    SET sumHoras = sumHoras - (horaCalc * 3600);
    SET minutoCalc = FLOOR(sumHoras / 60);
    SET sumHoras = sumHoras - (minutoCalc * 60);
    SET segundoCalc = sumHoras;
    RETURN CONCAT(lpad(horaCalc, length(horaCalc), '0'),':',lpad(minutoCalc, 2, '0'),':',lpad(segundoCalc, 2, '0'));
END$$

DELIMITER ;

--
-- Views General
--
--
-- View CDR usado para facilitar a extracao de informacoes
--
drop view if exists asteriskcdrdb.vw_cdr;
create view asteriskcdrdb.vw_cdr as
select
uniqueid,
calldate,
src,
dst,
lastapp,
dcontext,
duration,
billsec,
substring_index(substring_index(channel,'-',1),'/',-1) as id_srcchannel,
substring_index(substring_index(dstchannel,'-',1),'/',-1) as id_dstchannel,
disposition
from asteriskcdrdb.cdr where 1=1
-- and date(calldate) between '2017-08-04' and '2017-08-04'
;
--
-- View CDR Calls usado para facilitar a extracao de informacoes
--
drop view if exists asteriskcdrdb.vw_cdr_calls;
create view asteriskcdrdb.vw_cdr_calls as
select
d.id as extension, d.description as user_name,
calls.*
,if(calls.dst = d.id or calls.id_dstchannel = d.id, 1, 0) as num_incoming_call
,if(calls.src = d.id or calls.id_srcchannel = d.id, 1, 0) as num_outgoing_call
,if(calls.dst = d.id or calls.id_dstchannel = d.id, calls.billsec, 0) as duration_incoming_call
,if(calls.src = d.id or calls.id_srcchannel = d.id, calls.billsec, 0) as duration_outgoing_call
from asterisk.devices d
join asteriskcdrdb.vw_cdr calls on (calls.src = d.id or calls.id_srcchannel = d.id or calls.dst = d.id or calls.id_dstchannel = d.id)
where 1=1
;
--
-- Day of Week
--
drop view if exists vw_day_of_week;
create view vw_day_of_week as
    select 1 AS `id_week`, 'Domingo' AS `day_of_week`
    union all select 2 AS `id_week`, 'Segunda' AS `day_of_week`
    union all select 3 AS `id_week`, 'Terça' AS `day_of_week`
    union all select 4 AS `id_week`, 'Quarta' AS `day_of_week`
    union all select 5 AS `id_week`, 'Quinta' AS `day_of_week`
    union all select 6 AS `id_week`, 'Sexta' AS `day_of_week`
    union all select 7 AS `id_week`, 'Sábado' AS `day_of_week`;
--
-- Mes e Ano Corrente
--
drop view if exists asteriskcdrdb.vw_mes_ano;
create view asteriskcdrdb.vw_mes_ano as
select
lpad(1,2,'0') as mes, 'Jan' as descricao,
extract(year from current_date) as ano
union
select
lpad(2,2,'0') as mes, 'Fev' as descricao,
extract(year from current_date) as ano
union
select
lpad(3,2,'0') as mes, 'Mar' as descricao,
extract(year from current_date) as ano
union
select
lpad(4,2,'0') as mes, 'Abr' as descricao,
extract(year from current_date) as ano
union
select
lpad(5,2,'0') as mes, 'Mai' as descricao,
extract(year from current_date) as ano
union
select
lpad(6,2,'0') as mes, 'Jun' as descricao,
extract(year from current_date) as ano
union
select
lpad(7,2,'0') as mes, 'Jul' as descricao,
extract(year from current_date) as ano
union
select
lpad(8,2,'0') as mes, 'Ago' as descricao,
extract(year from current_date) as ano
union
select
lpad(9,2,'0') as mes, 'Set' as descricao,
extract(year from current_date) as ano
union
select
10 as mes, 'Out' as descricao,
extract(year from current_date) as ano
union
select
11 as mes, 'Nov' as descricao,
extract(year from current_date) as ano
union
select
12 as mes, 'Dez' as descricao,
extract(year from current_date) as ano
;
--
-- Quantidade Chamadas por Dia
--
drop view if exists asteriskcdrdb.vw_calls_by_day;
create view asteriskcdrdb.vw_calls_by_day as
select
cdr.extension,
date(cdr.calldate) as calldate,
sum(if((cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_entrantes,
sum(if((cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_saintes
from asteriskcdrdb.vw_cdr_calls cdr
left join asterisk.devices ext on (cdr.src = ext.id or cdr.id_srcchannel = ext.id or cdr.dst = ext.id or cdr.id_dstchannel = ext.id)
where 1=1
group by cdr.extension, date(cdr.calldate)
;
--
-- Quantidade Chamadas por Dia e Hora
--
drop view if exists asteriskcdrdb.vw_calls_by_day_hour;
create view asteriskcdrdb.vw_calls_by_day_hour as
select
date(cdr.calldate) as calldate,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_08_entrantes,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_08_saintes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_09_entrantes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_09_saintes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_10_entrantes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_10_saintes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_11_entrantes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_11_saintes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_12_entrantes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_12_saintes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_13_entrantes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_13_saintes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_14_entrantes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_14_saintes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_15_entrantes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_15_saintes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_16_entrantes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_16_saintes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_17_entrantes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_17_saintes
from asteriskcdrdb.vw_cdr cdr
join asterisk.devices ext on (cdr.src = ext.id or cdr.id_srcchannel = ext.id or cdr.dst = ext.id or cdr.id_dstchannel = ext.id)
where 1=1
group by date(cdr.calldate)
;
--
-- View Quantidade de Chamadas Entrantes e Saintes por Hora por Extensao
--
drop view if exists asteriskcdrdb.vw_calls_by_user_hour;
create view asteriskcdrdb.vw_calls_by_user_hour as
select
date(cdr.calldate) as calldate,
ext.id as extension, ext.description as user_name,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_08_entrantes,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_08_saintes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_09_entrantes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_09_saintes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_10_entrantes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_10_saintes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_11_entrantes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_11_saintes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_12_entrantes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_12_saintes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_13_entrantes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_13_saintes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_14_entrantes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_14_saintes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_15_entrantes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_15_saintes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_16_entrantes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_16_saintes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), 1, 0)) as qt_17_entrantes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), 1, 0)) as qt_17_saintes
from asteriskcdrdb.vw_cdr cdr
join asterisk.devices ext on (cdr.src = ext.id or cdr.id_srcchannel = ext.id or cdr.dst = ext.id or cdr.id_dstchannel = ext.id)
and date(cdr.calldate) between current_date and current_date
where 1=1
group by date(cdr.calldate), ext.id, ext.description
;
--
-- Duracao Chamada por Dia e Hora
--
drop view if exists asteriskcdrdb.vw_duration_by_day_hour;
create view asteriskcdrdb.vw_duration_by_day_hour as
select
date(cdr.calldate) as calldate,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_08_entrantes,
sum(if((time(cdr.calldate) >= '08:00:00' and time(cdr.calldate) <= '08:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_08_saintes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_09_entrantes,
sum(if((time(cdr.calldate) >= '09:00:00' and time(cdr.calldate) <= '09:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_09_saintes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_10_entrantes,
sum(if((time(cdr.calldate) >= '10:00:00' and time(cdr.calldate) <= '10:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_10_saintes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_11_entrantes,
sum(if((time(cdr.calldate) >= '11:00:00' and time(cdr.calldate) <= '11:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_11_saintes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_12_entrantes,
sum(if((time(cdr.calldate) >= '12:00:00' and time(cdr.calldate) <= '12:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_12_saintes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_13_entrantes,
sum(if((time(cdr.calldate) >= '13:00:00' and time(cdr.calldate) <= '13:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_13_saintes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_14_entrantes,
sum(if((time(cdr.calldate) >= '14:00:00' and time(cdr.calldate) <= '14:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_14_saintes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_15_entrantes,
sum(if((time(cdr.calldate) >= '15:00:00' and time(cdr.calldate) <= '15:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_15_saintes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_16_entrantes,
sum(if((time(cdr.calldate) >= '16:00:00' and time(cdr.calldate) <= '16:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_16_saintes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.dst = ext.id or cdr.id_dstchannel = ext.id), cdr.billsec, 0)) as dur_17_entrantes,
sum(if((time(cdr.calldate) >= '17:00:00' and time(cdr.calldate) <= '17:59:59') and (cdr.src = ext.id or cdr.id_srcchannel = ext.id), cdr.billsec, 0)) as dur_17_saintes
from asteriskcdrdb.vw_cdr cdr
join asterisk.devices ext on (cdr.src = ext.id or cdr.id_srcchannel = ext.id or cdr.dst = ext.id or cdr.id_dstchannel = ext.id)
where 1=1
group by date(cdr.calldate)
;
--
-- View LastCall :: Chamadas que foram realizadas Com Sucesso
--
drop view if exists asteriskcdrdb.vw_lastcall;
create view asteriskcdrdb.vw_lastcall as
select src, dst, max(calldate) as maxcalldate
from asteriskcdrdb.cdr
where 1=1
and lastapp = 'Dial'
and disposition = 'ANSWERED'
and billsec > 0
-- AND date(calldate) BETWEEN '2017-08-04' AND '2017-08-04'
group by src, dst
order by 3
;

--
-- Dashboard Widgets
--
--
-- Dashboard widgets
-- Estatística Anual por Extensão
--
drop view if exists asteriskcdrdb.vw_dashboard_user_widget3;
create view asteriskcdrdb.vw_dashboard_user_widget3 as
select
calls.extension,
mesAno.mes, mesAno.ano,
coalesce(sum(qt_entrantes),0) as qt_entrantes,
coalesce(sum(qt_saintes),0) as qt_saintes
from asteriskcdrdb.vw_mes_ano mesAno
left join asteriskcdrdb.vw_calls_by_day calls on mesAno.mes = month(calldate) and mesAno.ano = year(calldate)
where 1=1
group by calls.extension, mesAno.mes, mesAno.ano
;
--
-- Dashboard widgets
-- Estatísticas por Extensão
--
drop view if exists asteriskcdrdb.vw_dashboard_user_widget2;
create view asteriskcdrdb.vw_dashboard_user_widget2 as
select
*
from asteriskcdrdb.vw_calls_by_user_hour
where 1=1
;
--
-- Dashboard widgets
-- Estatísticas por Extensão
--
drop view if exists asteriskcdrdb.vw_dashboard_user_widget1;
create view asteriskcdrdb.vw_dashboard_user_widget1 as
select
extension, user_name,
sum(num_incoming_call) as num_incoming_call,
sum(num_outgoing_call) as num_outgoing_call,
sum(duration_incoming_call) as duration_incoming_call,
asteriskcdrdb.fncIntToTime(sum(duration_incoming_call)) as time_duration_incoming_call,
sum(duration_outgoing_call) as duration_outgoing_call,
asteriskcdrdb.fncIntToTime(sum(duration_outgoing_call)) as time_duration_outgoing_call
from asteriskcdrdb.vw_cdr_calls
where 1=1
and year(calldate) = year(current_date)
and month(calldate) = month(current_date)
group by extension, user_name
order by 1
;
--
-- Dashboard widgets
-- Efetividade de atendimento
--
drop view if exists asteriskcdrdb.vw_dashboard_widget8;
create view asteriskcdrdb.vw_dashboard_widget8 as
select
coalesce(sum(if(status = 'ABANDON',1,0)),0) as qt_abandon,
coalesce(sum(if((status = 'COMPLETEAGENT' or status = 'COMPLETECALLER'),1,0)),0) as qt_receive,
coalesce(sum(if(status = 'ABANDON',1,0)) + sum(if((status = 'COMPLETEAGENT' or status = 'COMPLETECALLER'),1,0)),0) as total,
coalesce(round(sum(if((status = 'COMPLETEAGENT' or status = 'COMPLETECALLER'),1,0))*100 / (sum(if(status = 'ABANDON',1,0)) + sum(if((status = 'COMPLETEAGENT' or status = 'COMPLETECALLER'),1,0)))),0) as perc
from asteriskcdrdb.call_status
where 1=1
and date(timestamp) = current_date
order by 1
;
--
-- Dashboard widgets
-- Total de Chamadas Geral
--
drop view if exists asteriskcdrdb.vw_dashboard_widget7;
create view asteriskcdrdb.vw_dashboard_widget7 as
select
date(calls.calldate) as calldate,
sum(if(calls.dst = d.id or calls.id_dstchannel = d.id, 1, 0)) as num_incoming_call,
sum(if(calls.src = d.id or calls.id_srcchannel = d.id, 1, 0)) as num_outgoing_call,
asteriskcdrdb.fncIntToTime(sum(if(calls.dst = d.id or calls.id_dstchannel = d.id, calls.billsec, 0))) as duration_incoming_call,
asteriskcdrdb.fncIntToTime(sum(if(calls.src = d.id or calls.id_srcchannel = d.id, calls.billsec, 0))) as duration_outgoing_call
from asterisk.devices d
join asteriskcdrdb.vw_cdr calls on (calls.src = d.id or calls.id_srcchannel = d.id or calls.dst = d.id or calls.id_dstchannel = d.id)
and date(calls.calldate) between DATE_SUB(current_date, INTERVAL 12 DAY) and current_date
where date(calls.calldate) is not null
-- and $filter
group by date(calls.calldate)
;

--
-- Dashboard widgets
-- Chamadas nas Filas
--
drop view if exists asteriskcdrdb.vw_dashboard_widget6;
create view asteriskcdrdb.vw_dashboard_widget6 as
select
date(timestamp) as calldate,
count(*) as qt
from asteriskcdrdb.call_status
where 1=1
and status IN ('COMPLETEAGENT','COMPLETECALLER')
and date(timestamp) between DATE_SUB(current_date, INTERVAL 12 day) and current_date
group by date(timestamp)
;

--
-- Dashboard widgets
-- Hourly & Monthly Statistics
--
drop view if exists asteriskcdrdb.vw_dashboard_widget5_2;
create view asteriskcdrdb.vw_dashboard_widget5_2 as
select
mesAno.mes, mesAno.ano,
coalesce(sum(qt_entrantes),0) as qt_entrantes,
coalesce(sum(qt_saintes),0) as qt_saintes
from asteriskcdrdb.vw_mes_ano mesAno
left join asteriskcdrdb.vw_calls_by_day calls on mesAno.mes = month(calldate) and mesAno.ano = year(calldate)
where 1=1
group by mesAno.mes, mesAno.ano
;

drop view if exists asteriskcdrdb.vw_dashboard_widget5_1;
create view asteriskcdrdb.vw_dashboard_widget5_1 as
select
calldate,
coalesce(qt_08_entrantes,0) as qt_08_entrantes,
coalesce(qt_08_saintes,0) as qt_08_saintes,
coalesce(qt_09_entrantes,0) as qt_09_entrantes,
coalesce(qt_09_saintes,0) as qt_09_saintes,
coalesce(qt_10_entrantes,0) as qt_10_entrantes,
coalesce(qt_10_saintes,0) as qt_10_saintes,
coalesce(qt_11_entrantes,0) as qt_11_entrantes,
coalesce(qt_11_saintes,0) as qt_11_saintes,
coalesce(qt_12_entrantes,0) as qt_12_entrantes,
coalesce(qt_12_saintes,0) as qt_12_saintes,
coalesce(qt_13_entrantes,0) as qt_13_entrantes,
coalesce(qt_13_saintes,0) as qt_13_saintes,
coalesce(qt_14_entrantes,0) as qt_14_entrantes,
coalesce(qt_14_saintes,0) as qt_14_saintes,
coalesce(qt_15_entrantes,0) as qt_15_entrantes,
coalesce(qt_15_saintes,0) as qt_15_saintes,
coalesce(qt_16_entrantes,0) as qt_16_entrantes,
coalesce(qt_16_saintes,0) as qt_16_saintes,
coalesce(qt_17_entrantes,0) as qt_17_entrantes,
coalesce(qt_17_saintes,0) as qt_17_saintes
from asteriskcdrdb.vw_calls_by_day_hour
where 1=1
and date(calldate) = current_date
;
--
-- Dashboard widgets
-- Perdidas: today, last week, last month
--
drop view if exists asteriskcdrdb.vw_dashboard_abandon_today;
create view asteriskcdrdb.vw_dashboard_abandon_today as
select
count(*) as today
from asteriskcdrdb.call_status
where 1=1
and status in ('ABANDON')
and date(timestamp) = current_date
;
drop view if exists asteriskcdrdb.vw_dashboard_abandon_lastweek;
create view asteriskcdrdb.vw_dashboard_abandon_lastweek as
select
count(*) as lastweek
from asteriskcdrdb.call_status
where 1=1
and status in ('ABANDON')
and date(timestamp) between date_sub(current_date, interval 7 day) and current_date
;
drop view if exists asteriskcdrdb.vw_dashboard_abandon_lastmonth;
create view asteriskcdrdb.vw_dashboard_abandon_lastmonth as
select
count(*) as lastmonth
from asteriskcdrdb.call_status
where 1=1
and status in ('ABANDON')
and date(timestamp) between concat(year(date_sub(current_date, interval 1 month)),'-',lpad(month(date_sub(current_date, interval 1 month)),2,'0'),'-','01') and last_day(date_sub(current_date, interval 1 month))
;
drop view if exists asteriskcdrdb.vw_dashboard_widget4;
create view asteriskcdrdb.vw_dashboard_widget4 as
select
*
from asteriskcdrdb.vw_dashboard_abandon_today,
asteriskcdrdb.vw_dashboard_abandon_lastweek,
asteriskcdrdb.vw_dashboard_abandon_lastmonth
;

--
-- Dashboard widgets
-- Tempos: TMA, TME, TMB (tempo Medio de Abandono), MnE (Tempo Mínimo Espera), MxE (Tempo Máximo de Espera)
--
drop view if exists asteriskcdrdb.vw_dashboard_tmt;
create view asteriskcdrdb.vw_dashboard_tmt as
select
round(100-((sum(holdtime)*100)/sum(callduration)),2) as perc_duration,
asteriskcdrdb.fncIntToTime(sum(callduration)) as time_duration
from asteriskcdrdb.call_status
where 1=1
and date(timestamp) = current_date
;
drop view if exists asteriskcdrdb.vw_dashboard_tma_tme;
create view asteriskcdrdb.vw_dashboard_tma_tme as
select
asteriskcdrdb.fncIntToTime(floor(avg(callduration))) as time_tma,
asteriskcdrdb.fncIntToTime(floor(avg(holdtime))) as time_tme
from asteriskcdrdb.call_status
where 1=1
and status in ('COMPLETEAGENT')
and date(timestamp) = current_date
;
drop view if exists asteriskcdrdb.vw_dashboard_tmbm;
create view asteriskcdrdb.vw_dashboard_tmbm as
select
asteriskcdrdb.fncIntToTime(floor(avg(holdtime))) as time_tmb
from asteriskcdrdb.call_status
where 1=1
and status in ('ABANDON')
and date(timestamp) = current_date
;
drop view if exists asteriskcdrdb.vw_dashboard_mxe;
create view asteriskcdrdb.vw_dashboard_mxe as
select
asteriskcdrdb.fncIntToTime(min(holdtime)) as min_hold_time,
asteriskcdrdb.fncIntToTime(max(holdtime)) as max_hold_time
from asteriskcdrdb.call_status
where 1=1
and status in ('COMPLETEAGENT')
and date(timestamp) = current_date
;
--
--
drop view if exists asteriskcdrdb.vw_dashboard_widget3;
create view asteriskcdrdb.vw_dashboard_widget3 as
select
*
from asteriskcdrdb.vw_dashboard_tmt,
asteriskcdrdb.vw_dashboard_tma_tme,
asteriskcdrdb.vw_dashboard_tmbm,
asteriskcdrdb.vw_dashboard_mxe
;

--
-- Dashboard widgets
-- Quantidade de Agentes Associadoas às Filas
--
drop view if exists asteriskcdrdb.vw_dashboard_widget2;
create view asteriskcdrdb.vw_dashboard_widget2 as
select distinct
substring(data,locate('/',data)+1,4) as extension
from asterisk.queues_details
where 1=1
and keyword = 'member'
-- group by 1
order by 1
;
--
-- Dashboard widgets
-- Quantidade de Chamadas Realizadas e Recebidas
--
drop view if exists asteriskcdrdb.vw_dashboard_widget1;
create view asteriskcdrdb.vw_dashboard_widget1 as
select
-- d.id as extension, d.description as user_name,
sum(if(calls.dst = d.id or calls.id_dstchannel = d.id, 1, 0)) as num_incoming_call,
sum(if(calls.src = d.id or calls.id_srcchannel = d.id, 1, 0)) as num_outgoing_call,
asteriskcdrdb.fncIntToTime(sum(if(calls.dst = d.id or calls.id_dstchannel = d.id, calls.billsec, 0))) as duration_incoming_call,
asteriskcdrdb.fncIntToTime(sum(if(calls.src = d.id or calls.id_srcchannel = d.id, calls.billsec, 0))) as duration_outgoing_call
from asterisk.devices d
join asteriskcdrdb.vw_cdr calls on (calls.src = d.id or calls.id_srcchannel = d.id or calls.dst = d.id or calls.id_dstchannel = d.id)
and date(calls.calldate) = current_date
where 1=1
-- and $filter
-- group by 1
order by 1
;