@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('admin.bank.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            <input type="hidden" name="_method" value="PATCH">
            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Bank Details  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                      <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/dashboard')}}'"> Back  </button> </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit Bank Details</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                         <!--   <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  	  
         
                     
                       <!--  <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Account Holder Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Account Holder Name " value="{{$user->account_holder_name}}" name="account_holder_name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}" required="" >
                           </div>
                        </div> -->
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Bank Details </p>
                           </div>
                           <div class="form-field1 m-b-20">
                            <textarea class="form-control" placeholder=" Bank Details "  name="bank_name"  required="">{{$user->bank_name}}</textarea>
                           </div>
                        </div>

                         <!--  <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Account  Number </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder="  Account  Number " value="{{$user->account_no}}" name="account_no" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')"  onchange="try{setCustomValidity('')}catch(e){}" required="">
                           </div>
                        </div> -->

                   <!--      <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  IBAN  Number </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" IBAN  Number " value="{{$user->iban_no}}" name="iban_no" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')"  onchange="try{setCustomValidity('')}catch(e){}" required="">
                           </div>
                        </div>
                         -->
                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/dashboard')}}'">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop