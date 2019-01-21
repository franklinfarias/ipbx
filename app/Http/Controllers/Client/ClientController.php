<?php
/**
 * ClientController.php : PHP S2N
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

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use App\Model\Client;
use Illuminate\Http\Request;

class ClientController extends Controller
{
    public function index(){

        //Retorna todos os usuários
        $clients = Client::all();
        return view('client.list', compact('clients'));
    }

    public function create() {
        $client = new Client();
        $indStClient = Client::lookupDomain('ind_st_ativo_inativo');
        return view('client.create', compact('client','indStClient'));
    }

    public function edit($id) {
        $client = Client::find($id);
        $indStClient = Client::lookupDomain('ind_st_ativo_inativo');
        return view('client.edit', compact('client','indStClient'));
    }

    public function delete(Request $request) {
        if ($request->ajax()){
            return response()->json(['response' => Client::destroy($request->id)]);
        }
    }

    public function store(Request $request)
    {
        $dataForm = $request->all();
        if (array_key_exists('id_client', $dataForm))
            $obj = Client::find($dataForm['id_client']);
        else
            $obj = new Client;

        $obj->short_name = $dataForm['short_name'];
        $obj->name = $dataForm['name'];
        $obj->config = $dataForm['config'];
        $obj->email = $dataForm['email'];
        $obj->ind_st_client = $dataForm['ind_st_client'];

        /*
         * Validação de Dados
         * Aqui possui duas formas de validar os dados
         * 1. usando o método do controller, assim as mensagens virão do resource/lang;
         * 2. usando o contrutor do Validator para personalizar as mensagens;
         */
        // 1º Método
        $this->validate($request, $obj->rules);

        $result = $obj->save();

        if ($result)
            return redirect('client/list');
        else
            return redirect()->back();
    }
}