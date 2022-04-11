<?php
	$id = $_POST["userid"];
	session_start();
	$_SESSION['userid'] = $id;
	$userid = $_SESSION['userid'];
?>
<html>
<head>
	<meta charset="utf-8">
</head>
<body>
	<h1><?= $userid?>님 안녕하세요.</li>
</body>
</html>