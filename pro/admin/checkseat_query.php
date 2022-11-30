<?php
	date_default_timezone_set("Asia/Manila");
 
	
	$conn = connect();
	$query = mysqli_query($conn, "SELECT * FROM `schedule`");
	$date = date("Y-m-d");
	while($fetch = mysqli_fetch_array($query)){
		if(strtotime($fetch['date']) < strtotime($date)){
			mysqli_query($conn, "INSERT INTO `archive` VALUES('$fetch[id]', '$fetch[train_id]', '$fetch[route_id]', '$fetch[date]', '$fetch[time]','$fetch[first_fee]','$fetch[second_fee]','$fetch[free]')") or die(mysqli_error($conn));
			mysqli_query($conn, "DELETE FROM `schedule` WHERE `id` = '$fetch[id]'") or die(mysqli_error($conn));
		}
	}

    
?>
