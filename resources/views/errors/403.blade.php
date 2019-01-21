<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js sidebar-large lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js sidebar-large lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js sidebar-large lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js sidebar-large"><!--<![endif]-->

<head>
    <!-- BEGIN META SECTION -->
    <meta charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta content="" name="description" />
    <meta content="themes-lab" name="author" />
    <link rel="shortcut icon" href={{asset('assets/img/favicon.png')}}>
    <!-- END META SECTION -->
    <!-- BEGIN MANDATORY STYLE -->
    <link href={{asset('assets/css/icons/icons.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/bootstrap.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/plugins.min.css')}} rel="stylesheet">
    <link href={{asset('assets/css/style.min.css')}} rel="stylesheet">
    <link href="#" rel="stylesheet" id="theme-color">
    <!-- END  MANDATORY STYLE -->
    <script src={{asset('assets/plugins/modernizr/modernizr-2.6.2-respond-1.1.0.min.js')}}></script>
</head>

<body class="error-page">
<div class="row">
    <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-offset-1 col-xs-10">
        <div class="error-container">
            <div class="error-main">
                <h1> Oops!</h1>
                <h3> Acesso não autorizado. </h3>
                <h4> Go back to our site or <a href="#">contact us</a> about the problem. </h4>
                <br>
                <div class="row">
                    <div class="input-icon col-md-12">
                        <i class="fa fa-search"></i>
                        <input type="text" class="form-control" placeholder="Search for page">
                    </div>
                </div>
                <br>
                <button class="btn btn-dark" type="button">Search</button>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="copyright">© Copyright Pixit, 2014 Pixit Inc.</div>
</div>

<!-- Placed at the end of the document so the pages load faster -->
<script src={{asset('assets/plugins/jquery-1.11.js')}}></script>
<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src={{asset('assets/plugins/bootstrap/bootstrap.min.js')}}></script>
<script src={{asset('assets/plugins/nprogress/nprogress.js')}} type="text/javascript"></script>
<script src={{asset('assets/js/application.js')}}></script>
</body>

</html>
