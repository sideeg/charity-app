@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('case.update',$user->id)}}" method="POST"  enctype="multipart/form-data">
        	 	   @csrf
            @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Case Update  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Case Update</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                          <!--  <button class="btn-c"> Basic Info  </button> -->
                          <!--  <button class="btn-c  cancel  reset"> Login Credentails   </button> -->
                        </div>
                     </div>
                  </div>
                  <div class="row">
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Description </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea id="form10" class="md-textarea form-control" rows="3" name="description" required=""></textarea>
                           </div>
                         
                        </div>

                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Description Arabic</p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <!-- <input type="text" class="form-control" placeholder=" Name " value="{{$user->name}}" name="name" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}" > -->
                              <textarea id="form10" class="md-textarea form-control" rows="3" name="description_ar" required=""></textarea>
                           </div>
                         
                        </div>
                        
                       
                </div>




<div class="erererere">
                  <div class="row" style="clear:both">
                     <div class="col-md-2">
                        <div class="preview text-left">
                           
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg()" id="frame">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100"id="frame1" >
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg1()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame2">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg2()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame3">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg3()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                     <div class="col-md-2">
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="100" height="100" id="frame4">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="attachment[]" accept=".pdf,image/*"  onchange="loadImg4()">
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                  </div>
                 </div>
                  <br> <br> <br> <br> <br> 
                  <div class="row">
                     <div class="col-md-12">

                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/customer')}}'">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>
                   </div>  
                 </div>
                    
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop