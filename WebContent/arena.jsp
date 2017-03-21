<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sHoOt-Em-Up</title>
<style>
#myArena {
	/* cursor: crosshair; */
	cursor: crosshair
}

.enemy {
	cursor: crosshair
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<script type="text/javascript">
 	$(document).ready(function(){
 		generateEnemyPos();
 		$("#myArena").click(function(event){
 			console.log("shot fired!");
 	 		checkCasuality(event);
 		});
 	});
 	
	function generateEnemyPos() {
		var max = 400;
		var min = 100;
		var randomPosX = Math.random() * (max - min) + min;
		var randomPosY = Math.random() * (max - min) + min;
		$("#enemy0").css({
			top : randomPosY,
			left : randomPosX,
			position : 'absolute',
			display: 'block'
		});
	}
	
	function checkCasuality(event) {
		// alert(event.pageX+":"+event.pageY);
		var fireX = event.pageX;
		var fireY = event.pageY;
		
		var enemyPos = $("#enemy0");
		var positionOfEnemy = enemyPos.position();
		var leftOfEnemy = positionOfEnemy.left;
		var topOfEnemy = positionOfEnemy.top;
		var enemyCenterX = leftOfEnemy + 25;
		var enemyCenterY = topOfEnemy + 25;
		
		if (Math.abs(fireX - enemyCenterX) < 20 && Math.abs(fireY - enemyCenterY) < 20){
			alert ("killed");
		}
	}
</script>
</head>
<body>
	<div>
		<div id="myArena"
			style="height: 500px; width: 500px; background-color: green; position: relative; left: 0; top: 0">
			<div id="enemy0" class="enemy"
				style="height: 50px; width: 50px; display: none">
				<img alt="enemy" src="pirate-icon.png" width="100%" height="100%">
			</div>
		</div>
	</div>
</body>
</html>