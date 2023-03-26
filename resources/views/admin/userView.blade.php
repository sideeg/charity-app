@extends('layouts.admin')
@section('content')

   <div class="dashboard-wrapper">
            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black"> Contributor Details </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                               <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/contributor')}}'"> Back  </button> </h3>
                  </div>
               </div>
               <!-- <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 ">
                  <div class="right-side-c">
                     <div class="date-sec">
                        <span>
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
                        </span>
                        <span class="cal-icon icon-d"><img src="images/img-1/regresh-icon-1.png"></i>
                        </i>
                        </span>
                     </div>
                  </div>
               </div> -->
            </div>

            
            <div class="customer-inner-profile">
               <div class="block-element">
                  <div class="row">
                     <div class="col-md-6">
                        <div class="customer-inner-left-profile">
                           <div class="profile">
                           	@if(!empty($user->image))
                              <img src="{{url('storage/app').'/'.$user->image}}">
                            @else
                            <img src="{{asset('images/stephen_profile@2x.png')}}">
                            @endif  
                              <span>{{($user->name ?: "N/A")}}</span>
                           </div>
                           <div class="customer-table">
                              <table class="table-type2">
                                 <thead>
                                    <tr>
                                       <th>Customer ID</th>
                                       <td>{{$user->id}}</td>
                                    </tr>
                                     <tr>
                                       <th>Total Views</th>

                                       <td>{{App\Models\userViews::where('user_id',$user->id)->count()}}</td>
                                    </tr>
                                    <tr>
                                       <th>Total  Approved Contributions</th>
                                       <td>{{App\Models\matterContributor::where('user_id',$user->id)->where('status',1)->sum('amount')}}</td>
                                    </tr>
                                    <tr>
                                       <th>Total  Pending Contributions</th>
                                       <td>{{App\Models\matterContributor::where('user_id',$user->id)->where('status',0)->sum('amount')}}</td>
                                    </tr>
                                    <tr>
                                       <th>Total  Online Contributions</th>
                                       <td>{{App\Models\matterContributor::where('user_id',$user->id)->where('mode','Online')->count()}}</td>
                                    </tr>
                                     <tr>
                                       <th>Total  Offline Contributions</th>
                                       <td>{{App\Models\matterContributor::where('user_id',$user->id)->where('mode','Cash')->count()}}</td>
                                    </tr>

                                    
                                 </thead>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="customer-inner-right-profile">
                           <div class="customer-table-right-c">
                              <h3>Details</h3>
                              <table class="table-type2">
                                 <thead>
                                    <tr>
                                       <th>Email Address</th>
                                       
                                       <td>{{($user->email ?: "N/A")}}</td>
                                    </tr>
                                      <tr>
                                       <th>Phone Number</th>
                                       <td>{{$user->country_code.$user->phone_number}}</td>
                                    </tr>
                                    <tr>
                                       <th>Gender</th>
                                       
                                       <td>{{($user->gender ?: "N/A")}}</td>
                                    </tr>
                                    <tr>
                                       <th>Country</th>
                                       
                                       <td>{{($user->country ?: "N/A")}}</td>
                                    </tr>
                                    <tr>
                                       <th>City</th>
                                       
                                       <td>{{($user->city ?: "N/A")}}</td>
                                    </tr>
                                   <!--  <tr>
                                       <th>State</th>
                                       
                                       <td>{{($user->state ?: "N/A")}}</td>
                                    </tr> -->
                                    <tr>
                                       <th>Type</th>
                                       
                                       <td>{{($user->type ?: "N/A")}}</td>
                                    </tr>
                                    <tr>
                                       <th>Birth Date</th>
                                       
                                       <td>{{($user->birth_date ?: "N/A")}}</td>
                                    </tr>

                                    <!-- <tr>
                                       <th>Email Address</th>
                                       <td>-</td>
                                       <td>john@123</td>
                                    </tr> -->
                                    <tr>
                                       <th>Registered At</th>
                                       
                                       <td>@php
                                       	echo date('d-m-Y', strtotime($user->created_at) );
                                       	@endphp
                                       </td>
                                    </tr>
                                    <!-- <tr>
                                       <th>Address</th>
                                       <td>-</td>
                                       <td>New Street 577676</td>
                                    </tr> -->
                                 </thead>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="block-element customer-form-c1">
              <!--  <div class="box-type1">
                  <div class="entries-sec">
                     <div class="dataTables_length" id="listofbooking_length">
                        <label>
                           Sr.No 
                           <select name="listofbooking_length" aria-controls="listofbooking" class="">
                              <option value="10">10</option>
                              <option value="25">25</option>
                              <option value="50">50</option>
                              <option value="100">100</option>
                           </select>
                           Booking  Entries
                        </label>
                     </div>
                     <div class="serach-bar">
                        <input type="text" class="form-control">
                        <span><i class="fa fa-search"></i></span>
                     </div>
                  </div>
                  <div class="row">
                     <div class="table-overlay">
                        <table class="table-type2">
                           <thead>
                              <tr>
                                 <th> SR.NO </th>
                                 <th>Customer ID</th>
                                 <th>Customer</th>
                                 <th> Shipment </th>
                                 <th> Size </th>
                                 <th> From  </th>
                                 <th> To</th>
                                 <th> Status</th>
                                 <th> Action</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                 <td> 1 </td>
                                 <td>5677</td>
                                 <td class="photo-c"> <img src="images/user-pic.png"> John</td>
                                 <td> Farm Tool</td>
                                 <td>75cm</td>
                                 <td>Capton</td>
                                 <td>Durban</td>
                                 <td class="status-c"><span> Done </span></td>
                                 <td class="actions-btn-c"> 
                                    <a href="#" class="edit-btn-f"><i class="fa fa-eye"></i></a>
                                    <a href="#" class="edit-btn-f"><i class="fa fa-pencil"></i></a>
                                 </td>
                              </tr>
                              <tr>
                                 <td> 1 </td>
                                 <td>5677</td>
                                 <td class="photo-c"> <img src="images/user-pic.png"> John</td>
                                 <td> Farm Tool</td>
                                 <td>75cm</td>
                                 <td>Capton</td>
                                 <td>Durban</td>
                                 <td class="status-c"><span> Done </span></td>
                                 <td class="actions-btn-c"> 
                                    <a href="#" class="edit-btn-f"><i class="fa fa-eye"></i></a>
                                    <a href="#" class="edit-btn-f"><i class="fa fa-pencil"></i></a>
                                 </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div> -->
            </div>
            <div class="block-element">
               <!-- <div class="breadcrumb-custom">
                  <span> <a href="">  <i class="fa fa-caret-left"> </i> </a> </span>
                  <ul>
                     <li> <a href="" class="active"> 1 </a> </li>
                     <li> <a href=""> 2 </a> </li>
                     <li> <a href=""> 3 </a> </li>
                     <li> <a href=""> 4 </a> </li>
                     <li> <a href=""> 5 </a> </li>
                  </ul>
                  <span> <a href="">  <i class="fa fa-caret-right"> </i> </a> </span>
               </div> -->
            </div>
         </div>


@stop