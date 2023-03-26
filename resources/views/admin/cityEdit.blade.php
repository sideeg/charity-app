@extends('layouts.admin')
@section('content')
        <div class="dashboard-wrapper">
               @include('includes.common')
           <form action="{{route('city.update',$user->id)}}" method="POST"  enctype="multipart/form-data" autocomplete="off">
               @csrf
              @method('PUT')

            <div class="row m-b-20">
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  City  </h3>
                  </div>
               </div>
               <div class="col-md-6 col-lg-6 col-sm-6 col-xs-12  back-btn text-right float-right">
                  <div class="page-title">
                     <h3 class="col-black"> 
                      <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/city')}}'"> Back  </button> </h3>
                  </div>
               </div>
            </div>
            <div class="block-element">
               <div class="box-type1  notify">
                  <h5 class="basic-info-c">Edit City</h5>
                  <div class="row">
                     <div class="col-md-12">
                        <div class="block-element text-left  basic-info-c4">
                       <!--  <button class="btn-c" type="button" onclick="window.location.href='{{url('admin/city')}}'"> Back  </button> </h3> -->
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
                                <select class="form-control"  name="countrie_id" id="country" required>
                                  @if(!empty($countrie))
                                    @foreach($countrie as $count)
                                       <option value="{{$count->id}}" {{($user->countrie_id == $count->id ? 'selected' : '')}}>{{$count->title}}</option>
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
                                <select class="form-control"  name="state_id" id="state" required>
                                  @if(!empty($state))
                                    @foreach($state as $count)
                                       <option value="{{$count->id}}" data-id="{{$count->countrie_id}}" {{($user->state_id == $count->id ? 'selected' : '')}} >{{$count->title}}</option>
                                    @endforeach
                                  @endif
                                </select>
                           </div> 
                        </div>   
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey">  Name </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder=" Name "name="title" pattern="[a-zA-Z\s]+" oninvalid="setCustomValidity('Please add in this field and Please enter  alphabets only. ')" onkeypress="return /[a-zA-Z\s]+/i.test(event.key)" onkeydown="try{setCustomValidity('')}catch(e){}"  value="{{$user->title}}" required >
                           </div>
                        </div>
                        
                        <div class="col-md-6 col-lg-6 col-sm-6 col-xs-6">
                           <div class="form-label">
                              <p class="col-grey"> Arabic Name  </p>
                           </div>
                           <div class="form-field1 m-b-20">
                              <input type="text" class="form-control" placeholder="Arabic Name "  name="title_arabic" value="{{$user->title_arabic}}" required >
                           </div>
                        </div>
                        
                   <div class="block-element text-right">
                       
                        
                         <button class="btn-c  cancel  reset" type="button" onclick="window.location.href='{{url('admin/city')}}'">  Cancel </button>
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
  // in case if there's no corresponding street: 
  // reset select element
  else {
    $('#state').val('');
  };
});
</script>
@stop