<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%> <!-- @@@ 매우 중요 @@@ -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<div class="content">
	<div class="titleArea">
	    <h1>홈플러스 스토리 관리 &gt; 스토리 관리</h1>
	</div>
	<div class="form-inline">
		<table class="table table-bordered" style="width:100%;">
			<colgroup>
				<col width="10%" />
				<col width="40%" />
				<col width="10%" />
				<col width="40%" />
<!-- 				<col width="10%" /> -->
<!-- 				<col width="10%" /> -->
			</colgroup>
			<tbody>
				<tr>
					<th>점포선택</th>
					<td>
						<div class="form-inline">
							<div class="form-group">
								<input type="text" id=searchStorCd name="searchStorCd" class="form-control input-sm" style="width:150px;" data-parsley-required placeholder="점포코드" oninput="this.value = numberOnly(this.value);$('#rcpt_in_storNm').val('');"  maxlength="10" />
								<div class="input-group" style="width:200px;margin-top:1px;">
									<input type="text" id="rcpt_in_storNm" name="rcpt_in_storNm" class="form-control input-sm" disabled placeholder="점포명" />
									<span class="input-group-addon"><span class="glyphicon glyphicon-search" onclick="FnStoreSearch('searchStorCd', 'rcpt_in_storNm');"></span>
								</div>				
							</div>
						</div>	
					</td>		
					<th>등록일자</th>
					<td>
						<div class="input-group date" style="width:140px; float:left; margin-right:10px;">
							<input type="text" class="form-control" placeholder="YYYY-MM-DD" name="searchViewStrtDt" id="searchViewStrtDt" data-input-date>
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
						<div style="float:left; margin-right:10px;">~</div>
						<div class="input-group date" style="width:140px; float:left;">
							<input type="text" class="form-control" placeholder="YYYY-MM-DD" name="searchViewEndDt" id="searchViewEndDt" data-input-date>
							<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</td>			
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" class="form-control" id="searchInputUser" name="searchInputUser" style="width:140px;">
					</td>						 
<!-- 					<th>내용</th> -->
<!-- 					<td> -->
<!-- 						<input type="text" class="form-control" id="searchKwCont" name="searchKwCont" style="width:90%;" > -->
<!-- 					</td> -->
					<th>관리자 여부</th>
					<td>
						<select class="form-control" id="searchCustIdYn" name="searchCustIdYn" style="width:140px;">
							<option value="all">전체</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>신고여부</th>
					<td>
						<select class="form-control" id="searchReportCd" name="searchReportCd" style="width:140px;">
							<option value="all">전체</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
					<th>삭제여부</th>
					<td>
						<select class="form-control" id="searchDeleteFlag" name="searchDeleteFlag" style="width:140px;">
							<option value="all">전체</option>
							<option value="Y">Y</option>
							<option value="N">N</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>타입검색</th>
					<td>
						<select class="form-control" id="searchtypeName" name="searchtypeName" style="width:140px;">
							<option value="all">전체</option>
							<option value="img">사진</option>
							<option value="avi">영상</option>
							<option value="multi">다중</option>
						</select>						
					</td>
				</tr>				
			</tbody>
		</table>
	</div>
 
 	<div class="btnArea">
		<button type="button" class="redBtn" id="btnSearch">검색</button>	
		<button type="button" id="btnExcelDown">엑셀 다운로드</button>
	</div>	
	
	<table name="story-mgt-grid" class="table table-bordered" style="width:100%">
	    <colgroup>
	       <col width="5%" />
	       <col width="10%" />
	       <col width="35%" />
	       <col width="15%" />
	       <col width="5%" />
	       <col width="10%" />
	       <col width="5%" />
	       <col width="5%" />
	       <col width="5%" />
	       <col width="5%" />
	    </colgroup>
	    <thead>
	        <tr>	        		
				<th>번호</th>
				<th>점포</th>
				<th>사용자 문구 / 키워드</th>
				<th>등록자</th>	
				<th>관리자</th>	
				<th>등록일자</th>	
				<th>삭제</th>	
				<th>좋아요</th>	
				<th>신고</th>	
				<th>타입</th>	
	        </tr>
	    </thead>
	</table>
</div>

<script type="text/javascript">

(function(window, $) {
    'use strict'; 
    
    var obj = {}
    var $grid;
    
    $.init(function() {
    	$grid = $('[name="story-mgt-grid"]').DataTable({
	   		searching : false,
            paging : true,
            pageLength : 10,
            ordering : false,
            serverSide : true,
            destroy : true,
            selection : 'single',
                     
	        columns : [
	        	{data : 'storyNum', className : 'text-center'},  
	        	{data : 'storNm', className : 'text-center'},   
	            {data : 'subCwCont', className : 'text-center', render: function(data, type, row, meta) { return  '<span>'+row.keyWord+' '+row.subCwCont+'</span>';}},
	            {data : 'inUserId', className : 'text-center', render: function(data, type, row, meta) { return  '<span>'+row.userNicnm+' ('+row.inUserId+')</span>';}},
	            {data : 'mcustIdYn', className : 'text-center'},
	            {data : 'writeDate', className : 'text-center'},
	            {data : 'deleteFlag', className : 'text-center'},
	            {data : 'likeCnt', className : 'text-center'},
	            {data : 'reportCnt', className : 'text-center'},
	            {data : 'typeName', className : 'text-center'}
	        ], 
	        ajax : {
	        	dataSrc : 'data.data',
	        	url : '/story/mgt/mgt_list',
	            data : function(data) {	   
					
					data['searchReportCd'] = $('#searchReportCd').val();
					data['searchCustIdYn'] = $('#searchCustIdYn').val();
					data['searchDeleteFlag'] = $('#searchDeleteFlag').val();
					data['searchStorId'] = $('#searchStorCd').val();
					data['searchInputUser'] = $('#searchInputUser').val();
					data['searchViewStrtDt'] = $('#searchViewStrtDt').val();
					data['searchViewEndDt'] = $('#searchViewEndDt').val();
					data['searchtypeName'] = $('#searchtypeName').val();
            		return data;
            	}  
	        },
			onChangeSelection : function(data) {
				obj = {};
	        	obj.storyId = data.storyId;
	        	
				if($(this).index() == 8){ //  신고 정보 확인 
					if(data.reportCnt > 0 ){
						FnReportPopup();
					} 					 
				} else {
		        	FnStoryPopup();
				}
			}
	    });	

    	// 신고 상세화면            
		var FnReportPopup = window['FnReportPopup'] = function(data) {
			
			obj.mgtGrid = $grid;
			
			mhm.popup.open({
				
				url: '/story/mgt/report_view',
				title: '신고 상세',
				param : obj,
				width: 400,
				height: 300,
				closeOnBgClick : false,
				enableEscapeKey : false,
				close : function() {}
			});	    		
		} // FnKeyWordWritePopup END	
		
    	// 스토리 상세화면            
		var FnStoryPopup = window['FnStoryPopup'] = function(data) {
			
			obj.inputMode = data;
			obj.mgtGrid = $grid;
			
			mhm.popup.open({
				url: '/story/mgt/story_view',
				title: '스토리 상세',
				param : obj,
				width: 600,
				height: 500,
				closeOnBgClick : false,
				enableEscapeKey : false,
				close : function() {}
			});	    		
		} // FnKeyWordWritePopup END	
    	
		
		var buttoncheck = 0;
				
    	// 검색
        $("#btnSearch").on('click', function() {
        	
        	if ($('#searchViewEndDt').val() != '') {
        		if ($('#searchViewStrtDt').val() > $('#searchViewEndDt').val() ) {
    				$.alert('시작시간이 종료시간보다 늦게 설정되었습니다.');
    				return;
        		}
        	}
        	
        	$grid.ajax.reload();
        	var button = buttoncheck = 1;
        });
		
     	// 엑셀 다운로드
        $("#btnExcelDown").on('click', function() {
        	
        	if (buttoncheck == 0) {
        		$.alert("검색버튼을 눌러주세요.")
				return
        	}
        	else if (buttoncheck == 1) {
            	var url = 'dataout/mgt_list_excel'
                	+'?searchReportCd='+ isEmpty($('#searchReportCd').val())
                	+'&searchCustIdYn='+ isEmpty($('#searchCustIdYn').val())
                	+'&searchDeleteFlag='+ isEmpty($('#searchDeleteFlag').val())
                	+'&searchStorId='+ isEmpty($('#searchStorCd').val())
                	+'&searchInputUser='+ isEmpty($('#searchInputUser').val())
                	+'&searchViewStrtDt='+ isEmpty($('#searchViewStrtDt').val())
                	+'&searchViewEndDt='+ isEmpty($('#searchViewEndDt').val())
                	+'&searchKwCont='+ isEmpty($('#searchKwCont').val())                	
                	+'&searchtypeName='+ isEmpty($('#searchtypeName').val());
                	
                	fnExcelDownload(url);
        			return false;        		
        	}
        });		
		
		var FnStoreSearch = window['FnStoreSearch'] = function(param, param1) {
			var dom = $("#"+param);
			var dom1 = $("#"+param1);
			mhm.popup.open({
			url: '/story/mgt/store_search_popup',
				title: '점포 조회',
				width: 600,
				height: 500,
				closeOnBgClick : false,
				enableEscapeKey : false,
				data : function(data) {
					dom.val(isEmpty(data.storId));
					dom1.val(isEmpty(data.storNm));
					mhm.popup.close();
				}
				
			});		
		}
    	   
    }); // init END
    
})(window, $);

</script>
    
<#if !AUTH_DOWNLOAD>
	<script type="text/javascript">
	(function(window, $) {
		'use strict';
		$('#btnExcelDown').addClass('hidei');
	})(window, jQuery);
	</script>	   		
</#if>