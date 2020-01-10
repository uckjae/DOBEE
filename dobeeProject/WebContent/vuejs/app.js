//import router from "route/router.js"



$(function(){
	var app = new Vue({
		
		el : '#app',
		routes : router,
	
		beforeCreate : function(){
           console.log("뷰 작동 되나요?");
		},
	
	})
})



