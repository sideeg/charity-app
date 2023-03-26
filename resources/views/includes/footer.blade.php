    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">  
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />

    <script src="{{asset('js/intlTelInput.min.js')}}"></script>

    <script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>

<!--   <script src="//code.jquery.com/jquery-3.5.1.js"></script> -->
     <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

    <script src="//cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="//cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
    <script src="//cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
   


      <script src="js/bootstrap.min.js"> </script>
      <script src="js/functions.js"> </script>
      <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
      <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

      <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script> 
      <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>  
      <script src="//cdn.datatables.net/plug-ins/1.10.12/sorting/datetime-moment.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
      <script src="{{asset('js/intlTelInput-jquery.min.js')}}"></script>
  

      <link href="//gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="//gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

    <script type="text/javascript">
        @if(Session::has('success'))
            toastr.success("{{ Session::get('success') }}");
            {{Session::forget('success')}}
            {{
            Artisan::call('cache:clear')
            }}

        @endif
        @if(Session::has('info'))
             toastr.info("{{ Session::get('info') }}");
            {{Session::forget('info')}}
        @endif
        @if(Session::has('warning'))
            toastr.warning("{{ Session::get('warning') }}");
            {{Session::forget('warning')}}
        @endif
        @if(Session::has('error'))
            toastr.error("{{ Session::get('error') }}");
            {{Session::forget('error')}}
        @endif  
       function getDate(data){
        var date = new Date(data);
                        var dd = date.getDate();
                        var mm = date.getMonth()+1; 
                        var yyyy = date.getFullYear();
                        if(dd<10) 
                        {
                            dd='0'+dd;
                        } 

                        if(mm<10) 
                        {
                            mm='0'+mm;
                        }
                        var today = dd+'-'+mm+'-'+yyyy;
                        return today;
        }                
        $( document ).ready(function() {
             $.fn.dataTable.moment('DD-MM-YYYY');

            $(window).keydown(function(event){
                if(event.keyCode == 13) {
                     event.preventDefault();
                    return false;
                }
            });

             $("#small_button").click(function(e) {
             e.stopPropagation();
            if ($("body").hasClass("sidebar-small")) {
                       $("body").removeClass("sidebar-small");

                }
                else
                {
                     $("body").addClass("sidebar-small");
                        
                }
            });
            $('#to').datepicker({
                format: "yyyy-mm-dd",
                 autoclose: true,
                 todayHighlight: true,
                 endDate: new Date()
            });  
            $('#from').datepicker({
                format: "yyyy-mm-dd",
                 autoclose: true,
                 todayHighlight: true,
                endDate: new Date(),

            }); 
            $("#to").change(function () {
                var startDate = document.getElementById("from").value;
                var endDate = document.getElementById("to").value;
                console.log(startDate,endDate);
                if ((Date.parse(startDate) >= Date.parse(endDate))) {
                    toastr.info('To date must be greater than From date');
                    document.getElementById("to").value = "";
                }
            });
            $("#to").attr( 'readOnly' , 'true' );
            $("#from").attr( 'readOnly' , 'true' );
            var i = 1;
            // $("#customers").load(function(){

            // });
            $("#customers").DataTable({
            dom: 'lBfrtip',
            "bSort": true,
            // buttons: [
            //     'copy', 'csv', 'excel',  'print'
            // ],  

             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],   
            columnDefs: [
            { className: "actions-btn-c", targets:8 },
             { orderable: false, targets: -1 }
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-customers') }}", 
                type: 'GET',
                
            },

            columns: [
            
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' , "render": function (data, type, full, meta) {
                   if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }  
                  
                }
            },
            { data: 'email', name: 'email' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'phone_number', name: 'phone_number' , "render": function (data, type, full, meta) { 
                     if(data == null)
                    {
                        return "N/A";
                    }
                  
                    else
                    {                   
                            return full.country_code+full.phone_number;
                            
                    }   
                  
                }  
                  
                
            },
             { data: 'user_views', name: 'user_views' },
              { data: 'total_contributions', name: 'total_contributions' },
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                             var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                           return '<span class="label label-primary" onclick="activate_customer('+full.id+')" id="custoner_checkbox">Active</span>'; 
                       }
                       else
                       {
                           return '<span class="label label-danger" onclick="activate_customer('+full.id+')" id="custoner_checkbox"> In Active</span>';
                       }

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/contributor/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/contributor/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                       // <a  onclick="delete_customer('+data+')" class="edit-btn-f"   data-toggle="modal" data-target="#myModal"><i class="fa fa-ban"></i></a>
                    },
                }, 
                ]

    });
      $("#bulk_emails").DataTable({
            // dom: 'lBfrtip',
            // buttons: [
            //     'copy', 'csv', 'excel', 'pdf', 'print'
            // ],  

        //      buttons: [
        //     {
        //         extend: 'copyHtml5',
        //         exportOptions: {
        //             columns: [ 0, ':visible' ]
        //         }
        //     },
        //     {
        //         extend: 'excelHtml5',
        //         exportOptions: {
        //             columns: ':visible'
        //         }
        //     },
        //     {
        //         extend: 'pdfHtml5',
        //         exportOptions: {
        //             columns: [ 0, 1, 2, 4 ]
        //         }
        //     },
           
        // ],  
            columnDefs: [
            { className: "actions-btn-c", targets:8 },

         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/bulk-emails-lising') }}", 
                type: 'GET',
                
            },

            columns: [
            
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_ar', name: 'title_ar' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 10){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,10)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }    
                  
                }
            },
            { data: 'description', name: 'description' , "render": function (data, type, full, meta) {
                   if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }    
                }
            },
             { data: 'description_ar', name: 'description_ar', "render": function (data, type, full, meta) {
                     if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }    
                }
            },
            { data: 'status', name: 'status', "render": function (data, type, full, meta) {
                    if(data == 1)
                    {
                        return "Delivered";
                    } 
                    else
                    {                   
                            return  "Pending";
                            
                    }   
                  
                }
            },
            
              { data: 'country', name: 'country' },
               { data: 'state', name: 'state' },
               { data: 'city', name: 'city' },
              { data: 'platform', name: 'platform' },
              { data: 'users', name: 'users' },      
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                           var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
          
                ]

    });
    $("#bulk_push").DataTable({
     
            columnDefs: [
            { className: "actions-btn-c", targets:8 },
         
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/bulk-push-notifications-listing') }}", 
                type: 'GET',
                
            },

            columns: [
            
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_ar', name: 'title_ar' , "render": function (data, type, full, meta) {
                   if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 10){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,10)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'description', name: 'description' , "render": function (data, type, full, meta) {
                     if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }    
                }
            },
             { data: 'description_ar', name: 'description_ar', "render": function (data, type, full, meta) {
                     if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status', "render": function (data, type, full, meta) {
                    if(data == 1)
                    {
                        return "Delivered";
                    } 
                    else
                    {                   
                            return  "Pending";
                            
                    }   
                  
                }
            },
            
              { data: 'country', name: 'country' },
               { data: 'state', name: 'state' },
               { data: 'city', name: 'city' },
              { data: 'platform', name: 'platform' },
              { data: 'users', name: 'users' },      
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                             var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
          
                ]

    });
     $("#bulk_sms").DataTable({
     
            columnDefs: [
            { className: "actions-btn-c", targets:8 },
           
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/bulk-sms-listing') }}", 
                type: 'GET',
                
            },

            columns: [
            
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_ar', name: 'title_ar' , "render": function (data, type, full, meta) {
                   if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 10){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,10)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'description', name: 'description' , "render": function (data, type, full, meta) {
                     if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }    
                }
            },
             { data: 'description_ar', name: 'description_ar', "render": function (data, type, full, meta) {
                     if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status', "render": function (data, type, full, meta) {
                    if(data == 1)
                    {
                        return "Delivered";
                    } 
                    else
                    {                   
                            return  "Pending";
                            
                    }   
                  
                }
            },
            
              { data: 'country', name: 'country' },
               { data: 'state', name: 'state' },
               { data: 'city', name: 'city' },
              { data: 'platform', name: 'platform' },
              { data: 'users', name: 'users' },      
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
          
                ]

    });
    $("#sectors").DataTable({
         dom: 'lBfrtip',
            buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:11 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-sectors') }}", 
                type: 'GET',
                
            },
            format: {
                    body: function (data, row, column, node) {
                        const arabic = /[\u0600-\u06FF]/;

                        if (arabic.test(data)) {
                            return data.split(' ').reverse().join(' ');
                        }
                        return data;
                    }
                },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'serial_no', name: 'serial_no' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
             { data: 'type', name: 'type' , "render": function (data, type, full, meta) {
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
                { data: 'total_cases', name: 'total_cases' },
            { data: 'user_views', name: 'user_views' },
             { data: 'total_goals', name: 'total_goals' },
              { data: 'total_contributions', name: 'total_contributions' },
           { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                           var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {

                             return '<span class="label label-primary"  onclick="activate_sector('+full.id+')" id="custoner_checkbox">Active</span>'; 
                           
                       }
                       else
                       {
                            return '<span class="label label-danger"  onclick="activate_sector('+full.id+')" id="custoner_checkbox"> In Active</span>'; 
                          
                       }

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/sector/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });       

     $("#transaction").DataTable({
         dom: 'lBfrtip',
            buttons: [
                'copy', 'csv', 'excel',  'print'
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:9 },
             { orderable: false, targets: -1 }
         
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
            data: {from:from,to:to},              
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-transaction-details') }}", 
                type: 'GET',
                
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
                            var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
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
                         return '<span class="label label-primary"onclick="activate_transaction('+full.id+')" > Approve </span> <span class="label label-danger"onclick="deactivate_transaction('+full.id+')" > Diss Approve </span>'; 
                         
                       }
                       else if( data == 1)
                       {
                           return '<span class="label label-primary" > Approve </span>';
                       }
                       else 
                       {
                           return '<span class="label label-danger"> Diss Approve </span>';
                       }
                       
                    },
                }, 
                // { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                //       if( data == 0)
                //        {
                //            return '<label class="switch"><input type="checkbox"  onclick="deactivate_transaction('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                //        }
                //        else if( data == 2)
                //        {
                //            return '<label class="switch"><input type="checkbox"  checked id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                //        }
                //        else
                //        {
                //             return '<label class="switch"><input type="checkbox"   id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                //        }
                       
                //     },
                // },   
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/transaction/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a>';
                    },
                }, 
                ]

    });


    $("#countries").DataTable({
         dom: 'lBfrtip',
            // buttons: [
            //     'copy', 'csv', 'excel',  'print'
            // ],
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:5 },
             { orderable: false, targets: -1 }
         
            ], 
            
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-country') }}", 
                type: 'GET',
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_ar', name: 'title_ar' , "render": function (data, type, full, meta) {
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
        
           { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {    
                        
                        var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';           
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_country('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_country('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }
                      

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/country/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });       

    $("#states").DataTable({
         dom: 'lBfrtip',
           buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],  
            columnDefs: [
            { className: "actions-btn-c", targets:5 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-states') }}", 
                type: 'GET',
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
            { data: 'country.title', name: 'country.title' , "render": function (data, type, full, meta) {
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
             
           { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                             var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_state('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_state('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }

                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/state/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });  
    $("#cities").DataTable({
         dom: 'lBfrtip',
         buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],          
            columnDefs: [
            { className: "actions-btn-c", targets:7 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-cities') }}", 
                type: 'GET',
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
          
            { data: 'country.title', name: 'country.title' , "render": function (data, type, full, meta) {
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
              { data: 'state.title', name: 'state.title' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
           
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
             
           { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                         var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                    if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_city('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_city('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/city/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });        

    $("#provider").DataTable({
         dom: 'lBfrtip',
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],      
            columnDefs: [
            { className: "actions-btn-c", targets:14 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                paginate: {
                    next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                }
            },
            "bPaginate": true,
            "responsive": true,
            "autoWidth": false,
            processing: true,
            serverSide: true,
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-initiator') }}", 
                type: 'GET',                
            },
            columns: [
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' , "render": function (data, type, full, meta) {
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

          
            { data: 'country', name: 'country' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            }, { data: 'city', name: 'city' , "render": function (data, type, full, meta) {
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
             { data: 'total_cases', name: 'total_cases' },
              { data: 'total_cases_active', name: 'total_cases_active' },
               { data: 'total_cases_completed', name: 'total_cases_completed' },
                { data: 'total_cases_contribution', name: 'total_cases_contribution' },



             { data: 'location', name: 'location' , "render": function (data, type, full, meta) {
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
            { data: 'phone_number', name: 'phone_number' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {       

                            return full.country_code+full.phone_number;
                            
                    }   
                  
                }
            },
            

            { data: 'email', name: 'email' , "render": function (data, type, full, meta) {
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
            
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
                   { data: 'document_verified', name: 'document_verified' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_provider_document('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_provider_document('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }

                       
                    },
                }, 
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                           
                           return '<span class="label label-primary" onclick="activate_provider('+full.id+')" id="custoner_checkbox">  Active </span>'; 
                       }
                       else
                       {
                           return '<span class="label label-danger"onclick="activate_provider('+full.id+')" id="custoner_checkbox"> In Active</span>';
                       }

                       
                    },
                },
         
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/initiator/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/initiator/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                       // <a href="#" onclick="delete_provider('+data+')" class="edit-btn-f"   data-toggle="modal" data-target="#myModal"><i class="fa fa-ban"></i></a>
                    },
                }, 
                ]

        });   
         $("#cases").DataTable({
             dom: 'lBfrtip',
            buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],      
            columnDefs: [
            { className: "actions-btn-c", targets:14 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                paginate: {
                    next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                }
            },
            "bPaginate": true,
            "responsive": true,
            "autoWidth": false,
            processing: true,
            serverSide: true,
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-cases') }}", 
                type: 'GET',                
            },
            columns: [
            { data: 'id', name: 'id' },
             { data: 'initiator.name', name: 'initiator.name' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
             { data: 'serial_no', name: 'serial_no' },
            { data: 'description', name: 'description' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 10){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,10)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
           { data: 'category.title', name: 'category.title' , "render": function (data, type, full, meta) {
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
            { data: 'country', name: 'country' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            }, { data: 'city', name: 'city' , "render": function (data, type, full, meta) {
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
            { data: 'goal', name: 'goal' , "render": function (data, type, full, meta) {
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
                { data: 'total_views', name: 'total_views' },

             { data: 'contributed', name: 'contributed' , "render": function (data, type, full, meta) {
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
            
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                        var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
               { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == "Pending")
                       {
                           return data; 
                       }
                       else if( data == "Approved")
                       {
                            return 'Open'; 
                       }
                       else if( data == "Completed")
                       {
                            return 'Completed'; 
                       }
                       else
                       {
                           return data; 
                       }

                       
                    },
                },
                 { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == "Pending")
                       {
                           return '<label class="switch"><input type="checkbox"  onclick="activate_case('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }
                       else
                       {
                            return '<label class="switch"><input type="checkbox" checked disabled  id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }

                       
                    },
                },
               
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/case/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/case/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

        });        
        $('#customer_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
              var country = $('#country').find(":selected").val();
             var city = $('#city').find(":selected").val();
            $('#customers').DataTable().destroy();
            fetch_data_customer(from,to,country,city);
        });
        
        $('#provider_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
           var country = $('#country').find(":selected").val();
             var city = $('#city').find(":selected").val();
            $('#provider').DataTable().destroy();
            fetch_data_provider(from,to,country,city);
        });
         $('#sector_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
            $('#sectors').DataTable().destroy();
            fetch_data_sectors(from,to);
        });
        $('#country_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
            $('#countries').DataTable().destroy();
            fetch_data_countries(from,to);
        });
        
        $('#state_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
           var country = $('#country').find(":selected").val();
            $('#states').DataTable().destroy();
            fetch_data_states(from,to,country);
        }); 
        $('#city_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
           var country = $('#country').find(":selected").val();
           var state = $('#state').find(":selected").val();
           
            $('#cities').DataTable().destroy();
            fetch_data_cities(from,to,country,state);
        });  

         $('#transaction_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
            $('#transaction').DataTable().destroy();
            fetch_data_transaction(from,to);
        });
         $('#cases_filter').click(function(){
            var from = $('#from').val();
            var to = $('#to').val();
             var category = $('#category').find(":selected").val();
              var country = $('#country').find(":selected").val();
             var city = $('#city').find(":selected").val();
             var status = $('#status').find(":selected").val();
            $('#cases').DataTable().destroy();
            fetch_data_cases(from,to,category,country,city,status);
        });

         $('#reset').click(function(){
            var id = jQuery('.table-type2').attr('id');
            if(id == 'customers')
            {
                console.log(id);
                $('#from').val('');
                $('#to').val('');
                if($('#country').find(":selected").val() != '')
                {
                      $("option:selected").prop("selected", false);
                }
                if($('#city').find(":selected").val() != '')
                {
                      $("option:selected").prop("selected", false);
                }
                $('#customers').DataTable().destroy();
                fetch_data_customer('','','','');
            }
            if(id == 'countries')
            {
                $('#from').val('');
                $('#to').val('');   
                $('#countries').DataTable().destroy();
                fetch_data_countries('','');
            }
            if(id == 'states')
            {
                if($('#country').find(":selected").val() != '')
                {
                     $("option:selected").prop("selected", false);
                }
                $('#from').val('');
                $('#to').val('');   
                $('#states').DataTable().destroy();
                fetch_data_states('','','');
            }
            if(id == 'cities')
            {
                if($('#country').find(":selected").val() != '')
                {
                     $("option:selected").prop("selected", false);
                }
                if($('#state').find(":selected").val() != '')
                {
                      $("option:selected").prop("selected", false);
                }
                $('#from').val('');
                $('#to').val('');
                $('#cities').DataTable().destroy();
                fetch_data_cities('','','','');             
            }
            if(id == 'provider')
            {
                if($('#country').find(":selected").val() != '')
                {
                    $("option:selected").prop("selected", false);
                }
                if($('#city').find(":selected").val() != '')
                {
                     $("option:selected").prop("selected", false);
                }
                $('#from').val('');
                $('#to').val('');  
                $('#provider').DataTable().destroy();
                fetch_data_provider('','','','');             
            }
            if(id == 'cases')
            {
                if($('#country').find(":selected").val() != '')
                {
                   $("option:selected").prop("selected", false);
                }
                if($('#city').find(":selected").val() != '')
                {
                     $("option:selected").prop("selected", false);
                }
                if($('#category').find(":selected").val() != '')
                {
                    $("option:selected").prop("selected", false);
                }
                if($('#status').find(":selected").val() != '')
                {
                     $("option:selected").prop("selected", false);
                }
                $('#from').val('');
                $('#to').val('');  
                $('#cases').DataTable().destroy();
                    fetch_data_cases('','','','','','');           
            }
            if(id == 'transaction')
            {
                $('#from').val('');
                $('#to').val('');  
                $('#transaction').DataTable().destroy();
                fetch_data_transaction('','');      
            }
        });
        function fetch_data_customer(from = '',to = '',country = '',city ='')
        {
            $("#customers").DataTable({
                 dom: 'lBfrtip',
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],      
            columnDefs: [
            { className: "actions-btn-c", targets:8 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
                "autoWidth": false,
                processing: true,
                serverSide: true,
                "order": [[ 0, "desc" ]],
                ajax: {
                url: "{{ url('admin/get-customers') }}", 
                type: 'GET',
            data: {from:from,to:to,country:country,city:city},   
                },
            columns: [
                
            { data: 'id', name: 'id' },
             { data: 'name', name: 'name' , "render": function (data, type, full, meta) {
                   if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }  
                  
                }
            },
            { data: 'email', name: 'email' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 15){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,12)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
            { data: 'phone_number', name: 'phone_number' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {       

                            return full.country_code+full.phone_number;
                            
                    }   
                  
                }
            },
            
             { data: 'user_views', name: 'user_views' },
              { data: 'total_contributions', name: 'total_contributions' },
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                          var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                           return '<span class="label label-primary" onclick="activate_customer('+full.id+')" id="custoner_checkbox">Active</span>'; 
                       }
                       else
                       {
                           return '<span class="label label-danger" onclick="activate_customer('+full.id+')" id="custoner_checkbox"> In Active</span>';
                       }

                       
                    },
                }, 
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/contributor/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/contributor/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                       // <a  onclick="delete_customer('+data+')" class="edit-btn-f"   data-toggle="modal" data-target="#myModal"><i class="fa fa-ban"></i></a>
                    },
                }, 
                ]

            });
        }
        function fetch_data_provider(from = '',to = '',country = '',city ='')
        {
            $("#provider").DataTable({
                 dom: 'lBfrtip',
                  buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],   
            columnDefs: [
            { className: "actions-btn-c", targets:14 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                paginate: {
                    next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                }
            },
            "bPaginate": true,
            "responsive": true,
            "autoWidth": false,
            processing: true,
            serverSide: true,
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-initiator') }}", 
                type: 'GET',
                data: {from:from,to:to,country:country,city:city},                
            },
            
          columns: [
            { data: 'id', name: 'id' },
            { data: 'name', name: 'name' , "render": function (data, type, full, meta) {
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

          
            { data: 'country', name: 'country' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            }, { data: 'city', name: 'city' , "render": function (data, type, full, meta) {
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
             { data: 'total_cases', name: 'total_cases' },
              { data: 'total_cases_active', name: 'total_cases_active' },
               { data: 'total_cases_completed', name: 'total_cases_completed' },
                { data: 'total_cases_contribution', name: 'total_cases_contribution' },



             { data: 'location', name: 'location' , "render": function (data, type, full, meta) {
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
            { data: 'phone_number', name: 'phone_number' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {       

                            return full.country_code+full.phone_number;
                            
                    }   
                  
                }
            },
            

            { data: 'email', name: 'email' , "render": function (data, type, full, meta) {
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
            
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                        var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
             { data: 'document_verified', name: 'document_verified' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_provider_document('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_provider_document('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }

                       
                    },
                }, 
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                           
                           return '<span class="label label-primary" onclick="activate_provider('+full.id+')" id="custoner_checkbox">  Active </span>'; 
                       }
                       else
                       {
                           return '<span class="label label-danger"onclick="activate_provider('+full.id+')" id="custoner_checkbox"> In Active</span>';
                       }

                       
                    },
                },
               
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/initiator/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/initiator/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                       // <a href="#" onclick="delete_provider('+data+')" class="edit-btn-f"   data-toggle="modal" data-target="#myModal"><i class="fa fa-ban"></i></a>
                    },
                }, 
                ]
   

        });
        }

        function fetch_data_cases(from = '',to = '',category='',country = '',city ='',status='')
        {
            $("#cases").DataTable({
                 dom: 'lBfrtip',
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:14 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                paginate: {
                    next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                    previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                }
            },
            "bPaginate": true,
            "responsive": true,
            "autoWidth": false,
            processing: true,
            serverSide: true,
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-cases') }}", 
                type: 'GET',  
                      data: {from:from,to:to,category:category,country:country,city:city,status:status},                 
            },
            columns: [
            { data: 'id', name: 'id' },
             { data: 'initiator.name', name: 'initiator.name' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
             { data: 'serial_no', name: 'serial_no' },
            { data: 'description', name: 'description' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    }
                    else if(data.length > 10){
                        return '<span class="tooltip-r" data-toggle="tooltip" data-placement="left" title="'+data+'">'+data.substring(0,10)+'...</span>';
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            },
           { data: 'category.title', name: 'category.title' , "render": function (data, type, full, meta) {
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
            { data: 'country', name: 'country' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                            return data;
                            
                    }   
                  
                }
            }, { data: 'city', name: 'city' , "render": function (data, type, full, meta) {
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
            { data: 'goal', name: 'goal' , "render": function (data, type, full, meta) {
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
              { data: 'total_views', name: 'total_views' },

             { data: 'contributed', name: 'contributed' , "render": function (data, type, full, meta) {
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
         
            
            { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                         var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
             { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == "Pending")
                       {
                           return data; 
                       }
                       else if( data == "Approved")
                       {
                            return 'Open'; 
                       }
                       else if( data == "Completed")
                       {
                            return 'Completed'; 
                       }
                       else
                       {
                           return data; 
                       }

                       
                    },
                },
                 { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == "Pending")
                       {
                             return '<span class="label label-primary"onclick="activate_provider_document('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                           return '<label class="switch"><input type="checkbox"  onclick="activate_case('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }
                       else
                       {
                            return '<label class="switch"><input type="checkbox" checked disabled  id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }

                       
                    },
                },
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/case/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a><a href="{{url('admin/case/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

        });               
        }    
        $("#shimpent").DataTable({
             dom: 'lBfrtip',
            buttons: [
                'copy', 'csv', 'excel',  'print'
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:7 },
             { orderable: false, targets: -1 }
         
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
            data: {from:from,to:to},              
            "order": [[ 1, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-shipments') }}", 
                type: 'GET',
                
            },

            columns: [
                {
                "render": function(data, type, full, meta) {
                    return i++;
                }
            },
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' },
            { data: 'from', name: 'from' },
            { data: 'to', name: 'to' },
            // { data: 'height', name: 'height' },
            //   { data: 'width', name: 'width' },
            // { data: 'image', name: 'image' , "render": function (data, type, full, meta) {
            //         if(data == null)
            //         {
            //             return "N/A";
            //         } 
            //         else
            //         {                   
            //                 return '<img src="{{url('storage/app/')}}/'+data+'" height="50px">';
                            
            //         }   
                  
            //     }
            // },  
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
            { data: 'user.email', name: 'user.email' , "render": function (data, type, full, meta) {
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
            { data: 'user.phone_number', name: 'user.phone_number' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {       

                            return full.user.country_code+full.user.phone_number;
                            
                    }   
                  
                }
            },
            
            //  { data: 'user.image', name: 'user.image' , "render": function (data, type, full, meta) {
            //         if(data == null)
            //         {
            //             return "N/A";
            //         } 
            //         else
            //         {                   
            //                 return '<img src="{{url('storage/app/')}}/'+data+'" height="50px">';
                            
            //         }   
                  
            //     }
            // },
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/shipments/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a>';
                    },
                }, 
                ]

    }); 
        function fetch_data_transaction(from = '',to = '')
        {
             var i = 1;
                $("#transaction").DataTable({
                     dom: 'lBfrtip',
            buttons: [
                'copy', 'csv', 'excel',  'print'
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:9},
             { orderable: false, targets: -1 }
         
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
            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-transaction-details') }}", 
                type: 'GET',
                   data: {from:from,to:to}, 
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
                          var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
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
                         return '<span class="label label-primary"onclick="activate_transaction('+full.id+')" > Approve </span> <span class="label label-danger"onclick="deactivate_transaction('+full.id+')" > Diss Approve </span>'; 
                         
                       }
                       else if( data == 1)
                       {
                           return '<span class="label label-primary" > Approve </span>';
                       }
                       else 
                       {
                           return '<span class="label label-danger"> Diss Approve </span>';
                       }
                    }   
                }, 
                // { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                //       if( data == 0)
                //        {
                //            return '<label class="switch"><input type="checkbox"  onclick="deactivate_transaction('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                //        }
                //        else if( data == 2)
                //        {
                //            return '<label class="switch"><input type="checkbox"  checked id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                //        }
                //        else
                //        {
                //             return '<label class="switch"><input type="checkbox"   id="custoner_checkbox" disabled><span class="slider round"></span></label>';
                //        }
                       
                //     },
                // },   
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/transaction/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a>';
                    },
                }, 
                ]


    }); 

        }    

        function fetch_data_shipment(from = '',to = '')
        {
                $("#shimpent").DataTable({
            columnDefs: [
            { className: "actions-btn-c", targets:7 },
             { orderable: false, targets: -1 }
         
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
                url: "{{ url('admin/get-shipments') }}", 
                type: 'GET',
                
            },

            columns: [
                {
                "render": function(data, type, full, meta) {
                    return i++;
                }
            },
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' },
            { data: 'from', name: 'from' },
            { data: 'to', name: 'to' },
            // { data: 'height', name: 'height' },
            //   { data: 'width', name: 'width' },
            // { data: 'image', name: 'image' , "render": function (data, type, full, meta) {
            //         if(data == null)
            //         {
            //             return "N/A";
            //         } 
            //         else
            //         {                   
            //                 return '<img src="{{url('storage/app/')}}/'+data+'" height="50px">';
                            
            //         }   
                  
            //     }
            // },  
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
            { data: 'user.email', name: 'user.email' , "render": function (data, type, full, meta) {
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
            { data: 'user.phone_number', name: 'user.phone_number' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {       

                            return full.user.country_code+full.user.phone_number;
                            
                    }   
                  
                }
            },
            
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '<a href="{{url('admin/shipments/')}}/'+data+'" class="edit-btn-f"><i class="fa fa-eye"></i></a>';
                    },
                }, 
                ]

    }); 

        }    
    })
    
    function activate_customer($id)
    {
          event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-customer")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });

    }
     function delete_customer($id)
    {
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Delete Customer!',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/delete-customer")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                toastr.success('Customer Deleted Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });

    }
    function activate_provider($id)
    {
          event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-provider")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });

    }
    function activate_provider_document($id)
    {
          event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-provider-document")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });

    }
    function delete_provider($id)
    {
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Delete Provider !',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/delete-provider")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                toastr.success('Provider Deleted Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });      
    } 
    function activate_sector($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-sector")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }
     function activate_country($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-country")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }
    function activate_state($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-state")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }
     function activate_transaction($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-transaction")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }

     function deactivate_transaction($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/dissaprove-transaction")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }
      function activate_case($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/publish-case")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }

      function activate_city($id)
    {
      event.preventDefault();
      var id = $id;
      $.confirm({
      title: 'Confirm!',
      content: 'Confirm Change Status',
        buttons: {
          confirm: function () {
            $.ajax({
                        url:  '{{url("admin/change-status-city")}}/'+id,
                        type: "get",
                        dataType: 'json',
                        success: function (data) {
                            // console.log(data);
                            if(data==1)
                            {
                                // toastr.clear(); 
                                // toastr.success('Status Changed Successfully.');
                                setTimeout(location.reload.bind(location), 1000);
                            }else{
                                toastr.clear(); 
                                toastr.error('some error occure');
                            }
                        }
                    });
            
          },
          cancel: function () {
            $.alert('Cancelled!');
          },
        }
      });
    }
    function fetch_data_sectors(from = '',to = '')
        {

            $("#sectors").DataTable({
                 dom: 'lBfrtip',
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],        
            columnDefs: [
            { className: "actions-btn-c", targets:11 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-sectors') }}", 
                type: 'GET',
                data: {from:from,to:to}, 
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'serial_no', name: 'serial_no' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
             { data: 'type', name: 'type' , "render": function (data, type, full, meta) {
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
           { data: 'total_cases', name: 'total_cases' },
            { data: 'user_views', name: 'user_views' },
             { data: 'total_goals', name: 'total_goals' },
              { data: 'total_contributions', name: 'total_contributions' },

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
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                           return '<label class="switch"><input type="checkbox" checked onclick="activate_sector('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>'; 
                       }
                       else
                       {
                           return '<label class="switch"><input type="checkbox"  onclick="activate_sector('+full.id+')" id="custoner_checkbox"><span class="slider round"></span></label>';
                       }

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/sector/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

        });       
    }    
     function fetch_data_countries(from = '',to = '')
    {
         
    $("#countries").DataTable({
         dom: 'lBfrtip',
           buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],       
            columnDefs: [
            { className: "actions-btn-c", targets:5 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-country') }}", 
                type: 'GET',
                data: {from:from,to:to}, 
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_ar', name: 'title_ar' , "render": function (data, type, full, meta) {
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
             
           { data: 'created_at', name: 'created_at' , "render": function (data, type, full, meta) {
                    if(data == null)
                    {
                        return "N/A";
                    } 
                    else
                    {                   
                           var today = getDate(data);
                        return   '<td data-sort="'+data+'">'+today+'</td>';  
                            
                    }   
                  
                }
            },
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                        if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_country('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_country('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       } 
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/country/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });             
    }
      function fetch_data_cities(from = '',to = '',country = '',state ='')
    {

        $("#cities").DataTable({
             dom: 'lBfrtip',
             buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],        
            columnDefs: [
            { className: "actions-btn-c", targets:7 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-cities') }}", 
                type: 'GET',
                    data: {from:from,to:to,country:country,state:state},        
                
            },

            columns: [
                
            { data: 'id', name: 'id' },
           
            { data: 'country.title', name: 'country.title' , "render": function (data, type, full, meta) {
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
             { data: 'state.title', name: 'state.title' , "render": function (data, type, full, meta) {
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
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
           
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                       if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_city('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_city('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/city/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

        }); 
}
    function fetch_data_states(from = '',to = '',country = '')
    {
         $("#states").DataTable({
            dom: 'lBfrtip',
            buttons: [
                {
                    extend: 'copy',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'csv',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'excel',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
                {
                    extend: 'print',    
                    className: 'btn btn-default',
                    exportOptions: {
                        columns: ':not(.notexport)'
                    }
                },
            ],    
            columnDefs: [
            { className: "actions-btn-c", targets:5 },
             { orderable: false, targets: -1 }
         
            ],    
            language: {
                    paginate: {
                        next: '<i class="fa fa-caret-right" aria-hidden="true"></i>',
                        previous: '<i class="fa fa-caret-left" aria-hidden="true"></i>'
                    }
                },
                "bPaginate": true,
                "responsive": true,
      "autoWidth": false,
       processing: true,
            serverSide: true,

            "order": [[ 0, "desc" ]],
            ajax: {
                url: "{{ url('admin/get-states') }}", 
                type: 'GET',
                data: {from:from,to:to,country:country}, 
            },

            columns: [
                
            { data: 'id', name: 'id' },
            { data: 'title', name: 'title' , "render": function (data, type, full, meta) {
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
            { data: 'title_arabic', name: 'title_arabic' , "render": function (data, type, full, meta) {
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
            { data: 'country.title', name: 'country.title' , "render": function (data, type, full, meta) {
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
            { data: 'status', name: 'status' , "render": function (data, type, full, meta) {
                        if( data == 1)
                       {
                          return '<span class="label label-primary"onclick="activate_state('+full.id+')" id="custoner_checkbox"> Active </span>'; 
                          
                       }
                       else
                       {
                             return '<span class="label label-danger"onclick="activate_state('+full.id+')" id="custoner_checkbox"> In Active</span>';
                           
                       }

                       
                    },
                }, 
             
             { data: 'id', name: 'id' , "render": function (data, type, full, meta) {
                       
                       return '</a><a href="{{url('admin/state/')}}/'+data+'/edit" class="edit-btn-f"><i class="fa fa-pencil"></i></a>';
                    },
                }, 
                ]

    });       


    } 
      function loadImg(){
         $('#frame').attr('src', URL.createObjectURL(event.target.files[0]));
    }
    function loadImg1(){
        $('#frame1').attr('src', URL.createObjectURL(event.target.files[0]));
    
    }
    function loadImg2(){
    $('#frame2').attr('src', URL.createObjectURL(event.target.files[0]));
    
    }
     function loadImg3(){
        $('#frame3').attr('src', URL.createObjectURL(event.target.files[0]));
    
    }
     function loadImg4(){
        $('#frame4').attr('src', URL.createObjectURL(event.target.files[0]));
    
    }

     function loadImg5(){
        $('#frame5').attr('src', URL.createObjectURL(event.target.files[0]));
    
    }
    
 // document.addEventListener("DOMContentLoaded", function(event) { 
 //            var scrollpos = localStorage.getItem('scrollpos');
 //            console.log(scrollpos);
 //            if (scrollpos) window.scrollTo(0, scrollpos);
 //        });

 //        window.onbeforeunload = function(e) {
 //            localStorage.setItem('scrollpos', window.scrollY);
 //        };


    </script>

   </body>
</html>