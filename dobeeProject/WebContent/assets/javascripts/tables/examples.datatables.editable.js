//신용카드 번호 검증 정규식



//var cardReg = new RegExp("(5[1-5]\d{14})|(4\d{12})(\d{3}?)|3[47]\d{13}|(6011\d{12})");
var cardReg = new RegExp("^[1-9]{1}[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}$");

//날짜 정규식 (MM/yy) 만 가능  
var date_pattern = /^(0[1-9]|1[012])\/([2-9][0-9])$/;
//var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 

// 빈칸 유효성 검사 함수 (카드사/명의자이름/카드별칭)
function emptyCheck(inputData){
	if( inputData.value == '' || inputData.value == null ){
	    alert( '값을 입력해주세요' );
	    return false;
	}

	var blank_pattern = /^\s+|\s+$/g;
	if( inputData.value.replace(blank_pattern, '' ) == "" ){
	    alert('공백만 입력되었습니다');
	    return false;
	}
};

//아작스 끝 

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
					let allemptyCheck = false;
					let datas = [cardNum, corp, nickName, entry, valDate];
					let checks = [];
					for(let i = 0 ; datas.length ; i++){
						checks.put(emptyCheck(datas[i])); // 여기에 true or false 값들이 담김
					};
					
					// checks의 값들이 모두 true여야 유효성 합격 하나라도 false 인게 있다면 해당 인덱스를 알아내서 어떤게 빈칸인지 출력 
					let size = checks.length;
					for(let i = 0 ; i < size; i++){
						if(!checks.splice(i)){  //유효성 불통시 
							let emptyName = datas.splice(i);
							if(emptyName == 'cardNum'){let showName = "카드번호"};
							if(emptyName == 'corp'){let showName = "카드사"};
							if(emptyName == 'nickName'){let showName = "별칭"};
							if(emptyName == 'entry'){let showName = "카드구분"};
							if(emptyName == 'valDate'){let showName = "유효기간"};
							alert(showName+"을(를) 입력해주세요.");
							break;
						}else{
							allemptyCheck = true;
							console.log("모든 입력칸채워졌음.");
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
						console.log("유효성 모두 통과");
						totalCheck = true;
					}else{
						
						if(!valDateCheck){
							console.log("날짜 재입력해주세요");
//							$.magnificPopup.open({
//								items: {
//									src: '#dialogEditDate',
//									type: 'inline'
//								},
//								preloader: false,
//								modal: true,
//								callbacks: {
//									change: function() {
//										_self.dialog.$date.on( 'click', function( e ) {
//											e.preventDefault();
//											$.magnificPopup.close();
//										});
//									},
//									close: function() {
//										_self.dialog.$confirm.off( 'click' );
//									}
//								}
//							});
						}
						
						//카드번호 틀리면 나오는 모달창
						if(!cardNumCheck){
							console.log("카드번호 재입력해주세요.");
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
							console.log("카드 종류를 재입력해주세요");
//							$.magnificPopup.open({
//								items: {
//									src: '#dialogEditEntry',
//									type: 'inline'
//								},
//								preloader: false,
//								modal: true,
//								callbacks: {
//									change: function() {
//										_self.dialog.$entry.on( 'click', function( e ) {
//											e.preventDefault();
//											$.magnificPopup.close();
//										});
//									},
//									close: function() {
//										_self.dialog.$confirm.off( 'click' );
//									}
//								}
//							});
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
					
					console.log(sendData);
					
					if(totalCheck){
						$.ajax({
				            url:'editAdminDebitList.do',
				            data:sendData,
				            type:'POST',
				            success:function(data){
				            	console.log(data);
				            },
				            error:function(){
				            	console.log("아작스 에러!");
				            },
				            complete:function(){
				            	_self.rowSave( $(ori).closest( 'tr' ) );
				            },
				        });	//아작스 끝 
					}else{
						console.log("유효성 검사가 통과되지 않아 아작스를 실행하지 않습니다.");
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
					console.log(cardNum);
					
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
									
									//카드번호확인
									console.log(cardNum);
									//json 형태로 가공 
									var tempCardNum = {
											"cardNum" : cardNum 
									};
									
									
								//삭제 아작스 시작
									$.ajax({ 
										url : 'adminDelDebit.do', 
										type : 'POST', 
										data : tempCardNum,
										success : function (data) {
												console.log("아작스 성공");
												if(data>0){
													console.log("삭제 성공!"); 
												}else{
													console.log("삭제 실패!"); 
												}
											}, 
										error : function () {
												console.log('삭제 아작스 실패!!!'); 
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
					$this.html( '<input type="text" class="form-control input-block" value="' + data[i] + '"/>' );
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