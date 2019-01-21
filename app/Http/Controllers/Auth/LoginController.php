<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Model\User;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;


class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * Get the login username to be used by the controller.
     *
     * @return string
     */
    public function username()
    {
        return 'login';
    }

    /**
     * Attempt to log the user into the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return bool
     */
    protected function attemptLogin(Request $request)
    {
        $credentials = $request->only($this->username(), 'password');
        $username = $credentials[$this->username()];
        $password = $credentials['password'];

        if (env('APP_ENV') == 'production') {
            // Autentica no LDAP
            $ldap_server = env('LDAP_SERVER', '10.61.60.11');
            $ldap_domain = env('LDAP_DOMAIN', '@vert.com.br');
            $ldap_user = $username . $ldap_domain;
            Log::info('Connecting to LDAP...');
            if (!($ldap = @ldap_connect($ldap_server))) {
                Log::info('Error connecting to LDAP...');
                return false;
            }
            ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
            ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);
            Log::info('Auth on LDAP...');
            if (!($bind = @ldap_bind($ldap, $ldap_user, $password))) {
                ldap_unbind($ldap);
                return false;
            } else {
                //
                Log::info("Auth LDAP ok. Checking user($username) on database to authorization ...");
                $user = User::where($this->username(), $username)->first();
                if (!empty($user)) {
                    $baseDN = env('LDAP_BASEDN', 'DC=vert,DC=com,DC=br');
                    $filter = env('LDAP_FILTER', "(&(objectClass=user)(objectCategory=person)(samaccountname=$username))");
                    $attr = array('displayname', 'samaccountname', 'useraccountcontrol', 'userprincipalname', 'distinguishedname', 'thumbnailPhoto');
                    $result = @ldap_search($ldap, $baseDN, $filter, $attr);
                    $info = ldap_get_entries($ldap, $result);
                    foreach ($info as $key => $value) {
                        if (array_key_exists("5", $info[0])) {
                            $user->photo = $info[$key]["thumbnailphoto"][0];
                        }
                    }
                    ldap_unbind($ldap);
                    Log::info("LDAP User($username) authenticated and authorized.");
                    $this->guard()->login($user, true);
                    return true;
                }
                Log::info('User not found on database to autorization.');
                ldap_unbind($ldap);
                return false;
            }
        } else {
            Log::info("NO Auth LDAP. Checking user($username) on database to authorization ...");
            $user = User::where($this->username(), $username)->first();
            Log::info("NO AUTH User($username) authenticated and authorized.");
            $this->guard()->login($user, true);
            return true;
        }
    }

}
