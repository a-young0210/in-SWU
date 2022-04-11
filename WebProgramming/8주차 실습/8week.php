<?php
	session_start();
	$userid = $_SESSION["userid"];
?>
<html>
<head>
	<meta charset="utf-8">
</head>
<body>
	<h1>등록된 세션(userid) : <?= $userid?></li>
</body>
</html>