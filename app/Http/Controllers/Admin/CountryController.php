<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use Validator;
use App\Models\countrie;


class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         return view('admin.countryList');
    }
    public function getCountries(Request $request)
    {   
        if(isset($request->from) || isset($request->to))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=countrie::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })->make(true);
        }
        else
        {
            $users=countrie::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
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
       return view('admin.countryCreate');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      $validator = Validator::make($request->all(), [
            'title' => 'required|max:255',
            'title_ar' => 'required|max:255',
            
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user =  new countrie;
        $user->title = $request->title;
        $user->title_ar = $request->title_ar;
        $user->save();
        session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/country');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
         $user=countrie::find($id);
        return view('admin.countryShow',compact('user'));   
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
          $user=countrie::find($id);
        return view('admin.countryEdit',compact('user'));   
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
        $validator = Validator::make($request->all(), [
            'title' => 'required|max:255',
            'title_ar' => 'required|max:255',
            
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user =  countrie::find($id);
        $user->title = $request->title;
        $user->title_ar = $request->title_ar;
        $user->save();
        session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/country');
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
     public function changeStatus($id)
    {
        $data = countrie::find($id);
        if($data->status == 0)
        {
           $data->status = 1;
           $data->save();   
        }
        else
        {
           $data->status = 0;
           $data->save();
        }
          session()->flash('success', 'Status Changed Successfully.');
         return true;
    }
}
