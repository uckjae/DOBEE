
$(function(){
	var app = new Vue({
		el : '#app',
		components : {
		},
		beforeCreate : function(){
            console.log(sessionStorage.user_login_chk +'허허허')
		},
		data:{
			test:"test"
		}
	})
})