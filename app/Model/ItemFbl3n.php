<?php
/**
 * Client.php : PHP S2N
 * Website: http://fksapiens.com.br/
 *
 * Copyright (c) 1999 - 2017 Franklin Farias <franklin@fksapiens.com.br>
 * All Rights Reserved.
 *
 * This software is released under the terms of the GNU Lesser General Public License v2.1
 * A copy of which is available from http://www.gnu.org/copyleft/lesser.html
 *
 * Written for PHP 5.4, should work with older PHP 4.x versions.
 *
 * Please submit bug reports, patches, etc to http://wiki.fksapiens.com.br/
 * Thanks. :)
 *
 *
 * @version 1.0
 */

namespace App\Model;

class ItemFbl3n extends S2NModel
{
    protected $table = 'item_fbl3n';
    protected $primaryKey = 'id_item_fbl3n';

    /**
     * @param $dateSerial
     * @return false|string
     */
    private function convertDateSerialToDate($dateSerial){
        if (!empty($dateSerial))
            return gmdate("Y-m-d",($dateSerial - 25569) * 86400);
        else
            return '';
    }

    /**
     * @param $codeReason
     * @param $yearMonthRef
     * @param $dtRegistryDocument
     * @param $valueAmount
     * @return bool
     */
    private function existRegister($codeReason,$yearMonthRef,$dtRegistryDocument,$valueAmount){
        $item = ItemFbl3n::where('code_reason_account',$codeReason)
            ->where('year_month_reference',$yearMonthRef)
            ->where('dt_registry_document',$dtRegistryDocument)
            ->where('value_amount',$valueAmount)
            ->count();
        return ($item>0);
    }

    /**
     * @param $lineXLSX
     */
    public function importLine($lineXLSX){
        // Tratar os dados
        $codeReason = $lineXLSX['Conta do Razão'];
        $descGroup = utf8_decode($lineXLSX['Nome 1']);
        $txtDocument = utf8_decode($lineXLSX['Texto cabeçalho documento']);
        $codeReference = $lineXLSX['Referência'];
        $attribution = utf8_decode($lineXLSX['Atribuição']);
        $numDocument = $lineXLSX['Nº documento'];
        $typeDocument = $lineXLSX['Tipo de documento'];
        $yearMonthReference = str_replace('/','', $lineXLSX['Ano/Mês']);
        $dtDocument = $this->convertDateSerialToDate($lineXLSX['Data do documento']);
        $dtRegistryDocument = $this->convertDateSerialToDate($lineXLSX['Data de lançamento']);
        $reversalIndicator = $lineXLSX['Indicador de estorno'];
        $valueAmount = $lineXLSX['Montante em moeda interna'];
        $description = utf8_decode($lineXLSX['Texto']);
        $costCenter = $lineXLSX['Centro custo'];
        $orderInternal = $lineXLSX['Ordem'];
        $amendsDocument = $lineXLSX['Doc.compensação'];
        $material = $lineXLSX['Material'];
        $username = $lineXLSX['Nome do usuário'];
        $dtInput = $this->convertDateSerialToDate($lineXLSX['Data de entrada']);

        //\Log::info("[$codeReason,$descGroup,$txtDocument,$codeReference,$attribution,$numDocument,$typeDocument,
        //    $yearMonthReference,$dtDocument,$dtRegistryDocument,$reversalIndicator,$valueAmount,$description,
        //    $costCenter,$orderInternal,$amendsDocument,$material,$username,$dtInput]");

        // Verificar se existe o registro
        // a checagem será pelo: Razao, Mes-Ano, Lancamento e Valor
        if ((!$this->existRegister($codeReason,$yearMonthReference,$dtRegistryDocument,$valueAmount))
          && (!empty($codeReason))){
            $this->code_reason_account = $codeReason;
            $this->desc_group = $descGroup;
            $this->txt_document = $txtDocument;
            $this->code_reference = $codeReference;
            $this->attribution = $attribution;
            $this->num_document = $numDocument;
            $this->type_document = $typeDocument;
            $this->year_month_reference = $yearMonthReference;
            $this->dt_document = $dtDocument;
            $this->dt_registry_document = $dtRegistryDocument;
            $this->reversal_indicator = $reversalIndicator;
            $this->value_amount = $valueAmount;
            $this->description = $description;
            $this->cost_center = $costCenter;
            $this->order_internal = $orderInternal;
            $this->amends_document = $amendsDocument;
            $this->material = $material;
            $this->username = $username;
            $this->dt_input = $dtInput;
            $this->ind_st_item_fbl3n = '1';
            $this->id_user_created = 1;
            $this->save();
        } else {
            \Log::info("Registry exists [$codeReason,$yearMonthReference,$dtRegistryDocument,$valueAmount].");
        }

    }
}