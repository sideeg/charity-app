@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('sector.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Sector  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                   <!--    <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/sector')}}'"> Back  </button> </h3> -->
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit Sector</h5>
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
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title}}" name="title" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('This field is required and Please enter  alphabets only. ')" onvalid=""  onkeypress="return /[a-zA-Z\s]+/i.test(event.key)"  onkeyup="try{setCustomValidity('')}catch(e){}" required>
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Arabic Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name " value="{{$user->title_arabic}}" name="title_arabic"  required>
                           </div>
                        </div>
                    
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <div class="form-label">
                              <p class="col-grey"> Type  </p>
                           </div>
                           <div class="form-field1 m-b-20 form-group">
                              <select class="form-control" id="sel1"  name="type">
                               <option value="Money"{{($user->type == 'Money' ? 'selected' : '')}}>Money</option>
                               <option value="Unit" {{($user->type == 'Unit' ? 'selected' : '')}}>Unit</option>
                             </select>
                           </div>
                            
                        </div>

                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6" style="display:none">
                            <div class="form-label">
                              <p class="col-grey"> Background Colour  </p>
                           </div>
                           <div class="form-field1 m-b-20 form-group">
                                <input type="color" class="form-control" placeholder=" Background Colour " value="{{$user->color}}" name="color"  required>
                           </div>

                           </div>
                            
                        </div>
               
                  <div class="row">
                     <div class="col-md-12">
                        <div class="preview text-left">
                        	@if(!empty($user->image))
                      <!--         <img src="{{url('storage/app').'/'.$user->image}}"> -->
                              <img class="preview-img" src="{{url('storage/app').'/'.$user->image}}" alt="Preview Image" width="100" height="100" id="frame">
                            @else
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame" >
                            @endif 
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*" onchange="loadImg()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                  </div>

                   

                   <div class="block-element text-right">
                       
                        
                     <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/sector')}}'" >  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop