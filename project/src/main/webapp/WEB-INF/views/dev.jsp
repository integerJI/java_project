<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> <!-- @@@ 매우 중요 @@@ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">


<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
            </tr>
        </thead>
    </table>



	
<script type="text/javascript">

$(document).ready(function() {
    $('#example').DataTable( {
        "ajax": '/getProjectList.do'
    } );
} );


// $(document).ready(function() {
//     $('#example').DataTable( {
// 		url:'/getProjectList.do', 
// 		columns: [
// 			{"data": "proId"},
// 			{"data": "proTitle"},
// 			{"data": "proBody"}, 
// 			{"data": "proDate"}
// 		]
//     });
// });

// var table = $('#myTable').DataTable({
//     ajax: {
//        'url':'projectList.do', 
//        'dataSrc':''
//     },
//    columns: [
//        {"data": "proId"},
//        {"data": "proTitle"},
//        {"data": "proBody"}, 
//        {"data": "proDate"}
//    ]
// });


// (function(window, $) {
//     'use strict'; 
    
//     var obj = {}
//     var $grid;
    
//     $.init(function() {
//     	$grid = $('[name="story-mgt-grid"]').DataTable({
// 	        columns : [
// 	        	{data : 'proId', className : 'text-center'},  
// 	        	{data : 'proTitle', className : 'text-center'},   
// 	            {data : 'proBody', className : 'text-center'},
// 	            {data : 'proDate', className : 'text-center'}
// 	        ], 
	        
// 	        ajax : {
// 	        	dataSrc : 'data.data',
// 	        	url : '/projectList.do',
// 	            data : function(data) {	   
//             		return data;
//             	}  
// 	        },

// 	    });	

	
    	   
//     }); // init END
    
// })(window, $);

</script>
    