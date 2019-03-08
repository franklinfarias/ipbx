<?php

namespace App\Http\Controllers;

use App\Model\Rule;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;

class RuleController extends Controller
{
    public function index(){
        if (Gate::denies('auth')) {
            abort(403,__('messages.br0002'));
        }

        //Retorna todos os usuários
        $rules = Rule::all();
        return view('rule.list', compact('rules'));
    }

    public function create() {
        if (Gate::denies('auth')) {
            abort(403,__('messages.br0002'));
        }

        $rule = new Rule();
        return view('rule.create', compact('rule'));
    }

    public function edit($id) {
        if (Gate::denies('auth')) {
            abort(403,__('messages.br0002'));
        }

        $rule = Rule::find($id);
        return view('rule.edit', compact('rule'));
    }

    public function store(Request $request)
    {
        if (Gate::denies('auth')) {
            abort(403,__('messages.br0002'));
        }

        $dataForm = $request->all();
        if (array_key_exists('id_rule', $dataForm) && (!empty($dataForm['id_rule'])))
            $rule = Rule::find($dataForm['id_rule']);
        else
            $rule = new Rule;

        $rule->name_rule = $dataForm['name_rule'];
        $rule->key = $dataForm['key'];

        /*
         * Validação de Dados
         * Aqui possui duas formas de validar os dados
         * 1. usando o método do controller, assim as mensagens virão do resource/lang;
         * 2. usando o contrutor do Validator para personalizar as mensagens;
         */
        // 1º Método
        $this->validate($request, $rule->rules());

        $result = $rule->save();

        if ($result)
            return redirect('rule/list');
        else
            return redirect()->back();

    }

    public function delete(Request $request) {
        if (Gate::denies('auth')) {
            abort(403,__('messages.br0002'));
        }

        $rule = Rule::find($request->id);
        $rule->delete();

        return response()->json([ 'success' => 'The success executed.',
            'redirectTo' => route('rule.list')]);
    }
}
