<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js sidebar-large lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js sidebar-large lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js sidebar-large lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js sidebar-large"> <!--<![endif]-->

<head>
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <!-- END META SECTION -->
    <!-- BEGIN MANDATORY STYLE -->
    <link href={{asset('assets/css/icons/icons.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/bootstrap.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/plugins.min.css')}} rel="stylesheet">
    <link href={{asset('assets/plugins/bootstrap-loading/lada.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/style.css')}} rel="stylesheet">
    <link href="#" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <!-- BEGIN PAGE LEVEL STYLE -->
    <link href={{asset('assets/css/animate-custom.css')}} rel="stylesheet">
    <!-- END PAGE LEVEL STYLE -->
    <script src={{asset('assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js')}}></script>
</head>

<body class="login fade-in" data-page="login">
<!-- BEGIN LOGIN BOX -->
<div class="container" id="login-block">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
            <div class="login-box clearfix animated flipInY">
                <div class="page-icon animated bounceInDown">
                    <img src={{asset('assets/img/account/user-icon.png')}} alt="Key icon">
                </div>
                <div class="login-logo">
                    <a href="#?login-theme-3">
                        <img src={{asset('assets/img/account/login-logo.png')}} alt="Company Logo">
                    </a>
                </div>
                <hr>
                <div class="login-form">
                    <!-- BEGIN ERROR BOX -->
                    <div class="alert alert-danger hide">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <h4>Error!</h4>
                        @if ($errors->has('login'))
                            <span class="help-block">
                                <strong>{{ $errors->first('login') }}</strong>
                            </span>
                        @endif
                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                    <!-- END ERROR BOX -->
                    <form method="post" action="{{URL::to('login')}}">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <input type="login" id="login" name="login" class="input-field form-control user" value="{{ old('login') }}" required autofocus>
                        <input type="password" id="password" name="password" class="input-field form-control password" required>
                        <div class="div-login" style="margin:auto;text-align:center">
                            <button style="display: inline;" id="submit-form" class="btn btn-login ladda-button" data-style="expand-left"><span class="ladda-label">login</span></button>
                        </div>
                    </form>
                    <div class="login-links">
                        <a href="{{URL::to('auth/logout')}}">Perdeu a senha?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END LOCKSCREEN BOX -->
<!-- BEGIN MANDATORY SCRIPTS -->
<script src={{URL::to('assets/plugins/jquery-1.11.1.min.js')}}></script>
<script src={{URL::to('assets/plugins/jquery-migrate-1.2.1.min.js')}}></script>
<script src={{URL::to('assets/plugins/jquery-ui/jquery-ui-1.11.2.min.js')}}></script>
<script src={{URL::to('assets/plugins/jquery-mobile/jquery.mobile-1.4.2.js')}}></script>
<script src={{URL::to('assets/plugins/bootstrap/bootstrap.min.js')}}></script>
<script src={{URL::to('assets/plugins/jquery.cookie.min.js')}} type="text/javascript"></script>
<!-- END MANDATORY SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src={{URL::to('assets/plugins/backstretch/backstretch.min.js')}}></script>
<script src={{URL::to('assets/plugins/bootstrap-loading/lada.min.js')}}></script>
<script src={{URL::to('assets/js/account.js')}}></script>
<!-- END PAGE LEVEL SCRIPTS -->

</body>

</html>
