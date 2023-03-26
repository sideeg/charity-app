<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\contentPage;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except(['getCms','deepLink']);
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
     public function getCms($id)
    {
         $data = contentPage::where('id',$id)->get()->toArray();
        return view('cms',compact('data'));

    }
     public function deepLink($id)
    {
         $id = $id;
        
        return view('deep-link',compact('id'));

    }
}
