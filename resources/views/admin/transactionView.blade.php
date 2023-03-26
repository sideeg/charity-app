@extends('layouts.admin')
@section('content')
<div class="dashboard-wrapper">
   <div class="row m-b-20">
      <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
         <div class="page-title">
            <h3 class="col-black"> Transaction Details </h3>
         </div>
      </div>
   
   </div>
   <div class="customer-inner-profile">
      <div class="block-element">
         <div class="row">
            <div class="col-md-5">
               <div class="customer-inner-left-profile">
                  <div class="profile">
             
                            <span>{{"Transaction Details"}}</span>
                  </div>
                  <div class="customer-table">
                     <table class="table-type2">
                        <thead>
                          <tr>
                              <th>Transaction Date</th>
                              <td>@php echo date('d-m-Y', strtotime($user->created_at) )  @endphp</td>
                           </tr>
                           <tr>
                              <th>Transaction Time</th>
                              <td>@php echo date('h:i:s A', strtotime($user->created_at) )  @endphp</td>
                           </tr>
                           <tr>
                              <th>Transaction Mode</th>
                              <td>{{($user->mode ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Transaction Id</th>
                              <td>{{($user->transaction_id ?: "N/A")}}</td>
                           </tr>
                            <tr>
                              <th>Transaction Amount</th>
                              <td>{{($user->amount ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Transaction Status</th>
                              <td>{{($user->status == 1 ? "Approved" : "Pending")}}</td>
                           </tr>
                        </thead>
                     </table>
                  </div>

                  
               </div>



           <div class="customer-inner-left-profile documents-sec">
            <div class="page-title-c">
               <h3 class="col-black">Transaction  Documents</h3>
            </div>
            <div class="">
               <div class="images-d">
                  <div class="img-1">
                     @if(!empty($user->transaction_image))
                     <img src="{{url('storage/app').'/'.$user->transaction_image}}">
                     <center><a href="{{url('storage/app').'/'.$user->transaction_image}}" class="btn btn-primary btn-sm" target="blank">View Image</a></center>
                     @endif
                      
                    
                  </div>
               
               </div>
            </div>
         </div>



            </div>
            <div class="col-md-7">
               <div class="customer-inner-right-profile">
                  <div class="customer-table-right-c">
                     <h3>Details</h3>
                     <table class="table-type2">
                        <thead>
                           <tr>
                              <th>Contributor Email </th>
                              <td>{{($user->user->email ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Contributor Name </th>
                              <td>{{($user->user->email ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Initiator Email </th>
                              <td>{{($user->initiator->email ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Initiator Name </th>
                              <td>{{($user->initiator->email ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case  Serial No </th>
                              <td>{{($user->case->serial_no ?: "N/A")}}</td>
                           </tr>
                          <tr>
                              <th>Case  Title </th>
                              <td>{{($user->case->title ?: "N/A")}}</td>
                           </tr>
                           <tr>
                              <th>Case  Description </th>
                              <td>{{($user->case->description ?: "N/A")}}</td>
                           </tr>
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