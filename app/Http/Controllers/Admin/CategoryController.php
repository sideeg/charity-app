<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\categorie;
use DataTables;
use Validator;
use App\Models\countrie;
use App\Models\matter;
use App\Models\userViews;
use App\Models\matterContributor;


class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return view('admin.categoryList');
    }

    public function getCategories(Request $request)
    {   
        if(isset($request->from) || isset($request->to))
        {
            $start = date("Y-m-d",strtotime($request->input('from')));
            $end = date("Y-m-d",strtotime($request->input('to')."+1 day"));
            $users=categorie::orderBy('id', 'DESC')->whereBetween('created_at',[$start, $end])->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
             ->editColumn('total_cases', function ($user) 
            {
                return matter::where('categorie_id',$user->id)->count();
            })
            ->editColumn('user_views', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return userViews::whereIn('matter_id',array_column($case_ids,'id'))->count();
                }
                else
                {
                    return "0";                 
                }
                     return userViews::where('user_id',$user->id)->count();
            }) 
            ->editColumn('total_goals', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();

                if(!empty($case_ids))
                {
                    return matter::whereIn('id',array_column($case_ids,'id'))->sum('goal');
                }
                else
                {
                    return "0";                 
                }
                     
            }) 
             ->editColumn('total_contributions', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return matterContributor::whereIn('matter_id',array_column($case_ids,'id'))->where('status',1)->sum('amount');
                }
                else
                {
                    return "0";                 
                }
                   
            }) 
             ->make(true);
        }
        else
        {
            $users=categorie::orderBy('id', 'DESC')->get();
            return Datatables::of($users)->editColumn('created_at', function ($user) 
            {
                return date('m-d-Y', strtotime($user->created_at) );
            })
               ->editColumn('total_cases', function ($user) 
            {
                return matter::where('categorie_id',$user->id)->count();
            })
            ->editColumn('user_views', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return userViews::whereIn('matter_id',array_column($case_ids,'id'))->count();
                }
                else
                {
                    return "0";                 
                }
                  
            }) 
            ->editColumn('total_goals', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();
               
                if(!empty($case_ids))
                {
                    return matter::whereIn('id',array_column($case_ids,'id'))->sum('goal');
                }
                else
                {
                    return "0";                 
                }
                     
            }) 
             ->editColumn('total_contributions', function ($user) 
            {
                $case_ids = matter::where('categorie_id',$user->id)->select('id')->get()->toArray();
                if(!empty($case_ids))
                {
                    return matterContributor::whereIn('matter_id',array_column($case_ids,'id'))->where('status',1)->sum('amount');
                }
                else
                {
                    return "0";                 
                }
                   
            }) 

            ->make(true);
        }
        
     }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    
    public function create()
    {
        return view('admin.categoryCreate');
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
            'type' => 'required:in:Money,Unit',
            // 'email' => 'email|unique:users|max:255',
            'image' => 'required|mimes:jpeg,jpg,png,gif|max:5120',
            'color' => 'required|max:255',

        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user =  new categorie;
        $user->title = $request->title;
        $user->title_arabic = $request->title_arabic;
        $user->type = $request->type;
        $user->image = $request->image->store('public/profile');
        $user->serial_no = "SEC ".rand(1000,9999);
        $user->color = $request->color;

        $user->save();
        session()->flash('success', 'Data Saved Successfully.');
        return redirect('/admin/sector');
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
        $user=categorie::find($id);

        return view('admin.categoryEdit',compact('user'));   
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
            'type' => 'required:in:Money,Unit',
            // 'email' => 'email|unique:users|max:255',
            'image' => 'mimes:jpeg,jpg,png,gif|max:5120',

        ]);
        if ($validator->fails()) {

            return \Redirect::back()->withInput()->withErrors($validator);
        }
        
        $user =  categorie::find($id);
        if ($request->has('title'))
        {
          $user->title = $request->title;
        }
        if ($request->has('title_arabic'))
        {
          $user->title_arabic = $request->title_arabic;
        }
        if ($request->has('type'))
        {
          $user->type = $request->type;
        }
        if ($request->has('color'))
        {
          $user->color = $request->color;
        }
        if ($request->hasFile('image'))
        {
                $user->image = $request->image->store('public/profile');
        }
        $user->save();
        session()->flash('success', 'Data Updated Successfully.');
        return redirect('/admin/sector');
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
        $data = categorie::find($id);
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
