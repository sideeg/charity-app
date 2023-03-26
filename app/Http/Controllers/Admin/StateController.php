<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DataTables;
use Validator;
use App\Models\state;
use App\Models\countrie;


class StateController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $country = countrie::where('status',1)->get();
        return view('admin.stateList',compact('country'));
    }

    public function getStates(Request $request)
    {   
       
        if(isset($request->from) || isset($request->to) || isset($request->country))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=state::orderBy('id', 'DESC')->with('country')->whereBetween('created_at',[$start, $end]);
            if(!empty($request->country))
            {
               
                $users->where('countrie_id',$request->country);
            }
            $users= $users->get();
           
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })->make(true);
        }
        else
        {
            $users=state::orderBy('id', 'DESC')->with('country')->get();
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
        $countrie = countrie::where('status',1)->get();
        return view('admin.stateCreate',compact('countrie'));
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
            'title_arabic' => 'required|max:255',
            'countrie_id' => 'required|exists:countries,id',
            
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user =  new state;
        $user->title = $request->title;
        $user->title_arabic = $request->title_arabic;
        $user->countrie_id = $request->countrie_id;
        $user->save();
        session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/state');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $countrie = countrie::where('status',1)->get();
        $user=state::find($id);
        return view('admin.stateEdit',compact('user','countrie'));  
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
            'title_arabic' => 'required|max:255',
            'countrie_id' => 'required|exists:countries,id',
            
        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user=state::find($id);
        if($request->has('title'))
        {
            $user->title = $request->title;
        }
        if($request->has('title_arabic'))
        {
            $user->title_arabic = $request->title_arabic;
        }
        if($request->has('countrie_id'))
        {
            $user->countrie_id = $request->countrie_id;
        }
      
        $user->save();
        session()->flash('success', 'Data Updated Successfully.');
        return redirect('/admin/state');
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
        $data = state::find($id);
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
