<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<h3>예매 결과</h3>
	<?php
	$title = $_POST["title"];
	$adult = $_POST["adult"];
	$kids = $_POST["kids"];
	$price = 0;

	function movie_price($title)		//영화 요금
	{
		if ($title = "1. 라이언킹 (6천원)")
			$price = 6000;
		elseif ($title = "2. 겨울왕국1 (6천원)")
			$price = 6000;
		elseif ($title = "3. 겨울왕국2 (7천원)")
			$price = 7000;
		elseif ($title = "4. 알라딘 (7천원)")
			$price = 7000;
		else
			$price = 8000;

		return $price;
	}

	$this_price = movie_price($title);

	$total_price = ($adult + $kids) * $this_price;

	echo "선택하신 영화는 {$title}이고 총 예매 금액은 {$total_price}원입니다!";
	
	$regist_day = date("Y-m-d (H:i)");	

	$con = mysqli_connect("localhost", "user1", "12345", "sample");

	$sql = "insert into reserve(choice, adult, child, price, regist_day) ";
	$sql .= "values('$title', '$adult', '$kids', '$total_price', '$regist_day')";

	mysqli_query($con, $sql);
	mysqli_close($con);
	?>
</body>
