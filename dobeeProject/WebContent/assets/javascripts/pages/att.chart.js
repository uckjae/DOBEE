
var ctx = document.getElementById('attChart').getContext('2d');

var minInit = moment('1970-01-01 06:00:00').valueOf();

var monthLabel = [];
for (let i = 1; i <= 31; i++) {
	monthLabel.push('2020-01-'+i);
}
console.log("월 출력 : ", monthLabel);

// 출근 시간 ABS
var data1 = [
	moment('1970-01-01 08:00:00').valueOf()+10.8e6,
	moment('1970-01-01 09:30:00').valueOf()+10.8e6,
	moment('1970-01-01 10:20:00').valueOf()+10.8e6,
	moment('1970-01-01 11:10:00').valueOf()+10.8e6,
	moment('1970-01-01 12:50:00').valueOf()+10.8e6,
	moment('1970-01-01 11:40:00').valueOf()+10.8e6,
	moment('1970-01-01 10:30:00').valueOf()+10.8e6,
	moment('1970-01-01 09:20:00').valueOf()+10.8e6,
	moment('1970-01-01 08:10:00').valueOf()+10.8e6,
	moment('1970-01-01 07:00:00').valueOf()+10.8e6,
	moment('1970-01-01 08:00:00').valueOf()+10.8e6,
	moment('1970-01-01 09:30:00').valueOf()+10.8e6,
	moment('1970-01-01 10:20:00').valueOf()+10.8e6,
	moment('1970-01-01 11:10:00').valueOf()+10.8e6,
	moment('1970-01-01 12:50:00').valueOf()+10.8e6,
	moment('1970-01-01 11:40:00').valueOf()+10.8e6,
	moment('1970-01-01 10:30:00').valueOf()+10.8e6,
	moment('1970-01-01 09:20:00').valueOf()+10.8e6,
	moment('1970-01-01 08:10:00').valueOf()+10.8e6,
	moment('1970-01-01 07:00:00').valueOf()+10.8e6
];

// 퇴근 시간 ABS
var data2 = [
	moment('1970-01-01 18:35:00').valueOf(),
	moment('1970-01-01 18:25:00').valueOf(),
	moment('1970-01-01 18:15:00').valueOf(),
	moment('1970-01-01 18:10:00').valueOf(),
	moment('1970-01-01 18:20:00').valueOf(),
	moment('1970-01-01 18:30:00').valueOf(),
	moment('1970-01-01 18:40:00').valueOf(),
	moment('1970-01-01 18:50:00').valueOf()
];

// 연장근무 시작 시간 ABS
var data3 = [
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf(),
	moment('1970-01-01 19:30:00').valueOf()
]

// 연장근무 종료 시간 ABS
var data4 = [
	moment('1970-01-01 22:30:00').valueOf(),
	moment('1970-01-01 22:30:00').valueOf(),
	moment('1970-01-01 23:30:00').valueOf(),
	moment('1970-01-01 22:30:00').valueOf(),
	moment('1970-01-01 21:30:00').valueOf(),
	moment('1970-01-01 20:30:00').valueOf(),
	moment('1970-01-01 22:30:00').valueOf(),
	moment('1970-01-01 23:30:00').valueOf()
]

// 출근시간 ABS
var inTime = [];
for (var i = 0; i<data1.length; i++) {
	inTime.push(moment(data1[i]));
}

// 출근시간 REL
var inTimeRel = [];
for (var i =0; i<data1.length; i++) {
	inTimeRel.push(data1[i]-minInit-10.8e6);
}
console.log('inTime : ', inTime);

// 퇴근 시간 REL 중간 값 계산
var outTime = [];
for (var i = 0; i<data2.length; i++) {
	outTime.push(data2[i]-inTimeRel[i]-minInit);
}
console.log('outTime : ', outTime);

// 연장 근무 시작 시간 REL
var extTime = [];
for (var i = 0; i<data3.length; i++) {
	extTime.push(data3[i]-outTime[i]-inTimeRel[i]-minInit);
}
console.log('extTime : ', extTime);

// 연장 근무 종료 시간 REL
var extTimeEnd = [];
for (var i =0; i<data4.length; i++) {
	extTimeEnd.push(data4[i]-inTimeRel[i]-outTime[i]-extTime[i]-minInit);
}
console.log('extTimeEnd : ', extTimeEnd);


console.log(inTime);
console.log(outTime);

console.log("8시 " + moment('1970-01-02 08:00:00').valueOf());
console.log("9시 " + moment('1970-01-02 09:00:00').valueOf());
console.log("min : " + moment('1970-01-02 06:00:00').valueOf());
console.log("max : " + moment('1970-01-03 02:00:00').valueOf());

var attChart = new Chart(ctx, {

    type: 'bar',
    data: {
        labels:['2020-01-01','2020-01-02','2020-01-03','2020-01-04','2020-01-05','2020-01-06','2020-01-07','2020-01-08','2020-01-09','2020-01-01','2020-01-02','2020-01-03','2020-01-04','2020-01-05','2020-01-06','2020-01-07','2020-01-08','2020-01-09','2020-01-01','2020-01-02','2020-01-03','2020-01-04','2020-01-05','2020-01-06','2020-01-07','2020-01-08','2020-01-09','2020-01-01','2020-01-02','2020-01-03','2020-01-04','2020-01-05','2020-01-06','2020-01-07','2020-01-08','2020-01-09'],
        // 이거그냥 day 타입이 아니고 디비에서 바로 뿌려줄거임.
        datasets: [{
        	stack : 'Stack 0',
            label: '출근',
            data: inTime,
            backgroundColor: 'rgba(255, 255, 0, 0)', // 'rgba(255, 255,
														// 255, 0)',
            borderColor: 'rgba(255, 255, 0, 0.0 )',
            borderWidth: 1,
            barTickness : 1
        },
        {
        	stack : 'Stack 0',
            label: '퇴근',
            data: outTime,
            backgroundColor: 'rgba(54, 162, 235, 1)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1

        },
        {
        	stack : 'Stack 0',
            label: '연장근무 시작',
            data: extTime,
            backgroundColor: 'rgba(255, 255, 100, 0.1)',
            borderColor: 'rgba(255, 99, 132, 0.1)',
            borderWidth: 1
        },
        {
        	stack : 'Stack 0',
            label: '연장근무 종료',
            data: extTimeEnd,
            backgroundColor: 'rgba(255, 0, 0, 1)',
            borderColor: 'rgba(255, 0, 0, 1)',
            borderWidth: 1
        }

        ]
    },

    options: {
    	responsive : true,
		title: {
			text: 'Chart.js Combo Time Scale'
		},

		tooltips : {
			callback: {
				label : function(tooltipItem, data) {
					var form = moment(data.datasets[tooltipItem.datasetIndex].data[tooltipitem.index]);
					if (form.diff( moment('1970-01-02 00:00:00'), 'minutes') === 0) {
						return null;
					}
					return form.format('h A');

				}
			}			
		},
		scales: {
			x: {
				type: 'time',
				display: true,
				offset: true,
				time: {
					unit: 'day'
				}
			},
			yAxes : [{
				type : 'linear',
				beingAtZero : false,
				stacked : true,
				ticks : {
					min : moment('1970-01-01 09:00:00').valueOf(),
					max : moment('1970-01-02 04:00:00').valueOf(),
					stepSize : 3.6e6,

					callback: value => {
						let date = moment(value-10.8e6);
						if(date.diff(moment('1970-01-01 00:00:00'), 'minutes') === 0) {
							return null;
						}
						return date.format('h:mm A');
					}

					
				}
			}]
		},
	}
});
