@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
        	     @include('includes.common')
        	 <form action="{{route('sms.store')}}" method="POST"  enctype="multipart/form-data" autocomplete="off">
        	 	   @csrf
    

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  Send Sms  </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Send Sms </h5>
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
                              <p class="col-grey">   Title (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Please Enter a Title "name="title" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('title')}}"   >
                           </div>
                        </div>      

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">   Title (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Please Enter a Title (Ar) "name="title_ar"  value="{{old('title_ar')}}"   >

                              <input type="hidden" id="sendNow" value="0" name="now">
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Description (En) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder=" Please Enter a
Description (En) "name="description" pattern="[a-zA-Z0-9\s]+"  oninvalid="setCustomValidity('Please enter on Numbers or alphabets only. ')" onchange="try{setCustomValidity('')}catch(e){}"  value="{{old('description')}}"    rows="5" cols="10"></textarea>
                           </div>
                        </div>  

                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Description (Ar) </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <textarea   placeholder="Please Enter a
Description (Ar) "name="description_ar"  value="{{old('description_ar')}}"    rows="5" cols="10"></textarea>
                           </div>
                        </div>  
                                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                            <div class="form-label">
                              <p class="col-grey"> Image </p>
                           </div>
                        <div class="preview text-left">
                        
                            <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" height="200" width="200" id="frame">
                         <!--    <img class="preview-img" src="{{asset('images/img-1/profile-img.png')}}" alt="Preview Image" width="200" height="200"> -->
                           
                           <div class="browse-button">
                              <i class="fa fa-camera"></i>
                              <input class="browse-input" type="file" name="image" accept="image/*"  onchange="loadImg()" >
                           </div>
                           <span class="Error"></span>
                        </div>
                     </div>

                         <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Platform </p>
                           </div>
<ul class="chec-radio">
  <li class="pz">
    <label class="radio-inline">
      <span class="icon">
       <i class="fa fa-apple" aria-hidden="true"></i></span>
      <input type="radio" checked="" id="pro-chx-residential" name="platform" class="pro-chx" value="ios" required="">
      <div class="clab">IOS</div>
    </label>
  </li>
  <li class="pz">
    <label class="radio-inline">
       <span class="icon ">
        <i class="fa fa-android" aria-hidden="true"></i></span>
      <input type="radio" id="pro-chx-residential" name="platform" class="pro-chx" value="android">
      <div class="clab">Android</div>
    </label>
  </li>
  <li class="pz">
    <label class="radio-inline">
      <span class="icon">
       <i class="fa fa-user" aria-hidden="true"></i></span>
      <input type="radio" id="pro-chx-residential" name="platform" class="pro-chx" value="all">
      <div class="clab"> All</div>
    </label>
  </li>
                        </div>   
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  User </p>
                           </div>
 <ul class="chec-radio select-user">
  <li class="pz">
    <label class="radio-inline">
      <span class="icon">
       <img src="https://vipankumar.in/charity-app/public/images/img-1/init-4-black.png"></span>
      <input type="radio" checked="" id="pro-chx-residential" name="user" class="pro-chx" value="initiator"  required="">
      <div class="clab">Initiator</div>
    </label>
  </li>
  <li class="pz">
    <label class="radio-inline">
       <span class="icon ">
        <img src="https://vipankumar.in/charity-app/public/images/img-1/contributors-black.png"></span>
      <input type="radio" id="pro-chx-residential" name="user" class="pro-chx" value="contributor">
      <div class="clab">Contributor</div>
    </label>
  </li>
  <li class="pz">
    <label class="radio-inline">
      <span class="icon">
       <i class="fa fa-user" aria-hidden="true"></i></span>
      <input type="radio" id="pro-chx-residential" name="user" class="pro-chx" value="all">
      <div class="clab"> All users</div>
    </label>
  </li>

                        </div> 
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Case </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="matter" >
                                  <option value="">{{"Please Select"}}</option>
                                  @if(!empty($matter))
                                    @foreach($matter as $count)
                                       <option value="{{$count->id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   

                    <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">Select  Country </p>
                           </div>
                           <div class="form-group">
                                <select class="form-control"  name="country" id="country" required>
                                  <option value="{{'all'}}">{{'All'}}</option>
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
                                  <option value="{{'all'}}" data-id="{{'all'}}">{{'All'}}</option>
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
                                    <option value="{{'all'}}" data-id="{{'all'}}">{{'All'}}</option>
                                  @if(!empty($city))
                                    @foreach($city as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->state_id}}">{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>  
                           
                        <div class='col-sm-6' style="display:none" id="baddCh">
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker2'>
                                <input type='text' name="send_at" class="form-control" />
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        </div>
           
                    
                    
                        
              
                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/bulk-sms-list')}}'">  Cancel </button>
                          <button class="btn-c" type="button" id="send_later">  Send Later  </button>
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

$('#datetimepicker2').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:ss',
     minDate: moment().add(1, 'hours'),
     maxDate: moment().add(3, 'months')
});
 
    $("#send_later").click(function () {
      $("#baddCh").fadeIn(1000);
      $("#sendNow").val("1");
       toastr.info('Please select Schedule time And Save.');
      
      // $("#case_basic_details").fadeOut(1000);       
    });
    
    // $("#submit_form_cancel").click(function () {
    //    event.preventDefault();
    //   $("#case_update_form").fadeOut(1000);
    //   $("#case_basic_details").fadeIn(1000);       
    // });    
</script>
@stop