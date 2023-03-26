@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('country.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Country  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                      <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/country')}}'"> Back  </button> </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit Country</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                         <!--   <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  	  
         
                     
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title}}" name="title" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please add in this field and Please enter on alphabets only. ')" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" onkeydown="try{setCustomValidity('')}catch(e){}" required>
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Arabic Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title_ar}}" name="title_ar" required >
                           </div>
                        </div>
                        <div class="block-element text-right">
                         <button class="btn-c  cancel  reset" onclick="window.location.href='{{url('admin/country')}}'" type="button">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop