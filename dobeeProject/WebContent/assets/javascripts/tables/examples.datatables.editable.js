var cardReg = new RegExp("(5[1-5]\d{14})|(4\d{12})(\d{3}?)|3[47]\d{13}|(6011\d{12})");
var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 


// 법인(공용)  법인(개인)  법인(체크)
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
					
					var t = e.target;
					var tr = t.closest('td')
					
					var cardNum = $(tr).parents('tr').children('td:eq(1)').find('input').val();
					var corp = $(tr).parents('tr').children('td:eq(2)').find('input').val();
					var name = $(tr).parents('tr').children('td:eq(3)').find('input').val();
					var nickName = $(tr).parents('tr').children('td:eq(4)').find('input').val();
					var entry = $(tr).parents('tr').children('td:eq(5)').find('input').val();
					var valDate = $(tr).parents('tr').children('td:eq(6)').find('input').val();
					
					
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
						if(!cardNumCheck){console.log("카드번호 재입력해주세요.");}
						if(!valDateCheck){console.log("날짜 재입력해주세요");}
						if(!entryCheck){console.log("카드 종류를 재입력해주세요");}
					}
					
					
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
					
				})
				.on('click', 'a.cancel-row', function( e ) {
					e.preventDefault();

					_self.rowCancel( $(this).closest( 'tr' ) );
				})
				.on('click', 'a.edit-row', function( e ) {
					e.preventDefault();

					_self.rowEdit( $(this).closest( 'tr' ) );
					
					
					
					
					
					
				})
				.on( 'click', 'a.remove-row', function( e ) {
					e.preventDefault();

					var $row = $(this).closest( 'tr' );

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

									_self.rowRemove( $row );
									$.magnificPopup.close();
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