<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\matter;
class HomeController extends Controller
{
    public function dashboard(Request $request)
    {
    	  return view('admin.index');	
    }
    public function logout(Request $request)
    {
        Auth::logout();
          return redirect()->intended('/admin/login');
    }
      Static function graphData()
    {
    	 $users =matter::select('id', 'created_at')
                              ->get()
                           ->groupBy(function($date) {
   			return \Carbon\Carbon::parse($date->created_at)->format('m'); // grouping by months.
   		});
   		$usermcount = [];
		$userArr = [];
		foreach ($users as $key => $value) {
    		$usermcount[(int)$key] = count($value);
		}

		for($i = 1; $i <= 12; $i++){
    		if(!empty($usermcount[$i])){
        		$userArr[$i] = $usermcount[$i];    
    			}else{
        	$userArr[$i] = 0;    
    	}
		}

		$data['Shipments'] = $userArr;
	$dataPoints1 = array(
            array( "y"=> $data['Shipments'][1], "indexLabel"=>  ($data['Shipments'][1] !=0 ?  "Jan" : "" ),"label"=> "Jan"),
            array( "y"=> $data['Shipments'][2], "indexLabel"=> ($data['Shipments'][2] !=0 ?  "Feb" : "" ),"label"=> "Feb"),
            array( "y"=> $data['Shipments'][3], "indexLabel"=> ($data['Shipments'][3] !=0 ?  "March" : "" ),"label"=> "March"),
            array( "y"=> $data['Shipments'][4], "indexLabel"=> ($data['Shipments'][4] !=0 ?  "April" : "" ),"label"=> "April"),
            array( "y"=> $data['Shipments'][5], "indexLabel"=> ($data['Shipments'][5] !=0 ?  "May" : "" ),"label"=> "May"),
            array( "y"=> $data['Shipments'][6], "indexLabel"=> ($data['Shipments'][6] !=0 ?  "June" : "" ),"label"=> "June"),
            array( "y"=> $data['Shipments'][7], "indexLabel"=> ($data['Shipments'][7] !=0 ? "July" : "0" ),"label"=> "July"),
            array( "y"=> $data['Shipments'][8], "indexLabel"=> ($data['Shipments'][8] !=0 ?  "August" : "" ),"label"=> "August"),
            array( "y"=> $data['Shipments'][9], "indexLabel"=> ($data['Shipments'][9] !=0 ?  "Sep" : "" ),"label"=> "Sep"),
            array( "y"=> $data['Shipments'][10], "indexLabel"=> ($data['Shipments'][10] !=0 ?  "Oct" : "" ),"label"=> "Oct"),
            array( "y"=> $data['Shipments'][11], "indexLabel"=> ($data['Shipments'][11] !=0 ?  "Nov" : "" ),"label"=> "Nov"),
            array( "y"=> $data['Shipments'][12], "indexLabel"=> ($data['Shipments'][12] !=0 ?  "Dec" : "" ),"label"=> "Dec"),
          );


		return $dataPoints1;

        
			

			
    }
}
