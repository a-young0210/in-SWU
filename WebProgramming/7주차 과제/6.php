<?php
	session_start();
	echo "세션 시작!!!<br>";

	$_SESSION['userid'] = "2019111396";
	$_SESSION['username'] = "양아영";
	echo '세션 등록 완료!!!<br>';

	echo $_SESSION['userid']."<br>";
	echo $_SESSION['username']."<br>";
?>