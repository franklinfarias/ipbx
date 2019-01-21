#!/bin/bash
#
        version=0.1b
#
#       Objetivo:       Executar a tarefa 8.8.5
#

# Variaveis
# Homologacao
#redmineServer=10.72.247.13
#KeyAPI=2f6d4b37b422525a0009d321473167a0b5a9c2ea
# Producao
redmineServer=sistemas.tecnologia.pgfn
#ROBERTO KEY ABAIXO COMENTADA NO DIA 04/04/2017
KeyAPI=da2f5e16a7571a1217c9096e2f8f5404c7e49943


itemNumero=8
numAtividadeContinuada=8.8.5
redmineURL="http://${redmineServer}/redmine/projects/demandas-previdenciarjc/issues"
redmineIssuesURL="http://${redmineServer}/redmine/issues"
tracker_id=582
custom_field_id=62
subject="Verificar alertas e disponibilidades de servidores"
description=${subject}
# 27 - Emerson
# 28 - Roberto
# 151 - Dante 
assigned_to_id=154
# Informe o valor em minutos, use 70% do tempo maximo
tempoFinalizar=65

scriptName=`echo $0 | awk -F'/' '{print $NF}' | sed 's/\.sh//g'`
arqLog=~/log/${scriptName}.log
arqTmp=~/tmp/${scriptName}.tmp
arqXml=~/tmp/${scriptName}.xml
tmpGetListContinuada=${HOME}/tmp/geraList_xml.tmp

cmdCURL='curl'
#############

function pausa {
# Uma pausa
	MIN=1
	MAX=$1
	rnd=$(( $RANDOM % ($MAX - $MIN) + $MIN ))
	date
	echo "sleep ${rnd}m"
	sleep ${rnd}m
}
function getTarefa {
echo "getTarefa"

        echo "<?xml version="1.0" encoding="ISO-8859-1"?>"               > ${tmpGetListContinuada}
        echo '<issue>'                                                  >> ${tmpGetListContinuada}
# tracker_id
        echo -e "\t<tracker_id>${tracker_id}</tracker_id>"              >> ${tmpGetListContinuada}
        echo '</issue>'                                                 >> ${tmpGetListContinuada}
# Gera a tarefa com saida para temporario
        ${cmdCURL} -H "Content-Type: application/xml" -H "Content-Type: text/html; charset=ISO-8859-1" -X POST --data \@${tmpGetListContinuada} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineURL} > ${arqTmp}

        iniLista=`grep -n '="issue_custom_field_values_' ${arqTmp} | cut -d':' -f1`
        fimLista=`wc -l ${arqTmp} | cut -d' ' -f1`
        tail -`expr $fimLista - $iniLista + 1` ${arqTmp} | grep '<option value="' | awk -F'<option value="'${itemNumero} '{print $2}' | awk -F'">'${numAtividadeContinuada}. '{print $1}' | sed "s/^./${itemNumero}./g"

	rm -f ${tmpGetListContinuada}
}
function criaTarefa {
echo "criaTarefa"

# Gera a tarefa com saida para temporario
        ${cmdCURL} -H "Content-Type: application/xml" -X POST --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineURL}.xml	> ${arqTmp} 
# Pega o numero da tarefa
        numTarefa="`grep '<id>.*</id>' $arqTmp | awk -F'<issue><id>' '{print $2}' | cut -d'<' -f1`"
# Entrada para arquivo de log
        echo "`date +%Y%m%d-%H%M` - ${numAtividadeContinuada} - ${subject} - No. ${numTarefa}"	>> ${arqLog}
# Apaga os temp.
        rm -f ${arqXml} ${arqTmp}
}
function criaXmlItem {
echo "criaXmlItem"

	echo '<?xml version="1.0" encoding="UTF-8"?>'				 > ${arqXml}
	echo '<issue>'								>> ${arqXml}
	echo -en "\t<tracker_id>${tracker_id}</tracker_id>\n"			>> ${arqXml}
	echo -en "\t<subject>${subject}</subject>\n"				>> ${arqXml}
	echo -en "\t<description>${description}</description>\n"		>> ${arqXml} 
	echo -en "\t<custom_fields type=\"array\">\n"				>> ${arqXml}
	echo -en "\t\t<custom_field id=\"${custom_field_id}\">\n"		>> ${arqXml}
	echo -en "\t\t\t<value>"						>> ${arqXml}
	echo -n "`getTarefa | grep ${numAtividadeContinuada} | sed 's/"//g'`"	>> ${arqXml}
	echo -en "</value>\n"							>> ${arqXml}
	echo -en "\t\t</custom_field>\n"					>> ${arqXml}
	echo -en "\t</custom_fields>\n"						>> ${arqXml}
	echo '</issue>'								>> ${arqXml}
}
function iniciaTarefa {
echo "iniciaTarefa"

	tarefa=$1
        echo '<?xml version="1.0" encoding="UTF-8"?>'                            > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<status_id>2</status_id>\n"					>> ${arqXml}
        echo -en "\t<assigned_to_id>${assigned_to_id}</assigned_to_id>\n"	>> ${arqXml}
        echo -en "\t<notes>Levantado dados sobre os servidores.</notes>\n"      >> ${arqXml}
	echo '</issue>'                                                         >> ${arqXml}
	${cmdCURL} -H "Content-Type: application/xml" -X PUT --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml
}
function tarefaPendente {
echo "tarefaPendente"

	tarefa=$1
	aviso=$2
        echo '<?xml version="1.0" encoding="UTF-8"?>'                            > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<status_id>8</status_id>\n"					>> ${arqXml}
        echo -en "\t<assigned_to_id>${assigned_to_id}</assigned_to_id>\n"	>> ${arqXml}
        echo -en "\t<notes>${aviso}</notes>\n"      				>> ${arqXml}
	echo '</issue>'                                                         >> ${arqXml}
	${cmdCURL} -H "Content-Type: application/xml" -X PUT --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml
        rm -f ${arqXml} ${arqTmp}
}
function finalizaTarefa {
echo "finalizaTarefa"

	tarefa=$1
        echo '<?xml version="1.0" encoding="ISO-8859-1"?>'                       > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<status_id>3</status_id>\n"                                 >> ${arqXml}
        echo '</issue>'                                                         >> ${arqXml}
        ${cmdCURL} -H "Content-Type: application/xml" -X PUT --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml
	rm -f ${arqXml} ${arqTmp} 
}
function executaTarefa {
echo "executaTarefa"
date
# Tempo de execução uns 10min
        tarefa=$1
        echo '<?xml version="1.0" encoding="ISO-8859-1"?>'                       > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<notes>\n"                                                  >> ${arqXml}
####
# Execucao da tarefa
# Site 1

	resultHtml="$HOME/tmp/vmware_health_report.html"
	vmwarevSphereHealthCheck_Opts="--report ${resultHtml}"

	statusTarefa='TRUE'

	namevCenter="10.72.244.25"
	for CLUSTER in "CLUSTER-A" "CLUSTER-B"
	do
        	echo "*Cluster: ${CLUSTER}*"				 >> ${arqXml}
	        echo ""							 >> ${arqXml}
	        echo "*ESX/ESXi State:*"				 >> ${arqXml}
	        echo ""							 >> ${arqXml}
	        echo "|_.HOSTNAME |_.OVERALL STATUS |_.POWER STATE |_.BOOT TIME |_.UPTIME |_.HA STATE |_.CONNECTION STATE |_.MAINTENANCE MODE |_.STANDBY MODE |_.VMOTION ENABLED |_.VERSION |"	 >> ${arqXml}
        	./vmwarevSphereHealthCheck.pl ${vmwarevSphereHealthCheck_Opts} --server ${namevCenter} --type cluster --cluster ${CLUSTER} > 2&>1 /dev/null

	        linhaInicio=`grep -n '<h3>ESX/ESXi State:</h3>' ${resultHtml} | cut -d':' -f1`
	        linhaFim=`grep -n '<h3>ESX/ESXi Management Info:</h3>' ${resultHtml} | cut -d':' -f1`

        	for (( numLinha=${linhaInicio}+3; numLinha <= ${linhaFim}-3; numLinha++ ))
	        do
        	        awk NR==${numLinha} ${resultHtml} | sed 's/<tr><td>/\|/g' | sed 's/<td /<td>/g' | sed 's/bgcolor="*./\%{background:#/g' | sed 's/">/\}/g' | sed 's/<\/td><td>/\|/g' | sed 's/<\/td><\/tr>/\|/g' | sed 's/|/%|/3'				>> ${arqXml}
# Liga flag de problema
			awk NR==${numLinha} ${resultHtml} | egrep 'HOST has a problem' && statusTarefa='FALSE'
	        done
        	echo ""							>> ${arqXml}
	        rm -f ${resultHtml}
	done
####
        echo -en "\t</notes>\n"                                                 >> ${arqXml}
        echo '</issue>'                                                         >> ${arqXml}

        ${cmdCURL} -H "Content-Type: text/xml" -X PUT --data-binary \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml

# Verificar Finaliza ou Pendente
#echo ${statusTarefa}
	if [ ${statusTarefa} = 'TRUE' ];then
		echo "Finalizar tarefa ${tarefa}"
		finalizaTarefa ${tarefa}
	  else
		echo "Tarefa ${tarefa} pendente..."
		tarefaPendente ${tarefa} "Verificar alerta em servidor."
	fi
}
function getServer {
        redmineServer=`grep redmineServer ${pathnameArqConf} | grep -v ^# | cut -d'=' -f2 | tr -d [:cntrl:]`
        if [ -z ${redmineServer} ];then
                echo "Nao foi informado variavel para servidor... Saindo!!" ; exit 1
        fi
}
function getAuth {
        keyApi=`grep Key-API ${pathnameArqConf} | grep -v ^# | cut -d'=' -f2 | tr -d [:cntrl:]`
        if [ -z ${keyApi} ];then
                echo "Nao foi informado variavel para autenticacao... Saindo!!" ; exit 1
        fi
}
#### main ####
#echo ${arqTmp} ${arqLog}
export LANG=en_US.UTF-8

pathnameArqConf="${HOME}/etc/item${itemNumero}.conf"
getAuth ${itemNumero}
getServer

if [ -z $1 ];then
	criaXmlItem
	criaTarefa
  else
	numTarefa=$1
fi

#pausa 3
iniciaTarefa ${numTarefa}
#pausa ${tempoFinalizar}
executaTarefa ${numTarefa}
finalizaTarefa ${numTarefa}
exit
