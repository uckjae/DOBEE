

(function( $ ) {

	'use strict';

	var initCalendarDragNDrop = function() {
		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
		});
	};
	
	var eventList = [];

	$.ajax ({
		url : "AbsAll.do",
		dataType : "json",
		success : function(data) {
			var events = [];
			events = data.AbsAll;
			
			$.each(events, (index, element) => {
				
				// console.log(element);
				
				if (element.isAuth ==='승인' && element.apyCode == 1 ) {
					eventList.push({
						title : "연차",
						start : element.startAt,
						end : element.endAt,
						color : "#f28c1f"
					})
				} else if (element.isAuth ==='미승인' && element.apyCode == 1 ) {
					eventList.push({
						title : "연차 미승인",
						start : element.startAt,
						end : element.endAt,
						color : "#f54242"
					})
				} else if (element.isAuth == '승인' && element.apyCode == 2 ) {
					eventList.push({
						title : "반일 연차",
						start : element.startAt,
						end : element.endAt,
						color : "#f28c1f"
					})
				} else if (element.isAuth ==='미승인' && element.apyCode == 2 ) {
					eventList.push({
						title : "반일 연차 미승인",
						start : element.startAt,
						end : element.endAt,
						color : "#f54242"
					})					
				} else if (element.isAuth == '출장' && element.apyCode == 3 ) {
					eventList.push({
						title : "출장",
						start : element.startAt,
						end : element.endAt,
						color : "#f28c1f"
					})
				} else if (element.isAuth ==='출장' && element.apyCode == 3 ) {
					eventList.push({
						title : "출장 미승인",
						start : element.startAt,
						end : element.endAt,
						color : "#f54242"
					})
				} else if (element.isAuth == '외근' && element.apyCode == 4 ) {
					eventList.push({
						title : "외근",
						start : element.startAt,
						end : element.endAt,
						color : "#f28c1f"
					})
				} else if (element.isAuth ==='외근' && element.apyCode == 4 ) {
					eventList.push({
						title : "외근 미승인",
						start : element.startAt,
						end : element.endAt,
						color : "#f54242"
					})
				} else if (element.isAuth == '경조 휴가' && element.apyCode == 5 ) {
					eventList.push({
						title : "경조 휴가",
						start : element.startAt,
						end : element.endAt,
						color : "#3b6b7d"
					})
				} else if (element.isAuth ==='경조 휴가' && element.apyCode == 5 ) {
					eventList.push({
						title : "경조 휴가 미승인",
						start : element.startAt,
						end : element.endAt,
						color : "#f54242"
					})
				}	
			});
		},
		complete : function() {
			var initCalendar = function() {
				
			var $calendar = $('#calendar');
			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();

			$calendar.fullCalendar({
				
				header: {
					left: 'title',
					right: 'prev,today,month,dayGrid,timeGrid,list,next,basicDay,basicWeek'
				},

				timeFormat: 'h:mm',

				titleFormat: {
					month: 'YYYY MMMM',      // September 2009
				    week: "YYYY MMM d",      // Sep 13 2009
				    day: 'YYYY, dddd, MMM d' // Tuesday, Sep 8, 2009
				},

				themeButtonIcons: {
					prev: 'fa fa-caret-left',
					next: 'fa fa-caret-right',
				},

				businessHours : true,
				editable: false,
				eventLimit : true,
				droppable: false, // this allows things to be dropped onto the calendar !!!
				
				drop: function(date, allDay) { // this function is called when something is dropped
					
					var $externalEvent = $(this);
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $externalEvent.data('eventObject');

					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject);

					// assign it the date that was reported
					copiedEventObject.start = date;
					copiedEventObject.allDay = allDay;
					copiedEventObject.className = $externalEvent.attr('data-event-class');

					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

					// is the "remove after drop" checkbox checked?
					if ($('#RemoveAfterDrop').is(':checked')) {
						// if so, remove the element from the "Draggable Events" list
						$(this).remove();
					}
				},
				
				events : eventList

				
			});

			// FIX INPUTS TO BOOTSTRAP VERSIONS
			var $calendarButtons = $calendar.find('.fc-header-right > span');
			$calendarButtons
				.filter('.fc-button-prev, .fc-button-today, .fc-button-next')
					.wrapAll('<div class="btn-group mt-sm mr-md mb-sm ml-sm"></div>')
					.parent()
					.after('<br class="hidden"/>');
			$calendarButtons
				.not('.fc-button-prev, .fc-button-today, .fc-button-next')
					.wrapAll('<div class="btn-group mb-sm mt-sm"></div>');
			$calendarButtons
				.attr({ 'class': 'btn btn-sm btn-default' });

		};

		$(function() {
			initCalendar();
			initCalendarDragNDrop();
		});
		}
	});
	
		

}).apply(this, [ jQuery ]);


window.onload = function() {
	
	
			
}