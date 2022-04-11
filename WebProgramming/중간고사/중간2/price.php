<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<h3>선택 결과</h3>
	<?php
	$time = $_POST["time"];
	$adult = $_POST["adult"];
	$kids = $_POST["kids"];

	function youth_rate($cat)		//청소년 요금
	{
		if ($time == "모닝(6:00~)")
			$price = 7000;
		elseif ($time == "브런치(11:00~)")
			$price = 8000;
		elseif ($time == "데이(13:00~)")
			$price = 8000;
		elseif ($time == "프라임(14:00~)")
			$price = 9000;
		elseif ($time == "문라이트(21:00~)")
			$price = 9000;
		else
			$price = 8000;

		return $k_price;
	}

	function adult_rate($cat)		//청소년 요금
	{
		if ($time == "모닝(6:00~)")
			$price = 7000;
		elseif ($time == "브런치(11:00~)")
			$price = 8000;
		elseif ($time == "데이(13:00~)")
			$price = 8000;
		elseif ($time == "프라임(14:00~)")
			$price = 9000;
		elseif ($time == "문라이트(21:00~)")
			$price = 9000;
		else
			$price = 8000;

		return $k_price;
	}

	echo "선택하신 시간대는 {$time}이고 총 금액은 {$price}원입니다!"
	?>
</body>
