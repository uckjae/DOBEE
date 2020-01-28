<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

				check: function( input, label ) {
	if ( input.is(':checked') ) {
		label.addClass('line-through');
	} else {
		label.removeClass('line-through');
	}
}


function() {
			var _self = this,
				$check = this.$el.find('.todo-check');

			$check.each(function () {
				var label = $(this).closest('li').find('.todo-label');
				_self.check( $(this), label );
			});

			return this;
		}