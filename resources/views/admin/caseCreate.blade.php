@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('case.store')}}" method="POST"  enctype="multipart/form-data" autocomplete="off">
        	 	   @csrf
    

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Case  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Add Case</h5>
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
                              <p class="col-grey">Select  Country </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="country" id="country" required>
                                  @if(!empty($countrie))
                                    @foreach($countrie as $count)
                                       <option value="{{$count->id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  State </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="state" id="state" required>
                                  @if(!empty($state))
                                    @foreach($state as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->countrie_id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   
                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  city </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="city" id="city" required>
                                  @if(!empty($city))
                                    @foreach($city as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->state_id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>  
                          <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Sector </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="categorie_id" id="categorie_id" required>
                                  @if(!empty($categorie))
                                    @foreach($categorie as $count)
                                       <option value="{{$count->id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div> 

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Initiator </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="provider_id" id="provider_id" required>
                                  @if(!empty($user))
                                    @foreach($user as $count)
                                       <option value="{{$count->id}}">{{$count->name}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div> 

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <div class="form-label">
                              <p class="col-grey"> Case  National Certificate </p>
                           </div>
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" height="200" width="200" id="frame5">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="national_certificate" accept="image/*"  onchange="loadImg5()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Title (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  Title (En) "name="title" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('title')}}"  required >
                           </div>
                        </div>      

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Title (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  Title (Ar) "name="title_ar"  value="{{old('title_ar')}}"  required >
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  description (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder=" Case  description (En) "name="description" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('description')}}"  required  rows="5" cols="10"></textarea>
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  description (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder=" Case  description (Ar) "name="description_ar"  value="{{old('description_ar')}}"  required  rows="5" cols="10"></textarea>
                           </div>
                        </div>  
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  Goal </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="number" class="form-control" placeholder=" Case  Goal "name="goal" pattern="[0-9]+"  oninvalid="setCustomValidity('Please enter  Numbers only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('goal')}}"  required >
                           </div>
                        </div>
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  National Number  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Case  National Number "name="national_number" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('national_number')}}"  required >
                           </div>
                        </div>   
                        
                           <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Case  End Date   </p>
                           </div>
                           <div class="form-field1 m-b-20">
                               <input  class="form-control" type="text" name="end_date" placeholder="click to enter date"  id="end_date" autocomplete="off">
                           </div>
                        </div> 
                          <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                          </div>
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



                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/case')}}'">  Cancel </button>
                         <button class="btn-c" type="submit">  Save  </button>
                     </div>

   </div>
                     
               
               </div>
            </div>
                </form>  
         </div>

@stop

@section('script')
<script>
  var date = new Date();
  var tomorrow = date.setDate(date.getDate() + 1);

  $('#end_date').datepicker({
                format: "yyyy-mm-dd",
                 autoclose: true,
                 // todayHighlight: true,
                  startDate:new Date((new Date()).valueOf() + 1000*3600*24),
                   
      });
$(document).ready(function() {
  $('#end_date').datepicker('setStartDate', new Date(yyyy, dd, MM));
});  
$('#country').change(function() {
  $('#state option').hide();
  $('#state option[data-id="' + $(this).val() + '"]').show();
  // add this code to select 1'st of streets automaticaly 
  // when city changed
  if ($('#state option[data-id="' + $(this).val() + '"]').length) {
    $('#state option[data-id="' + $(this).val() + '"]').first().prop('selected', true);
  }
  else {
   
    $('#state').val('');
  }

  $('#city option').hide();
  $('#city option[data-id="' + $('#state').val() + '"]').show();
  // add this code to select 1'st of streets automaticaly 
  // when city changed
  if ($('#city option[data-id="' + $('#state').val() + '"]').length) {
    $('#city option[data-id="' + $('#state').val() + '"]').first().prop('selected', true);
  }
  else {
 
      $('#city').val('');
  };
  
});
$('#state').change(function() {
  $('#city option').hide();
  $('#city option[data-id="' + $(this).val() + '"]').show();
 
  if ($('#city option[data-id="' + $(this).val() + '"]').length) {
    $('#city option[data-id="' + $(this).val() + '"]').first().prop('selected', true);
  }
  else {
    $('#city').val('');
  };
});
</script>
@stop@section('script')
