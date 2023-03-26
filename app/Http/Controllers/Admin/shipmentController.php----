<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shipment;
use DataTables;
use DB;
class shipmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         return view('admin.shipmentList');
    }
    public function getShipments(Request $request)
    {

        if(isset($request->from) || isset($request->to))
        {
          
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=Shipment::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->with('user')->get();


            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('d-m-Y', strtotime($user->created_at) );
            })->make(true);
        }
        else
        {
            $users=Shipment::orderBy('id', 'DESC')->with('user')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('d-m-Y', strtotime($user->created_at) );
            })->make(true);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
         $user=Shipment::find($id);
         
        return view('admin.shipmentView',compact('user'));  
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
