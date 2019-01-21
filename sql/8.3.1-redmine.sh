#!/bin/bash
#
        version=0.1b
#
#       Objetivo:       Executar a tarefa 8.3.1
#

# Variaveis
# Homologacao
#redmineServer=10.72.247.13
#KeyAPI=5241bbedfb4afba4854d8ee5f1db76cb1d5f2756
# Producao
redmineServer=sistemas.tecnologia.pgfn
#ROBERTO KEY ABAIXO COMENTADA NO DIA 07/12/2015
#KeyAPI=da2f5e16a7571a1217c9096e2f8f5404c7e49943
KeyAPI=da2f5e16a7571a1217c9096e2f8f5404c7e49943

export  VI_USERNAME=root VI_PASSWORD='!@#3ws0trh#@!'

itemNumero=8
numAtividadeContinuada=8.3.1
redmineURL="http://${redmineServer}/redmine/projects/demandas-previdenciarjc/issues"
redmineIssuesURL="http://${redmineServer}/redmine/issues"
tracker_id=582
custom_field_id=62
subject="Efetuar backup de configuração de servidores ESXi"
subject="Efetuar backup de configuracao de servidores ESXi"
description=${subject}
# 27 - Emerson
# 28 - Roberto
# 151 - Dante
assigned_to_id=154
# Informe o valor em minutos, use 70% do tempo maximo
tempoFinalizar=50
tempoFinalizar=3

####

dirDestino=/var/backups/esxi-conf
####

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
#        echo '' > $tmpFile
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
	echo '<?xml version="1.0" encoding="UTF-8"?>'				 > ${arqXml}
       # echo '<?xml version="1.0" encoding="ISO-8859-1"?>'                       > ${arqXml}
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
function iniciarTarefa {
	tarefa=$1
        echo '<?xml version="1.0" encoding="UTF-8"?>'                            > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<status_id>2</status_id>\n"					>> ${arqXml}
        echo -en "\t<assigned_to_id>${assigned_to_id}</assigned_to_id>\n"	>> ${arqXml}
#        echo -en "\t<notes>Levantado dados sobre os servidores.</notes>\n"      >> ${arqXml}
	echo '</issue>'                                                         >> ${arqXml}
	${cmdCURL} -H "Content-Type: application/xml" -X PUT --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml
}
function finalizarTarefa {
date

        echo '<?xml version="1.0" encoding="ISO-8859-1"?>'                       > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<notes>\n"							>> ${arqXml}
	echo "Diretório destino: ${dirDestino}"					>> ${arqXml}
	echo "		"							>> ${arqXml}
	echo "Servidores ESXi."							>> ${arqXml}
#####
	echo "|_.Hostname |_.Status |_.Tamanho |_.Data |"					>> ${arqXml}
        	for K in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
	        do
        	        vicfg-cfgbackup --server=s1pgfn${K} -s ${dirDestino}/s1pgfn${K}.tar.gz 2>&1 > /dev/null
                	sizeFile=`ls -lh ${dirDestino}/s1pgfn${K}.tar.gz | awk '{print $5}'`
	                echo "|s1pgfn${K} |$? |${sizeFile} |`date +%Y%m%d`|"			>> ${arqXml}
        	done
		echo ""										>> ${arqXml}
	echo "Código Status"									>> ${arqXml}
	echo "0 = Ok"										>> ${arqXml}
	echo "Qualquer outro código, deve ser devidamente tratado."				>> ${arqXml}
#####
	echo -en "\t</notes>\n"							>> ${arqXml}
        echo '</issue>'                                                         >> ${arqXml}

	tarefa=$1
        ${cmdCURL} -H "Content-Type: text/xml" -X PUT --data-binary \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml

        echo '<?xml version="1.0" encoding="ISO-8859-1"?>'                       > ${arqXml}
        echo '<issue>'                                                          >> ${arqXml}
        echo -en "\t<status_id>3</status_id>\n"                                 >> ${arqXml}
        echo '</issue>'                                                         >> ${arqXml}
        ${cmdCURL} -H "Content-Type: application/xml" -X PUT --data \@${arqXml} -H "X-Redmine-API-Key: ${KeyAPI}" ${redmineIssuesURL}/${tarefa}.xml

	rm -f ${arqXml} ${arqTmp}
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
iniciarTarefa ${numTarefa}
#pausa 5
finalizarTarefa ${numTarefa}

exit
