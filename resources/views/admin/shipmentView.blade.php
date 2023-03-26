@extends('layouts.admin')
@section('content')

 <div class="dashboard-wrapper">
            <div class="row m-b-20">
               <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black"> Shipment Details</h3>
                  </div>
               </div>
               <!-- <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12 ">
                  <div class="right-side-c">
                     <div class="serach-bar">
                        <input type="text"  class="form-control" placeholder="Search">
                        <span><i class="fa fa-search"></i></span>
                     </div>
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
                        <span class="cal-icon icon-d service-providers-c"><img src="images/img-1/filter.png"></i>
                        </i>
                        </span>
                        <span class="cal-icon icon-d"><img src="images/refrest_dashboard@2x.png"></i>
                        </i>
                        </span>
                     </div>
                  </div>
               </div> -->
            </div>
            
            <div class="customer-inner-profile  shipment-profile">
               <div class="block-element">
                  <div class="row">
                     <div class="col-md-5">
                        <div class="customer-inner-left-profile">
                           <div class="profile">
                           		@if(!empty($user->image))
                              <img src="{{url('storage/app').'/'.$user->image}}">
                            @else
                            <img src="{{asset('images/foamtool_icon@2x.png')}}">
                            @endif 
                             <!--  <img src="images/foamtool_icon@2x.png"> -->
                              <span>{{($user->title ?: 'N/A')}}</span>
                           </div>
                           <div class="customer-table">
                              <table class="table-type2">
                                 <thead>
                                    <tr>
                                       <th>From</th>
                                       <td>{{($user->from ?: 'N/A')}}</td>
                                    </tr>
                                    <tr>
                                       <th>To</th>
                                       <td>{{($user->to ?: 'N/A')}}</td>
                                    </tr>
                                    <tr>
                                       <th>Date </th>
                                       <td>{{($user->date ?: 'N/A')}}</td>
                                    </tr>
                                   <!--  <tr>
                                       <th>Price </th>
                                       <td  class="price-tag">$30</td>
                                    </tr> -->
                                 </thead>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div class="col-md-7">
                        <div class="customer-inner-right-profile">
                           <div class="customer-table-right-c">
                              <div class="customer-table-right-download">
                                 <h3>Details</h3>
                                 <!-- <div class="download-btn"><img src="images/download-1.png"></div> -->
                              </div>
                              <table class="table-type2">
                                 <thead>
                                    <!-- <tr>
                                       <th> Service Providers</th>
                                       <td> Edward Callen</td>
                                    </tr> -->
                                    <tr>
                                       <th>Shipment</th>
                                       <td> {{($user->title ?: 'N/A')}}</td>
                                    </tr>
                                    <tr>
                                       <th>Width</th>
                                       <td>{{($user->width ?: 'N/A')}}</td>
                                    </tr>
                                    <tr>
                                       <th>lenght</th>
                                       <td>{{($user->lenght ?: 'N/A')}}</td>
                                    </tr>

                                    <tr>
                                       <th>Height</th>
                                       <td>{{($user->height ?: 'N/A')}}</td>
                                    </tr>
                                    <tr>
                                       <th>Weight</th>
                                       <td>{{($user->weight ?: 'N/A')}}</td>
                                    </tr>

                                    <tr>
                                       <th>Fragile</th>
                                       <td class="price-tag">{{($user->fragile ? 'Yes' : 'No')}}</td>
                                    </tr>
                                 </thead>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>




@stop