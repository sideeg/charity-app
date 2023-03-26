@extends('layouts.admin')
@section('content')

  <div class="dashboard-wrapper">
            <div class="row m-b-20">
               <div class="col-md-4 col-lg-4 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black"> All Shipments </h3>
                  </div>
               </div>
               <div class="col-md-8 col-lg-8 col-sm-12 col-xs-12 ">
                  <div class="right-side-c">
                     <!-- <div class="serach-bar">
                        <input type="text"  class="form-control">
                        <span><i class="fa fa-search"></i></span>
                     </div> -->
                     <div class="date-sec  custom-c34">
                        <span>
                           
                           <label>From</label>
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="from" autocomplete="off">
                        </span>
                        <span>
                           <label>To</label>  
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="to" autocomplete="off">
                        </span>
                        <span class="cal-icon icon-d  custom-c2"><img src="{{asset('images/img-1/regresh-icon-1.png')}}" id="shipment_filter"></i>
                        </i>
                    
                       <!--  <span class="cal-icon icon-d"><img src="{{asset('images/refrest_dashboard@2x.png')}}"></i>
                        </i>
                        </span> -->
                     </div>
                  </div>
               </div>
            </div>




            
            <div class="block-element">
               <div class="box-type1">
                  <div class="entries-sec">
                     <!-- <div class="dataTables_length" id="listofbooking_length">
                        <label>
                           Sr.No 
                           <select name="listofbooking_length" aria-controls="listofbooking" class="">
                              <option value="10">10</option>
                              <option value="25">25</option>
                              <option value="50">50</option>
                              <option value="100">100</option>
                           </select>
                           Entries
                        </label>
                     </div> -->
                     <!-- <div class="serach-bar">
                        <input type="text" class="form-control">
                        <span><i class="fa fa-search"></i></span>
                     </div> -->
                  </div>
                  <div class="row">
                     <div class="table-overlay">
                     <div class="table-responsive">

                        <table class="table-type2" id="shimpent">
                           <thead>
                              <tr>
                                 <th> SR.NO </th>
                                 <th>  ID</th>
                                 <th>Title </th>
                                 <th>From </th>
                                 <th>To </th>
                                <!--  <th>Height </th>
                                 <th>Width </th>
                                 <th>Image </th>	
                                 <th>User Name</th> -->
                                <!--  <th>Business Name</th> -->
                                 <th>User Email </th>
                                 <th> User No. </th>
                              <!--    <th> User Image</th> -->
                               
                                 <!-- <th> Address </th> -->
                                  <!-- <th> Search Radious </th> -->
                                 <th> Action</th>
                              </tr>
                           </thead>
                           <tbody>
                              <!-- <tr>
                                 <td> 1 </td>
                                 <td>5677</td>
                                 <td class="photo-c"> <img src="images/user-pic.png"> John</td>
                                 <td> John@gmail.com</td>
                                  <td> John@gmail.com</td>
                                   <td> John@gmail.com</td>
                                    <td> John@gmail.com</td>
                                     <td> John@gmail.com</td>
                                 <td> 7878787878</td>
                                 <td>12-02-21 </td>
                                 <td class="dd"> 
                                    New Street Aus
                                 </td>

                                 <td class="dd"> 
                                   <a href="#" class="edit-btn">Verified</a>
                                 </td>
                                 <td class="actions-btn-c"> 
                                    <a href="#" class="edit-btn-f"><i class="fa fa-eye"></i></a>
                                    <a href="#" class="edit-btn-f"><i class="fa fa-pencil"></i></a>
                                    <a href="#" class="edit-btn-f"   data-toggle="modal" data-target="#myModal"><i class="fa fa-ban"></i></a>
                                 </td>
                              </tr> -->
                             
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
            <!-- <div class="block-element">
               <div class="breadcrumb-custom">
                  <span> <a href="">  <i class="fa fa-caret-left"> </i> </a> </span>
                  <ul>
                     <li> <a href="" class="active"> 1 </a> </li>
                     <li> <a href=""> 2 </a> </li>
                     <li> <a href=""> 3 </a> </li>
                     <li> <a href=""> 4 </a> </li>
                     <li> <a href=""> 5 </a> </li>
                  </ul>
                  <span> <a href="">  <i class="fa fa-caret-right"> </i> </a> </span>
               </div>
            </div> -->
         </div>

@stop