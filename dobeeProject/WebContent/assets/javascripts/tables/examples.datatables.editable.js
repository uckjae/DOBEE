//신용카드 번호 검증 정규식



//var cardReg = new RegExp("(5[1-5]\d{14})|(4\d{12})(\d{3}?)|3[47]\d{13}|(6011\d{12})");
var cardReg = new RegExp("^[1-9]{1}[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}$");

//날짜 정규식 (MM/yy) 만 가능  
var date_pattern = /^(0[1-9]|1[012])\/([2-9][0-9])$/;
//var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 



(function( $ ) {

	'use strict';

	var EditableTable = {

		options: {
			addButton: '#addToTable',
			table: '#datatable-editable',
			dialog: {
				wrapper: '#dialog',
				cancelButton: '#dialogCancel',
				confirmButton: '#dialogConfirm',
				
				cardNumButton: '#cardConfirm',
				dateButton: '#dateConfirm',
				entryButton: '#entryConfirm',
			}
		},

		initialize: function() {
			this
				.setVars()
				.build()
				.events();
		},

		setVars: function() {
			this.$table				= $( this.options.table );
			this.$addButton			= $( this.options.addButton );

			// dialog
			this.dialog				= {};
			this.dialog.$wrapper	= $( this.options.dialog.wrapper );
			this.dialog.$cancel		= $( this.options.dialog.cancelButton );
			this.dialog.$confirm	= $( this.options.dialog.confirmButton );
			//  유효성 검사 모달창 확인 작동 버튼
			this.dialog.$cardNum	= $( this.options.dialog.cardNumButton );
			this.dialog.$date	= $( this.options.dialog.dateButton );
			this.dialog.$entry	= $( this.options.dialog.entryButton );
			return this;
		},

		build: function() {
			this.datatable = this.$table.DataTable({
				aoColumns: [
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					
					{ "bSortable": false }
				]
			});

			window.dt = this.datatable;

			return this;
		},

		events: function() {
			var _self = this;

			this.$table
				.on('click', 'a.save-row', function( e ) {
					e.preventDefault();
					var ori = e.target;
					var t = e.target;
					var tr = t.closest('td')
					
					var cardNum = $(tr).parents('tr').children('td:eq(1)').find('input').val();
					var corp = $(tr).parents('tr').children('td:eq(2)').find('input').val();
					var name = $(tr).parents('tr').children('td:eq(3)').find('input').val();
					var nickName = $(tr).parents('tr').children('td:eq(4)').find('input').val();
					var entry = $(tr).parents('tr').children('td:eq(5)').find('input').val();
					var valDate = $(tr).parents('tr').children('td:eq(6)').find('input').val();
					
					// 빈칸 유효성 검사
					let allemptyCheck = true;
					let datas = [cardNum, corp, name, nickName, entry, valDate];
					let size = datas.length;
					
					for(let i = 0; i < size ; i++){
						let name = "";
						if(datas[i] == ''){
							if(i == 0){
								name = "카드번호";
							}
							if(i == 1){
								name = "카드사";
							}
							if(i == 2){
								name = "명의자";
							}
							if(i == 3){
								name = "별칭";
							}
							if(i == 4){
								name = "카드구분";
							}
							if(i == 5){
								name = "날짜";
							}
							allemptyCheck = false;
							swal({
								   title: "오류",
								   text: name + "칸을 입력해주세요.",
								   icon: "warning" //"info,success,warning,error" 중 택1
								}).then((YES) => {
							});
						}
					};
					
					if(!allemptyCheck){
						return;  // 유효성 불통이면 도중에 함수 종료
					}
					
					
					
					var totalCheck = false;  //유효성 검사 이게 참이되면 완전 통과임
					var cardNumCheck = cardReg.test(cardNum);  //true or false
					var entryCheck = false;
					var valDateCheck = false;  
					//법인 카드 종류 이 3중에 하나만 써야 통과 
				    var check1 = entry.indexOf("법인(개인)");
					var check2 = entry.indexOf("법인(공용)");
					var check3 = entry.indexOf("법인(체크)");
					
					if(check1 + check2 + check3 == -2) {entryCheck = true};  //카드종류 유효성 검사
					if(date_pattern.test(valDate)){valDateCheck = true}; //날짜 유효성검사
					
					//카드 번호, 카드종류, 날짜 유효성 검사 후 모두 true 로 나와야 통과 
					if(cardNumCheck && valDateCheck && entryCheck){
						totalCheck = true;
					}else{
						
						if(!valDateCheck){
							swal({
								title: "카드등록",
								text: "날짜를 재입력해주세요", 
								icon: "warning", //"info,success,warning,error" 중 택1
								showConfirmButton: true
								//icon: "warning" //"info,success,warning,error" 중 택1
									})
						}
						
						//카드번호 틀리면 나오는 모달창
						if(!cardNumCheck || !valDateCheck || !entryCheck){
							swal({
								title: "카드등록",
								text: "날짜를 재입력해주세요", 
								icon: "warning", //"info,success,warning,error" 중 택1
								showConfirmButton: true
							})
							$.magnificPopup.open({
								items: {
									src: '#dialogEditCardNum',
									type: 'inline'
								},
								preloader: false,
								modal: true,
								callbacks: {
									change: function() {
										_self.dialog.$cardNum.on( 'click', function( e ) {
											e.preventDefault();

											$.magnificPopup.close();
										});
									},
									close: function() {
										_self.dialog.$confirm.off( 'click' );
									}
								}
							});
							
						}
					
						
						//카드 종류 틀리면 나오는 모달창
					if(!entryCheck){
						swal({
							title: "카드등록",
							text: "카드 종류를 재입력해주세요", 
							icon: "warning", //"info,success,warning,error" 중 택1
							showConfirmButton: true
						})
					}
				} //else 문 끝
					
					
					var sendData = {
							"cardNum" : cardNum,
							"corp" : corp,
							"name" : name,
							"nickName" : nickName,
							"entry" : entry,
							"valDate" : valDate
					};
					
				
					
					
					//프로미스 (중복 검사하는 아작스)
					function getCheckDupleCardNum(callback) {
						  return new Promise(function (resolve, reject) {
							  let checkUpdate = 0;  // 0이면 존재하지 않고  1이면 존재
								let checkCardNumber = {"cardNum": cardNum};
						$.ajax({
							url:'ajax/adminDebit/checkEditDupleCardNum.do',
							data:checkCardNumber,
							type:"POST",
							success:function(data){
								if(data > 1 ){
									checkUpdate = 1;
								}
							},
							error:function(request,status,error){
								console.log("code : " + request.status +"\n" + "message : " 
										+ request.responseText + "\n" + "error : " + error);
								
									},
							complete:function(){
								resolve(checkUpdate);
							},
						});
				  });
				};
					// 등록하는 아작스 함수
					function updateDebit(check){
						
						$.ajax({
				            url:'ajax/adminDebit/editAdminDebitList.do',
				            data:sendData,
				            type:'POST',
				            beforeSend : function(xhr, opts) {
					                if (!check) {  // check가 false 면 중복
					                	//종복 카드번호는 안된다는 알림창
					                	swal({
					                		   title: "수정 실패",
					                		   text: "중복된 카드 번호로 수정할 수 없습니다.",
					                		   icon: "error" //"info,success,warning,error" 중 택1
					                		}).then((YES) => {
					                	});
					                	//아작스 중지
					                	console.log("중복 발견 아작스 중지");
					                    xhr.abort();
					                }
				            },
				            success:function(data){

				            	_self.rowSave( $(ori).closest( 'tr' ) );
				            },
				            error:function(request,status,error){
								console.log("code : " + request.status +"\n" + "message : " 
										+ request.responseText + "\n" + "error : " + error);
							},
				            complete:function(){
				            	
				            },
				        });	//아작스 끝 
						
					}; //함수 끝
					
					
					
					
					//유효성 검사 totalCheck가 참이면 그때 수정 아작스 실행
					if(totalCheck){
						//이게 투루면 유효성 통과 
						//이제 중복 검사 
						//여기서 프로미스로 먼저 중복검사 아작스 실행 한 후 
						//등록 아작스 실행해야 하므로
						getCheckDupleCardNum().then(function (tempCheck) {
							console.log("여기는 프로미스");
		            		console.log(tempCheck);
		            		let check;
		            		if(tempCheck == 1){  // 1이면 중복
		            			check = false;
		            		}else{
		            			check = true;
		            		}
		            		// 업데이트 수정 아작스 실행
		            		updateDebit(check);
						});
					}else{
						swal({
	                		   title: "수정 실패",
	                		   text: "입력한 값을 확인해주세요",
	                		   icon: "error" //"info,success,warning,error" 중 택1
	                		})
					}
					
				})  // 관리자 법인카드 수정 완료
				
			
				.on('click', 'a.cancel-row', function( e ) {
					e.preventDefault();

					_self.rowCancel( $(this).closest( 'tr' ) );
				})
				.on('click', 'a.edit-row', function( e ) {
					e.preventDefault();

					_self.rowEdit( $(this).closest( 'tr' ) );
					
				})   //관리자 법인카드 삭제 시작
				.on( 'click', 'a.remove-row', function( e ) {
					e.preventDefault();
					var $row = $(this).closest( 'tr' );
					
					var t = e.target;
					var tr = t.closest('tr')
					var cardNum = $(tr).children('td:eq(1)').text();
					
					$.magnificPopup.open({
						items: {
							src: '#dialog',
							type: 'inline'
						},
						preloader: false,
						modal: true,
						callbacks: {
							change: function() {
								_self.dialog.$confirm.on( 'click', function( e ) {
									e.preventDefault();
									
									//뷰단 테이블에서 삭제
									_self.rowRemove( $row );
									
									//모달창 닫기
									$.magnificPopup.close();
									
									//json 형태로 가공 
									var tempCardNum = {
											"cardNum" : cardNum 
									};
									
									
								//삭제 아작스 시작
									$.ajax({ 
										url : 'ajax/adminDebit/adminDelDebit.do', 
										type : 'POST', 
										data : tempCardNum,
										success : function (data) {
												if(data>0){
													swal({
								                		   title: "카드 삭제",
								                		   text: "카드를 삭제하였습니다",
								                		   icon: "success" //"info,success,warning,error" 중 택1
								                		});
												}else{
													swal({
								                		   title: "카드 삭제",
								                		   text: "카드를 삭제에 실패하였습니다",
								                		   icon: "error" //"info,success,warning,error" 중 택1
								                		});
												}
											}, 
										error : function () {
												swal({
							                		   title: "카드 삭제",
							                		   text: "해당 카드는 삭제 할 수 없습니다",
							                		   icon: "warning" //"info,success,warning,error" 중 택1
							                		});
											} 
										});
								// 아작스 끝
								});
							},
							close: function() {
								_self.dialog.$confirm.off( 'click' );
							}
						}
					});
				});

			this.$addButton.on( 'click', function(e) {
				e.preventDefault();

				_self.rowAdd();
			});

			this.dialog.$cancel.on( 'click', function( e ) {
				e.preventDefault();
				$.magnificPopup.close();
			});
			
			
			return this;
		},

		// ==========================================================================================
		// ROW FUNCTIONS
		// ==========================================================================================
		rowAdd: function() {
			this.$addButton.attr({ 'disabled': 'disabled' });

			var actions,
				data,
				$row;

			actions = [
				'<a href="#" class="hidden on-editing save-row"><i class="fa fa-save"></i></a>',
				'<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
				'<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
				'<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>'
			].join(' ');

			data = this.datatable.row.add([ '', '', '', actions ]);
			$row = this.datatable.row( data[0] ).nodes().to$();

			$row
				.addClass( 'adding' )
				.find( 'td:last' )
				.addClass( 'actions' );

			this.rowEdit( $row );

			this.datatable.order([0,'asc']).draw(); // always show fields
		},

		rowCancel: function( $row ) {
			var _self = this,
				$actions,
				i,
				data;

			if ( $row.hasClass('adding') ) {
				this.rowRemove( $row );
			} else {

				data = this.datatable.row( $row.get(0) ).data();
				this.datatable.row( $row.get(0) ).data( data );

				$actions = $row.find('td.actions');
				if ( $actions.get(0) ) {
					this.rowSetActionsDefault( $row );
				}

				this.datatable.draw();
			}
		},

		rowEdit: function( $row ) {
			var _self = this,
				data;
			data = this.datatable.row( $row.get(0) ).data();

			$row.children( 'td' ).each(function( i ) {
				var $this = $( this );

				if ( $this.hasClass('actions') ) {
					_self.rowSetActionsEditing( $row );
				} else {
					if(i == 1){
						$this.html( '<input type="text" readonly class="form-control input-block" value="' + data[i] + '" />' );
					}else{
						$this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
					}
					
				}
			});
		},

		rowSave: function( $row ) {
			var _self     = this,
				$actions,
				values    = [];

			if ( $row.hasClass( 'adding' ) ) {
				this.$addButton.removeAttr( 'disabled' );
				$row.removeClass( 'adding' );
			}

			values = $row.find('td').map(function() {
				var $this = $(this);

				if ( $this.hasClass('actions') ) {
					_self.rowSetActionsDefault( $row );
					return _self.datatable.cell( this ).data();
				} else {
					return $.trim( $this.find('input').val() );
				}
			});

			this.datatable.row( $row.get(0) ).data( values );

			$actions = $row.find('td.actions');
			if ( $actions.get(0) ) {
				this.rowSetActionsDefault( $row );
			}
			this.datatable.draw();
		},

		rowRemove: function( $row ) {
			if ( $row.hasClass('adding') ) {
				this.$addButton.removeAttr( 'disabled' );
			}

			this.datatable.row( $row.get(0) ).remove().draw();
		},

		rowSetActionsEditing: function( $row ) {
			$row.find( '.on-editing' ).removeClass( 'hidden' );
			$row.find( '.on-default' ).addClass( 'hidden' );
		},

		rowSetActionsDefault: function( $row ) {
			$row.find( '.on-editing' ).addClass( 'hidden' );
			$row.find( '.on-default' ).removeClass( 'hidden' );
		}

	};

	$(function() {
		EditableTable.initialize();
	});

}).apply( this, [ jQuery ]);