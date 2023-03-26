@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('sector.store')}}" method="POST"  enctype="multipart/form-data" autocomplete="off">
        	 	   @csrf
    

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Sector  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Add Sector</h5>
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
                              <input type="text" class="form-control" placeholder=" Name "name="title" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please enter on alphabets only. ')" onkeyup="try{setCustomValidity('')}catch(e){}"  onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" required >
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Arabic Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder="Arabic Name "  name="title_arabic"  required >
                           </div>
                        </div>



                    
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <div class="form-label">
                              <p class="col-grey"> Type  </p>
                           </div>
                           <div class="form-field1 m-b-20 form-group">
                              <select class="form-control" id="sel1"  name="type" required>
                               <option value="Money">Money</option>
                               <option value="Unit" >Unit</option>
                             </select>
                           </div>
                            
                        </div>
                  <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6"  style="display:none">
                           <div class="form-label">
                              <p class="col-grey"> Background Colour  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="color" class="form-control" placeholder=" Background Colour " value="#59b7b4" name="color"  required>
                           </div>
                        </div>
                  <div class="row">
                     <div class="col-md-12">
                         <!--  <label>Allowed Extentions (Any image file)</label> -->
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image"  width="100" height="100" id="frame">
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*" onchange="loadImg()" required>
                           </div>
                           
                        </div>
                        <span class="Error">Allowed Extentions (Any image file)</span>
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