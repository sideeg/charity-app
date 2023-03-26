@extends('layouts.admin')
@section('content')
     <div class="dashboard-wrapper">
            <!-- <div class="page-title">
               <h3 class="col-black"> Dashboard </h3>
               </div>    -->
            <div class="row m-b-20">
               <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black"> Dashboard </h3>
                  </div>
               </div>
               <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12 ">
                  <div class="right-side-c">
                     <div class="serach-bar">
                        <!-- <input type="text"  class="form-control"> -->
                        <!-- <span><i class="fa fa-search"></i></span> -->
                     </div>
                     <div class="date-sec">
                        <!-- <span>
                           <label>From</label>
                           <select class="form-control">
                              <option>12 Sep, 2009</option>
                              <option>12 Sep, 2009</option>
                           </select>
                        </span>
                        <span>
                           <label>To</label>  
                           <select class="form-control">
                              <option>12 Sep, 2009</option>
                              <option>12 Sep, 2009</option>
                           </select>
                        </span> -->
                        <!-- <span class="cal-icon icon-d"><img src="{{asset('images/img-1/regresh-icon-1.png')}}"></i>
                        </i>
                        </span> -->
                     </div>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="row">
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                         <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4>{{App\Models\categorie::getCount()}}</h4>
                           <p class="col-grey"> Sectors </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/Sector.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('sector.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('sector.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\countrie::count()}}</h4>
                           <p class="col-grey"> Countries </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/countries_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('country.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('country.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\state::count()}}</h4>
                           <p class="col-grey"> States </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/State_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('state.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('state.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\city::count()}}</h4>
                           <p class="col-grey"> Cities </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/City_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('city.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('city.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\User::where('status','!=',2)->count()}}</h4>
                           <p class="col-grey"> Contributors </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/Contributor_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('customer.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('customer.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\Provider::where('status','!=',2)->count()}}</h4>
                           <p class="col-grey"> Initiators </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/Initiators_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('initiator.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('initiator.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\matter::count() }}</h4>
                           <p class="col-grey"> Monthly Cases </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/Total cases_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('case.index')}}" class="view-more-1">View more</a>
                           <a href="{{route('case.index')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="col-md-3 col-lg-3 col-sm-6 col-xs-12">
                     <div class="dashboard-box box-type1">
                           <div class="dash-title-icon">
                        <div class="dash-title">
                           <h4> {{App\Models\matterContributor::where('status',1)->sum('amount')." ".env('CURRENCY') }}</h4>
                           <p class="col-grey"> Total Amount </p>
                        </div>
                        <div class="dash-icon">
                           <img src="{{asset('images/img-1/Amount_v1.png')}}">
                        </div>
                         </div>
                        <div class="view-more">
                           <a href="{{route('admin.transaction')}}" class="view-more-1">View more</a>
                           <a href="{{route('admin.transaction')}}" class="view-more-aarow"><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="row">
                  <div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
                     <div class="box-type1">
                        <div class="sec-head1">
                           <h3 class="col-black"> Monthly Cases</h3>
                        </div>
                        <div class="reven-image">
                       
                           
                          <!--   -->
                           <div id="caseGraph" style="height: 270px; width: 100%;"></div>
                           <!-- <img src="{{asset('images/img-1/bargraph_dashboard.png')}}"> -->
                        </div>
                     </div>
                  </div>
                  <div class="col-md-5 col-lg-5 col-sm-5 col-xs-12">
                     <div class="table-overlay  box-type1  boxtype-4">
                        <h6 class="col-grey  latest-custom" style="font-size: 16px;margin-bottom: 18px;"> Latest Contributors </h6>
                        <table class="table-type1">
                           <tbody>
                              @php
                                 $new_user = App\Models\User::orderBy('id','DESC')->where('status','!=',2)->limit(4)->get();
                                 
                              @endphp
                              @if(!empty($new_user))
                                 @foreach($new_user as $value)
                                 <tr>
                                    @if(!empty($value->image))
                                    <td class="user-c"> <img src="{{url('storage/app').'/'.$value->image}}">{{($value->name ?: "N/A")}} 
                                 </td>
                                     @else
                                    <td class="user-c"> <img src="{{asset('images/user-pic.png')}}">{{($value->name ?: "N/A")}} 
                                    </td>
                                    @endif  
                                    <td class="text-right">{{$value->created_at->diffForHumans()}}
                                    </td>
                                 </tr>
                                 @endforeach

                              @endif
                              
                              
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="row">
                  <div class="col-md-7 col-lg-7 col-sm-7 col-xs-12">
                   <!--   <div class="box-type1">
                        <div class="sec-head1">
                           <h3 class="col-black"> Booking  List</h3>
                        </div>
                        <div class="reven-image">
                           <img src="{{asset('images/img-1/bargraph_dashboard.png')}}">
                        </div>
                     </div> -->
                  </div>
                  <div class="col-md-5 col-lg-5 col-sm-5 col-xs-12">
                   <!--   <div class="table-overlay  box-type1  boxtype-4">
                        <h6 class="col-grey" style="font-size: 16px;margin-bottom: 18px;"> Latest User </h6>
                        <table class="table-type1">
                           <tbody>
                              <tr>
                                 <td class="user-c"> <img src="{{asset('images/user-pic.png')}}">{{Auth::user()->name}} 
                                 </td>
                                 <td class="text-right"> 1 Day
                                 </td>
                              </tr>
                              <tr>
                                 <td class="user-c"> <img src="{{asset('images/user-pic.png')}}"> Michael 
                                 </td>
                                 <td class="text-right"> 1 Day
                                 </td>
                              </tr>
                              <tr>
                                 <td class="user-c"> <img src="{{asset('images/user-pic.png')}}"> Michael 
                                 </td>
                                 <td class="text-right"> 1 Day
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div> -->
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="row">
                  <!-- <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                     <div class="bookings-header">
                           <h6 class="col-grey page-title-c" style="font-size: 16px;margin-bottom: 18px;">Bookings </h6>
                           <button class="booking-view">View All</button>
                     </div>
                     <div class="table-overlay  box-type1">
                        <table class="table-type1">
                           <tbody>
                              <tr>
                                 <th class="col-black"> Order ID </th>
                                 <th class="col-black"> Date </th>
                                 <th class="col-black"> Time </th>
                                 <th class="col-black">Customer </th>
                                 <th class="col-black"> Service Provider </th>
                                 <th class="col-black"> Status </th>
                                 <th class="col-black"> Action </th>
                              </tr>
                              <tr>
                                 <td> Or12387 </td>
                                 <td>11-02-09 </td>
                                 <td>Time </td>
                                 <td> John</td>
                                 <td> John</td>
                                 <td class="complete-btn"> <span> Done </span></td>
                                 <td><a href="#">View</a></td>
                              </tr>
                              <tr>
                                 <td> Or12387 </td>
                                 <td>11-02-09 </td>
                                 <td>Time </td>
                                 <td> John</td>
                                 <td> John</td>
                                 <td class="complete-btn"> <span> Done</span></td>
                                 <td><a href="#">View</a></td>
                              </tr>
                              <tr>
                                 <td> Or12387 </td>
                                 <td>11-02-09 </td>
                                 <td>Time </td>
                                 <td> John</td>
                                 <td> John</td>
                                 <td class="complete-btn"> <span>Done </span></td>
                                 <td><a href="#">View</a></td>
                              </tr>
                              <tr>
                                 <td> Or12387 </td>
                                 <td>11-02-09 </td>
                                 <td>Time </td>
                                 <td> John</td>
                                 <td> John</td>
                                 <td class="complete-btn"> <span>Done</span></td>
                                 <td><a href="#">View</a></td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div> -->
               </div>
            </div>
         </div>
@stop
@section('script')
<script src="//canvasjs.com/assets/script/canvasjs.min.js"></script> 
<script>
              window.onload = function () {
  console.log("edr");
var chart2 = new CanvasJS.Chart("caseGraph", {
  animationEnabled: true,
  exportEnabled: true,
  theme: "light1", // "light1", "light2", "dark1", "dark2"
  title:{
    // text: "Uploads this year"
  },
  axisY:{
    includeZero: true
  },
  data: [{
    type: "column", //change type to bar, line, area, pie, etc
    indexLabel: "{x}", //Shows y value on all Data Points
    indexLabelFontColor: "#5A5757",
  // indexLabel: "{x}",
         indexLabelPlacement: "outside",  
         indexLabelOrientation: "horizontal",  
    dataPoints: <?php echo json_encode(\App\Http\Controllers\Admin\HomeController::graphData(), JSON_NUMERIC_CHECK); ?>
  }]
});
chart2.render();
 
}
</script>
@stop