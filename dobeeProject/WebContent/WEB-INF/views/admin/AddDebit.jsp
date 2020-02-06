<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="fixed">
<head>

<c:import url="/common/HeadTag.jsp"/>
<!-- Sweet Alert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
	//카드 번호 정규식 
	var cardReg = new RegExp("^[1-9]{1}[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}$");
	var vail = false; // 유효성 불통인데 등록 버튼을 눌렀을 때 유효성검사를 하기위한 변수
	var entryCheck = false;
	var cardNumCheck = false;
	var emptyCheck = false; 

	// 명의자이름 / 카드사 / 카드별칭  빈칸인지아닌지 검사
	function threeEmptyCheck(){
			let tempCorp = $('#corp').val();
			let tempName = $('#name1').val();
			let tempNickname = $('#nickName').val();
			if(tempCorp == '' || tempName == '' || tempNickname == ''){
				emptyCheck = false;
			}else{
				emptyCheck = true;
			}
		};
	
	//날짜 유효성 검사 함수
    function inputValidThru(period) {
		
        // replace 함수를 사용하여 슬래시( / )을 공백으로 치환한다.
        var replaceCard = period.value.replace(/\//g, "");

        // 텍스트박스의 입력값이 4~5글자 사이가 되는 경우에만 실행한다.
        if(replaceCard.length >= 4 && replaceCard.length < 5) {

            var inputMonth = replaceCard.substring(0, 2);      // 선언한 변수 month에 월의 정보값을 담는다.
            var inputYear = replaceCard.substring(2, 4);       // 선언한 변수 year에 년의 정보값을 담는다.


            // 현재 날짜 값을 구한다.

            var nowDate = new Date();

            var nowMonth = autoLeftPad(nowDate.getMonth() + 1, 2);

            var nowYear = autoLeftPad(nowDate.getFullYear().toString().substr(2, 2), 2);


            // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
            if(isFinite(inputMonth + inputYear) == false) {

            	swal({
            		   title:"오류",
            		   text: "문자는 입력하실 수 없습니다.",
            		   icon: "warning" //"info,success,warning,error" 중 택1
            		}).then((YES) => {
            	});
                
                period.value = autoLeftPad((Number(nowMonth) + 1), 2) + "/" + nowYear;
                vail = false;
                return false;
            }

            // 입력한 월이 12월 보다 큰 경우
            if(inputMonth > 12) {
            	swal({
         		   title:"오류",
         		   text: "12월보다 큰 월수는 입력하실 수 없습니다.",
         		   icon: "warning" //"info,success,warning,error" 중 택1
         		}).then((YES) => {
         	});
                period.value = "12/" + inputYear;
                vail = false;
                return false;
            }

            // 입력한 월이 00을 입력 할 수 없다
            if(inputMonth == 0){
            	swal({
          		   title:"오류",
          		   text: "월에 00은 입력 할 수 없습니다.",
          		   icon: "warning" //"info,success,warning,error" 중 택1
          		}).then((YES) => {
          	});
				period.value = "01/" + inputYear;
				vail = false;
				return false;
               }

            // 입력한 유효기간을 현재날짜와 비교하여 사용 가능 여부를 판단한다.
            if((inputYear + inputMonth) <= (nowYear + nowMonth)) {
            	swal({
           		   title:"오류",
           		   text: "유효기간이 만료된 카드는 사용하실 수 없습니다.",
           		   icon: "warning" //"info,success,warning,error" 중 택1
           		}).then((YES) => {
           	});
                period.value = inputMonth + "/" + autoLeftPad((Number(nowYear) + 1), 2);
                vail = false;
                return false;
                
            }

            period.value = inputMonth + "/" + inputYear;
            vail = true;
        };
    };



    // 1자리 문자열의 경우 앞자리에 숫자 0을 자동으로 채워 00형태로 출력하기위한 함수
    function autoLeftPad(num, digit) {
        if(String(num).length < digit) {
            num = new Array(digit - String(num).length + 1).join('0') + num;
        }
        return num;
    };

	// 카드 번호 유효성 검사 
    function inputVailCardNum(cardNum){
    		//최소 19 글자는 적어야 함수가 작동함
    		cardNumCheck = false;
    		if(cardNum.length == 19) {
    			cardNumCheck = cardReg.test(cardNum);  //true or false
				if(cardNumCheck){
					cardNumCheck = true;
					
				}else{
					swal({
		           		   title:"오류",
		           		   text: "카드 번호를 1234-1234-1234-1234 형식으로 입력 해 주세요.",
		           		   icon: "warning" //"info,success,warning,error" 중 택1
		           		}).then((YES) => {
		           	});
					cardNumCheck = false;
				}
    		}
        };

    
     //아작스로 보낼 데이타 만들어주는 함수
   function inputData(){
		var cardNum  = $("#cardNum").val();
		var corp  = $("#corp").val();
		var name  = $("#name1").val();
		var nickName  = $("#nickName").val();
		var entry  = $("#entry").val();
		var valDate  = $("#valDate").val();
		let sendData = {
			"cardNum":cardNum,
			"corp":corp,
			"name":name,
			"nickName":nickName,
			"entry":entry,
			"valDate":valDate
		};
		return sendData;
	};


	// 카드 구분 유효성 검사 함수 
	function checkEntry(){
			let tempEntry = $('#entry').val();
			
			if(tempEntry == ''){
				entryCheck = false;
				}else{
					entryCheck = true;
					}

		};
	
	// 법인 카드등록 아작스함수
   function addDebit(sendData = inputData()){
	   var sendData = inputData();
	  
       let result = 0;  // 컨트롤단으로 부터 디비등록 되었는지 확인 받는 자료 
		$.ajax({
			url:"ajax/admin/AdminDebit.do",
			type:'POST',
            data: sendData,
            beforeSend : function(xhr, opts) {
            	checkEntry();  // 카드 구분은 여기서 함수를실행해서 확인하고, 카드번호/유효기간은 keyUp 을 통해 사용자가 입력하는 즉시 확인
            	threeEmptyCheck();  // 명의자이름 별치 은행 빈칸 검사하는 함수
            	//여기서 부터 빈칸 체크
                if (!entryCheck) { 
                	swal({
                		   title: "오류",
                		   text: "카드 구분을 선택해주세요.",
                		   icon: "warning" //"info,success,warning,error" 중 택1
                		}).then((YES) => {
                	});
                    xhr.abort();
                };
                if (!vail){
                	swal({
             		   title: "오류",
             		   text: "유효기간은 정확히 입력해주세요.",
             		   icon: "warning" //"info,success,warning,error" 중 택1
             		}).then((YES) => {
             	});
					xhr.abort();
                };
                if (!cardNumCheck){
                	swal({
              		   title: "오류",
              		   text: "카드번호를 정확히 입력해주세요.",
              		   icon: "warning" //"info,success,warning,error" 중 택1
              		}).then((YES) => {
              	});
                	xhr.abort();
                };
                if (!emptyCheck){
                	swal({
               		   title: "오류",
               		   text: "빈 칸이 없는지 확인해주세요.",
               		   icon: "warning" //"info,success,warning,error" 중 택1
               		}).then((YES) => {
               	});
               		xhr.abort();
               };
            },
			success:function(data){
					console.log(data);
					result = data;
					if(result == 0){
						swal({
							   title:"등록 실패",
							   text: "데이터 베이스 등록에 실패하였습니다.",
							   icon: "error" //"info,success,warning,error" 중 택1
							}).then((YES) => {
								$("#cardNum").focus();
						});
					}else{
						// 디비 등록 까지 다 성공했다면, 목록 보여주는 페이지로 이동
						location.href="ListDebit.do";
					};
				},

			complete:function(){
					
				},
			error:function(){
			
				},
			});
	   };
</script>



</head>
	<body>
		<section class="body">

			<!-- start: header -->
			<c:import url="/common/TopAdmin.jsp"/>
			<!-- end: header -->

			<div class="inner-wrapper">
				<!-- start: sidebar -->
				<c:import url="/common/SideAdmin.jsp"/>
				<!-- end: sidebar -->
				
			<!-- start : main Content -->
				<section role="main" class="content-body">
					<header class="page-header">
						<h2>법인카드 등록</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="index.html">
										<i class="fa fa-credit-card"></i>
									</a>
								</li>
								<li><span>법인카드</span></li>
								<li><span>법인카드 등록</span></li>
								<li style="padding-right:30px;"><a href="#" style="cursor:default;"> <i class="fa fa-chevron-left"></i></a></li>
							</ol>
						</div>
					</header>
					<div class="container-fluid">
		                <div class="card mb-3">
		                    <div class="card-header">
		                        <i class="fas fa-user-edit"></i>
		                    </div>
		                    <div class="card-body">
		                        <div class="table-responsive">
		                            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <form id="debitForm" method="post" >
		                                        	<div class="form-group">
		                                                		<div class="form-row">
		                                                			<div class="col-md-6">
		                                                			<!--form-row 첫번째 컬럼에서만 보안경고문이 뜸 나중에 js,css 확인 필요 -->
		                                                        		<div class="form-label-group">
		                                                        			<label for="name">카드번호</label>
		                                                            		<input type="text" id="cardNum" name="cardNum" class="form-control" onKeyup="inputVailCardNum($(this).val());" placeholder="1234-1234-1234-1234" autofocus="autofocus" autocomplete="off" maxlength="19"/>
		                                                            		<br>
		                                                            		<label for="name">카드사</label>
		                                                            		<input type="text" id="corp" name="corp" class="form-control" placeholder="국민은행" autocomplete="off"/>
		                                                            		<br>
		                                                        		</div>
		                                                    		</div>
		                                                    		
		                                                			<div class="col-md-6">
		                                                        		<div class="form-label-group">
		                                                            		<label for="name">명의자이름</label>
		                                                            		<input type="text" id="name1" name="name" class="form-control" autocomplete="off"/>
		                                                            		<br>
		                                                            		<label for="name">카드별칭</label>
		                                                            		<input type="text" id="nickName" name="nickName" class="form-control" autocomplete="off"/>
		                                                            		<br>
		                                                        		</div>
		                                                    		</div>
		                                                    		
		                                                		</div>
		                                            		</div>
		                                            <div class="form-group">
		                                                <div class="form-row">
		                                                    <div class="col-md-6">
		                                                        <div class="form-label-group">
		                                                        	<label for="position">유효기간</label>
		                                                        	<input type="text" id="valDate" name="valDate" class="form-control" onKeyup="inputValidThru(this);" placeholder="MM/YY" maxlength="5"/>
		                                                           <!--  <input type="date" id="valDate" name="valDate" class="form-control" placeholder="유효기간 (ex)MM-yy)"  > -->
		                                                        </div>
		                                                    </div>
		                                                    <div class="col-md-6">
		                                                        <div class="form-label-group">
		                                                            <label for="teamCode">카드구분</label>
		                                                           	<select id="entry" name="entry" class="form-control" placeholder="법인카드구분" >
		                                                           		<option hidden value=''>선택하세요</option>
		                                                           		<option>법인(공용)</option>
																	    <option>법인(개인)</option>
																	    <option>법인(체크)</option>
		                                                           	</select>
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <br>
		                                            <div class="form-row">
		                                           		 <div class="col-md-6">
		                                                    <a href="javascript:addDebit()" class="btn btn-primary btn-block" >등록하기</a>
		                                                </div>
		                                                <div class="col-md-6"><!-- 취소하고 뒤로 가기 -->
		                                                    <input type="button" class="btn btn-danger btn-block" value="뒤로가기"
		                                                        		onClick='history.go(-1)'>
		                                                </div>
		                                            </div>
		                                        </form>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
            </div>	
					<!-- start: page -->
					<!-- end: page -->
				</section>
			</div>

		</section>

		<c:import url="/common/BottomTag.jsp"/>
	</body>
</html>