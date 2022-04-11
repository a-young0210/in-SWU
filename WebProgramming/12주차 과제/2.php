<?php
	$con = mysqli_connect("localhost", "user1", "12345", "sample");
	$sql = "select * from message where send_id= '$userid' order by num desc";
	$total_record = mysqli_num_rows($result);	//전체 쪽지 수 
	$scale = 10;	//한 페이지에 표시되는 쪽지 수

	//전체 페이지 수($total_page) 계산
	if ($total_record % $scale == 0)
		$total_page = floor($total_record/$scale);
	else 
		$total_page = floor($total_record/$scale) + 1;

	//표시할 페이지($page)에 따라 $start 계산
	$start = ($page - 1) * $scale;

	$number = $total_record - $start;

	for ($i = $start; $i<$start+$scale && $i < $total_record; $i++)
	{
		mysqli_data_seek($result, $i);
		$row = mysqli_fetch_array($result);
		$num = $row["num"];
		$subject = $row["subject"];
		$regist_day = $row["regist_day"];

		if ($mode == "send")
			$msg_id = $row["rv_id"];
		else
			$msg_id = $row["send_id"];

		$result2 = mysqli_query($con, "select name from members where id='$msg_id'");
		$record = mysqli_fetch_array($result2);
		$msg_name = $record["name"];

		/* 생략 */
			$number--;
	}
	mysqli_close($con);
?>