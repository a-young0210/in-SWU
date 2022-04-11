<?php
	$send_id = $_GET["send_id"];
	$rv_id = $_POST['rv_id'];
	$subject = $_POST['subject'];
	$content = $_POST['content'];
	$content = htmlspecialchars($content, ENT_QUOTES);
	$regist_day = date("Y-m-d (H:)");	//현재의 '연-월-일-시-분' 저장

		$con = mysqli_connect("localhost", "user1", "12345", "sample");
		$sql = "select * from members where id = '$rv_id'";
		$result = mysqli_query($con, $sql);
		$num_record = mysqli_num_rows($result);

		if($num_record)
		{
			$sql = "insert into message (send_id, rv_id, subject, content, regist_day)";
			$sql .= "values('$send_id', '$rv_id', '$subject', '$content', '$regist_day')";
			mysqli_query($con, $sql);	//$sql에 저장된 명령 실행
		} else {
			echo("	<script>
				alert('수신 아이디가 잘못되었습니다!');
				history.go(-1)
				</script> ");
			exit;
		}
		mysql_close($con)	// DB 연결 끊기
?>