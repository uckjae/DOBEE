

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
		url : "ExtAll.do",
		dataType : "json",
		success : function(data) {
			var events = [];
			events = data.ExtAll;
			$.each(events, (index, element) => {
				if (element.isAuth === '승인') {
					eventList.push({
						title: "연장근무", 
						start: element.startAt, 
						end: element.endAt,
						color: "#f28c1f"
					})		
				} else if (element.isAuth === '미승인') {
					eventList.push({
						title: "미승인", 
						start: element.startAt, 
						end: element.endAt,
						color: "#c842f5"
					})		
				} /*else if (element.isAuth === '반려') {
					eventList.push({
						title: "반려", 
						start: element.startAt, 
						end: element.endAt,
						color: "#fc4103"
					})		
				}*/
			});
		},
		complete : function () {
			var calendarEl = document.getElementById('calendar');

		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
		      header: {
		    	left : 'prev,today,next',
				center : 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
		      },
		      navLinks: true, // can click day/week names to navigate views
		      businessHours: {
			      startTime : '09:00',
			      endTime : '18:00'
			  },
			  eventLimit : true,
		      editable: false,
		      events: eventList
		    });
		    calendar.render();
		}
	});
	
	

	$(function() {
		initCalendar();
		initCalendarDragNDrop();
	});

}).apply(this, [ jQuery ]);


window.onload = function() {
	
	
			
}