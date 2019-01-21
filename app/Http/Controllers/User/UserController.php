<?php

namespace App\Http\Controllers\User;

use App\Model\Notification;
use Auth;
use App\Http\Controllers\Controller;
use App\Model\User;
use App\Model\Profile;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(){

        //if (Gate::denies('auth')) {
        //    abort(403,"Não autorizado!");
        //}
        //Retorna todos os usuários
        $users = User::all();
        return view('user.list', compact('users'));
    }

    public function create() {
        $user = new User();
        $profiles = User::lookupTable(Profile::all(),'id_profile','name_profile');
        $indStUser = User::lookupDomain('ind_st_ativo_inativo');
        return view('user.create', compact('user','profiles', 'indStUser'));
    }

    public function edit($id) {
        $user = User::find($id);
        $profiles = User::lookupTable(Profile::all(),'id_profile','name_profile');
        $indStUser = User::lookupDomain('ind_st_ativo_inativo');
        return view('user.edit', compact('user','profiles', 'indStUser'));
    }

    public function store(Request $request)
    {

        $dataForm = $request->all();
        if (array_key_exists('id_user', $dataForm))
            $user = User::find($dataForm['id_user']);
        else
            $user = new User;

        $user->id_profile = $dataForm['id_profile'];
        $user->name = $dataForm['name'];
        $user->login = $dataForm['login'];
        $user->extension = $dataForm['extension'];
        $user->email = $dataForm['email'];
        if (!empty($dataForm['password']))
            $user->password = bcrypt($dataForm['password']);
        $user->ind_st_user = $dataForm['ind_st_user'];

        /*
         * Validação de Dados
         * Aqui possui duas formas de validar os dados
         * 1. usando o método do controller, assim as mensagens virão do resource/lang;
         * 2. usando o contrutor do Validator para personalizar as mensagens;
         */
        // 1º Método
        $this->validate($request, $user->rules);

        // 2º Método
        //$validator = Validator::make($dataForm, $user->rules, $user->messages);
        //if ($validator->fails()) {
        //    return redirect('user/create')
        //        ->withErrors($validator)
        //        ->withInput();
        //}

        // Store Image
        $file = $request->file('image_file');
        //to database
        if (!empty($file)) {
            $contents = $file->openFile()->fread($file->getSize());
            $user->photo = $contents;
        }
        $result = $user->save();

        // to filesystem
        //$ext = $file->getClientOriginalExtension();
        //$filename = 'imageUser' . $user->id_user . $ext;
        //if ($file){
        //    $request->image_file->storeAs('public',$filename);
        //}

        if ($result)
            return redirect('user/list');
        else
            return redirect()->back();
    }

    public function profile() {
        $user = User::find(Auth::user()->id_user);
        $widget1 = User::widget1();
        $widget2 = User::widget2(Auth::user()->extension);
        $widget3 = User::widget3(Auth::user()->extension);
        //$widget3 = $widget3->toArray();

        return view('user.profile', compact('user','widget1','widget2','widget3'));
    }

    public function notification() {
        $user = User::find(Auth::user()->id_user);
        $notifications = Notification::where('id_user_destiny',Auth::user()->id_user)
            ->orderBy('notification_time', 'desc')
            ->get();
        return view('user.notification', compact('user', 'notifications'));
    }

    public function readNotification() {
        if (!empty($_REQUEST['id'])) {
            $id = $_REQUEST['id'];

            $notification = Notification::find($id);
            $notification->ind_st_notification = '1'; // LIDO
            $result = $notification->save();
            return response()->json(
                ['response' => "Updated $result."]
            );
        } else
            response()->json(['response' => "Incorrect call."]);
    }

    public function getImage($id){
        if ((!empty($id)) && ($id > 0)) {
            // By database
            // Find the user
            $user = User::find($id);

            // Observer: You should use a leading \ if using a global class inside a namespace.
            $finfo = new \finfo(FILEINFO_MIME);
            // Return the image in the response with the correct MIME type
            return response()->make($user->photo, 200, array(
                //'Content-Type' => (new finfo(FILEINFO_MIME))->buffer($user->image)
                'Content-Type' => $finfo->buffer($user->photo)
            ));
        } else {
            $finfo = new \finfo(FILEINFO_MIME);
            return response()->make(url("assets/img/avatars/avatar-blank.png"), 200, array(
                //'Content-Type' => (new finfo(FILEINFO_MIME))->buffer($user->image)
                'Content-Type' => $finfo->file(url("assets/img/avatars/avatar-blank.png"))
            ));
        }
    }

}