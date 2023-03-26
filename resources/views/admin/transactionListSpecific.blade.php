@extends('layouts.admin')
@section('content')

  <div class="dashboard-wrapper">
            <div class="row m-b-20">
               <div class="col-md-2 col-lg-2 col-sm-12 col-xs-12">
                  <div class="page-title">
                     <h3 class="col-black">  All Transactions </h3>
                  </div>
               </div>
               <div class="col-md-10 col-lg-10 col-sm-12 col-xs-12 ">
                  <div class="right-side-c"> 
                     <div class="date-sec  custom-c34">
                        <!-- <span>  
                           <label>From</label>
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="from" autocomplete="off">
                        </span>
                        <span>
                           <label>To</label>  
                          <input  class="form-control" type="text" placeholder="click to enter date"  id="to" autocomplete="off">
                        </span>
                        <span class="cal-icon icon-d  custom-c2  refresh-u"><img src="{{asset('images/img-1/regresh-icon-1.png')}}" id="transaction_filter"></i>
                        </i> -->
                        <span>
                             <a href="{{route('case.show',$id)}}" class="btn btn-primary btn-sm  " role="button" aria-disabled="true">Back</a>
                        </span>
                    
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

                        <table class="table-type2" id="transaction_case">
                           <thead>
                              <tr>
                                 
                                 <th>  ID</th>
                                 <th> Case Title </th>
                                   <th> Case Serial No </th>
                         
                                 <th>Payment Mode</th>
                                 <th>Transaction Number</th>
                                 <th>Transaction Amount</th>
                                 <th>Transaction Date</th>
                                 <th>Transaction Time</th>
                    
                                   <th> Status</th>
                                 <th> Aprrove Transaction </th>
                                  <th> Diss Aprrove Transaction </th>
                                 <th> Action</th>
                              </tr>
                           </thead>
                           <tbody>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
         </div>

@stop
@section('script')
<script>
var case_id = {{$id}};
   var i = 1;

 $("#transaction_case").DataTable({
            columnDefs: [
            { className: "actions-btn-c", targets:9 },
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
            "bPaginate": true,
            "responsive": true,
            "autoWidth": true,
            processing: true,
            serverSide: true,
            "bAutoWidth": false,
                    
            "order": [[ 1, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-transaction-details') }}", 
                type: 'GET',
                   data: {case_id:case_id},     
            },

              columns: [
               
            { data: 'id', name: 'id' },
            { data: 'case.title', name: 'case.title' },
               { data: 'case.serial_no', name: 'case.serial_no' },
         
            { data: 'mode', name: 'mode' },
            { data: 'transaction_id', name: 'transaction_id' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'amount', name: 'amount' },
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'transaction_time', name: 'transaction_time' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            // { data: 'user.name', name: 'user.name' , "render": function (data, type, full, meta) {
            //         if(data == null)
            //         {
            //             return "N/A";
            //         } 
            //         else
            //         {                   
            //                 return data;
                            
            //         }   
                  
            //     }
            // },
            // { data: 'initiator.name', name: 'initiator.name' , "render": function (data, type, full, meta) {
            //         if(data == null)
            //         {
            //             return "N/A";
            //         } 
            //         else
            //         {                   
            //                 return data;
                            
            //         }   
                  
            //     }
            // }, 
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                        if( data == 1)
                       {
                           return '<span class="badge badge-pill badge-primary">Approved</span>'; 
                       }
                       else if( data == 2)
                       {
                           return '<span class="badge badge-pill badge-danger">Diss Approved</span>'; 
                       }
                       else
                       {
                           return '<span class="badge badge-pill badge-info">Pending</span>';
                       }

                       
                    },
                }, 
               { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                      if( data == 0)
                       {
                           return '<label class="switch"><input type="checkbox"  onclick="activate_transaction('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }
                       else if( data == 1)
                       {
                           return '<label class="switch"><input type="checkbox"  checked id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                       }
                       else 
                       {
                           return '<label class="switch"><input type="checkbox"   id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                       }
                       
                    },
                }, 
                { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                      if( data == 0)
                       {
                           return '<label class="switch"><input type="checkbox"  onclick="deactivate_transaction('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }
                       else if( data == 2)
                       {
                           return '<label class="switch"><input type="checkbox"  checked id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                       }
                       else
                       {
                            return '<label class="switch"><input type="checkbox"   id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                       }
                       
                    },
                },   
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/transaction/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a>';
                    },
                }, 
                ]
    });
</script>
@stop