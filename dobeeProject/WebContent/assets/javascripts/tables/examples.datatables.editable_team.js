//신용카드 번호 검증 정규식
//var cardReg = new RegExp("(5[1-5]\d{14})|(4\d{12})(\d{3}?)|3[47]\d{13}|(6011\d{12})");
var cardReg = new RegExp("^[1-9]{1}[0-9]{3}-[0-9]{4}-[0-9]{4}-[0-9]{4}$");

// 날짜 정규식 (2020-02-02) 만 가능
var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

// 숫자만 가능한 정규식
var onlyNumber = new RegExp("^[0-9]+$");
// 팀코드 수정시 필요한 임시변수
var tempTeamCode = 0;






(function($) {

	'use strict';

	
	var EditableTable = {

		options : {
			addButton : '#addToTable',
			table : '#datatable-editable',
			dialog : {
				wrapper : '#dialog',
				cancelButton : '#dialogCancel',
				confirmButton : '#dialogConfirm',

				onlyNumber: '#onlyNumber',
				
			}
		},

		initialize : function() {
			this.setVars().build().events();
		},

		setVars : function() {
			this.$table = $(this.options.table);
			this.$addButton = $(this.options.addButton);

			
			
			
	
			
			
			
			
			
			
			
			
			
			// dialog
			this.dialog = {};
			this.dialog.$wrapper = $(this.options.dialog.wrapper);
			this.dialog.$cancel = $(this.options.dialog.cancelButton);
			this.dialog.$confirm = $(this.options.dialog.confirmButton);
			// 유효성 검사 모달창 확인 작동 버튼
			this.dialog.$onlyNumber = $(this.options.dialog.onlyNumber);
			
			return this;
		},

		build : function() {
			this.datatable = this.$table.DataTable({
				aoColumns : [ null, null, null, {
					"bSortable" : false,
					"aTargets" : [0]
				} ],
				aaSorting:[
					[1, 'asc']
				]
			
			});

			window.dt = this.datatable;

		
			
			
			
			
			
			
			return this;
		},

		events : function() {
			var _self = this;
			
			this.$table.on(
					'click',
					'a.save-row',
					function(e) {
						e.preventDefault();
						var ori = e.target;
						var t = e.target;
						var tr = t.closest('td')

						var teamCode = $(tr).parents('tr').children('td:eq(1)')
								.find('input').val();
						var teamName = $(tr).parents('tr').children('td:eq(2)')
								.find('input').val();

						var teamData = {
							"tempTeamCode" : tempTeamCode,
							"teamCode" : teamCode,
							"teamName" : teamName
						};

						// 유효성검증
						if (onlyNumber.test(teamCode)) { // 이게 참이여만 통과
							// 수정 아작스 실행
							$.ajax({
								url : 'ajax/admin/adminTeamCodeModify.do',
								data : teamData,
								type : 'POST',
								success : function(data) {
									console.log("성공");
								},
								error : function() {
									console.log("아작스 에러!");
								},
								complete : function() {
									_self.rowSave($(ori).closest('tr'));
								},
							}); // 아작스 끝
						} else { // 유효성 통과 못함
							// 모달창으로 팀코드에는 숫자만된다고 보여줌
							$.magnificPopup.open({
								items : {
									src : '#dialogOnlyNumber',
									type : 'inline'
								},
								preloader : false,
								modal : true,
								callbacks : {
									change : function() {
										_self.dialog.$onlyNumber.on('click',
												function(e) {
													e.preventDefault();
													// 모달창 닫기
													$.magnificPopup.close();
												});
									}
								}
							})
						}// else문 종료
					}) // 관리자 팀코드 수정 완료
					
					
			// 여기서 부터 팀코드 등록 시작
			.on('click', 'a.save-row-Add', function(e) {
				e.preventDefault();
				
				let ori = e.target;
				let t = e.target;
				let tr = t.closest('td')

				let teamCode = $(tr).parents('tr').children('td:eq(1)')
						.find('input').val();
				let teamName = $(tr).parents('tr').children('td:eq(2)')
						.find('input').val();

				let teamData = {
					"teamCode" : teamCode,
					"teamName" : teamName
				};
				//유효성 검증
				
				if (onlyNumber.test(teamCode)) { // 이게 참이여만 통과
					// 팀 코드 등록 아작스 실행
					$.ajax({
						url : 'ajax/admin/addTeamCode.do',
						data : teamData,
						type : 'POST',
						success : function(data) {
							console.log(data);
						},
						error : function() {
							swal({
								   title:"삭제 실패",
								   text: "중복된 팀코드를 입력 할 수 없습니다.",
								   icon: "error" //"info,success,warning,error" 중 택1
								}).then((YES) => {
							});
						},
						complete : function() {
							_self.rowSave($(ori).closest('tr'));
						},
					}); // 아작스 끝
				} else { // 유효성 통과 못함
					// 모달창으로 팀코드에는 숫자만된다고 보여줌
					$.magnificPopup.open({
						items : {
							src : '#dialogOnlyNumber',
							type : 'inline'
						},
						preloader : false,
						modal : true,
						callbacks : {
							change : function() {
								_self.dialog.$onlyNumber.on('click',
										function(e) {
											e.preventDefault();
											// 모달창 닫기
											$.magnificPopup.close();
										});
							}
						}
					})
				}// else문 종료
			})
			// 팀코드 등록 끝
		
			.on('click', 'a.cancel-row', function(e) {
				e.preventDefault();

				_self.rowCancel($(this).closest('tr'));
			}).on('click', 'a.edit-row', function(e) {
				e.preventDefault();
				var t = e.target;
				var tr = t.closest('tr')
				tempTeamCode = $(tr).children('td:eq(1)').text();
				_self.rowEdit($(this).closest('tr'));

			}) // 관리자 팀코드 삭제 시작
			.on('click', 'a.remove-row', function(e) {
				e.preventDefault();
				var $row = $(this).closest('tr');

				var t = e.target;
				var tr = t.closest('tr')
				var teamCode = $(tr).children('td:eq(1)').text();
				console.log(teamCode);

				$.magnificPopup.open({
					items : {
						src : '#dialog',
						type : 'inline'
					},
					preloader : false,
					modal : true,
					callbacks : {
						change : function() {
							_self.dialog.$confirm.on('click', function(e) {
								e.preventDefault();

								// 뷰단 테이블에서 삭제
								_self.rowRemove($row);

								// 모달창 닫기
								$.magnificPopup.close();

								// json 형태로 가공
								var teamDelData = {
									"teamCode" : teamCode
								};
								// 팀 코드 확인
								console.log(teamDelData);

								// 삭제 아작스 시작
								$.ajax({
									url : 'ajax/admin/delTeamCode.do',
									type : 'POST',
									data : teamDelData,
									dataType : "JSON",
									success : function(data) {
										console.log("아작스 성공");
										if (data > 0) {
											swal({
												   title:"삭제 성공",
												   text: "삭제되었습니다.",
												   icon: "success" //"info,success,warning,error" 중 택1
												}).then((YES) => {
											});
										} else {
											swal({
												   title:"삭제 실패",
												   text: "해당 팀에 등록된 사원이 있으므로 삭제 할 수 없습니다.",
												   icon: "error" //"info,success,warning,error" 중 택1
												}).then((YES) => {
											});
										}
									},
									error : function() {
									
									}
								});
								// 아작스 끝
							});
						},
						close : function() {
							_self.dialog.$confirm.off('click');
						}
					}
				}); // 모달창 끝
			})

			this.$addButton.on('click', function(e) {
				e.preventDefault();
				_self.rowAdd();
			});

			this.dialog.$cancel.on('click', function(e) {
				e.preventDefault();
				$.magnificPopup.close();
			});

			return this;
		},

		// ==========================================================================================
		// ROW FUNCTIONS
		// ==========================================================================================
		rowAdd : function() {
			this.$addButton.attr({
				'disabled' : 'disabled'
			});

			var actions, data, $row;

			actions = [
					'<a href="#" class="hidden on-editing save-row-Add"><i class="fa fa-save"></i></a>',
					'<a href="#" class="hidden on-editing cancel-row"><i class="fa fa-times"></i></a>',
					'<a href="#" class="on-default edit-row"><i class="fa fa-pencil"></i></a>',
					'<a href="#" class="on-default remove-row"><i class="fa fa-trash-o"></i></a>' ]
					.join(' ');

			data = this.datatable.row.add([ '', '', '', actions ]);
			$row = this.datatable.row(data[0]).nodes().to$();

			$row.addClass('adding').find('td:last').addClass('actions');

			this.rowEdit($row);

			this.datatable.order([ 0, 'asc' ]).draw(); // always show fields
		},

		rowCancel : function($row) {
			var _self = this, $actions, i, data;

			if ($row.hasClass('adding')) {
				this.rowRemove($row);
			} else {

				data = this.datatable.row($row.get(0)).data();
				this.datatable.row($row.get(0)).data(data);

				$actions = $row.find('td.actions');
				if ($actions.get(0)) {
					this.rowSetActionsDefault($row);
				}

				this.datatable.draw();
			}
		},

		rowEdit : function($row) {
			var _self = this, data;
			data = this.datatable.row($row.get(0)).data();
			// 여기다 여기1!!!!!
			//console.log(this.datatable.row($row.get(0)).data()[0]);
			var lastNum = this.datatable.row()[0].length;
			//console.log(this.datatable.row()[0][1]);
			
			//여기서 데이타테이블 
			$row
					.children('td')
					.each(
							function(i) {
								var $this = $(this);

								if ($this.hasClass('actions')) {
									_self.rowSetActionsEditing($row);
								} else {
									if (i == 0) {
										$this
												.html('<input type="text" readonly class="form-control input-block" value="'
														+ lastNum + '"/>');
									} else {
										$this
												.html('<input type="text" class="form-control input-block" value="'
														+ data[i] + '"/>');
									}
								}
							});
		},

		rowSave : function($row) {
			var _self = this, $actions, values = [];

			if ($row.hasClass('adding')) {
				this.$addButton.removeAttr('disabled');
				$row.removeClass('adding');
			}

			values = $row.find('td').map(function() {
				var $this = $(this);

				if ($this.hasClass('actions')) {
					_self.rowSetActionsDefault($row);
					return _self.datatable.cell(this).data();
				} else {
					return $.trim($this.find('input').val());
				}
			});

			this.datatable.row($row.get(0)).data(values);

			$actions = $row.find('td.actions');
			if ($actions.get(0)) {
				this.rowSetActionsDefault($row);
			}
			this.datatable.draw();
		},

		rowRemove : function($row) {
			if ($row.hasClass('adding')) {
				this.$addButton.removeAttr('disabled');
			}

			this.datatable.row($row.get(0)).remove().draw();
		},

		rowSetActionsEditing : function($row) {
			$row.find('.on-editing').removeClass('hidden');
			$row.find('.on-default').addClass('hidden');
		},

		rowSetActionsDefault : function($row) {
			$row.find('.on-editing').addClass('hidden');
			$row.find('.on-default').removeClass('hidden');
		},
		
	
		

	};


	
	
	$(function() {
		EditableTable.initialize();
	});

}).apply(this, [ jQuery ]);