<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Model\Client;

class ReportController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clients = Client::lookupTable(Client::all(), 'id_client', 'short_name');
        return view('reports.index', compact('clients'));
    }
}
