<?php
/**
 * Created by PhpStorm.
 * User: franklin
 * Date: 4/19/18
 * Time: 4:27 AM
 */
// Examples
// http://dcm.ujf-grenoble.fr/lib-new/dompdf/www/examples.php
?>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" charset="utf-8">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <style type="text/css">
        @page {
            margin: 1cm;
        }

        body {
            font-family: sans-serif;
            margin: 0.5cm 0;
            text-align: justify;
            margin-top: 1.5cm;
        }

        #header,
        #footer {
            position: fixed;
            left: 0;
            right: 0;
            color: #aaa;
            font-size: 0.9em;
        }

        #header {
            position: fixed;
            top: 0;
            border-bottom: 0.1pt solid #aaa;
        }

        #footer {
            position: fixed;
            bottom: 0;
            border-top: 0.1pt solid #aaa;
        }

        #header table,
        #footer table {
            width: 100%;
            border-collapse: collapse;
            border: none;
        }

        #header td,
        #footer td {
            padding: 0;
            width: 50%;
        }

        .page-number {
            text-align: right;
        }

        .page-number:before {
            content: "Página " counter(page);
        }

        hr {
            page-break-after: always;
            border: 0;
        }

        .cover {
            left: 0;
            right: 0;
            color: #aaa;
            font-size: 2.9em;
            margin-top: 7cm;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="cover">
    <img src="{{asset('assets/img/reports/logo-vert.png')}}">
    <br />
    @yield('title')
    <br />
    @yield('subtitle')
</div>

<hr />

<div id="header">
    <table>
        <tbody>
        <tr>
            <td><img src="{{asset('assets/img/reports/novo-logo2.png')}}"></td>
            <td style="text-align: center;">@yield('document_name')</td>
            <td style="text-align: right;">@yield('client_name')</td>
        </tr>
        </tbody>
    </table>
</div>

@yield('content')

<div id="footer">
    <div class="page-number"></div>
</div>
</body>
</html>
