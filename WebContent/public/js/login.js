$(document).ready(function(){
	$(".showFormRecuperar").click(function(){
		$("#recover").fadeIn("slow");
		$("#registrarse").hide();
	});
	
	$(".registrarse").click(function(){
		$("#recover").hide();
		$("#registrarse").fadeIn("slow");
	});
	
});