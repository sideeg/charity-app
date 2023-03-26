<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\contentPage;
// use App\contentPage;
use Illuminate\Http\Request;
use Datatables;
use Validator;

class ContentPageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('Admin.cmsList');
    }
    public function getCms()
    {
         $users=contentPage::get();
        return Datatables::of($users)->editColumn('created_at', function ($user) 
        {
            //change over here
            return date('d-m-Y', strtotime($user->created_at) );
        })->make(true);
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
     * @param  \App\contentPage  $contentPage
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // $data = contentPage::where('id',$id)->get();
        // return  view('Admin.cmsEdit',compact('data'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\contentPage  $contentPage
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = contentPage::where('id',$id)->get();
        return  view('admin.cmsEdit',compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\contentPage  $contentPage
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,  $id)
    {
        $validator = Validator::make($request->all(), [
          'title'        => 'required|max:255',
          'longText' => 'required',
        ]);
        if ($validator->fails()) {
            return \Redirect::back()->withInput()->withErrors($validator);
        }
        $user = contentPage::find($id);
       
        $user->title = $request->title;    
        $user->longText = $request->longText;      
        $user->save();
        session()->flash('success', 'Data Updated Successfully.');
        // \Redirect::back();
        return redirect('/admin/dashboard');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\contentPage  $contentPage
     * @return \Illuminate\Http\Response
     */
    public function destroy(contentPage $contentPage)
    {
        //
    }
}
