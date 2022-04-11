<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<?php
	$title = $_POST["title"];
	$adult = $_POST["adult"];
	$kids = $_POST["kids"];
	$a_price = 10000;
	$k_price = 7000;
	$page = 1;

	function adult_price($title)		//성인 요금
	{
		$ad_price = $adult * $a_price;

		return $ad_price;
	}


	function kids_price($title)		//청소년 요금
	{
		$ki_price = $kids * $k_price;

		return $ki_price;
	}

	$total_price = $ad_price + $ki_price;
	
	$regist_day = date("Y-m-d (H:i)");	

	$con = mysqli_connect("localhost", "user1", "12345", "sample");

	$sql = "insert into reserve(choice, adult, child, price, regist_day) ";
	$sql .= "values('$title', '$adult', '$kids', '$total_price', '$regist_day')";

	mysqli_query($con, $sql);
	mysqli_close($con);

	    echo "
	      <script>
	          location.href = 'reserve_list.php?page=$page';
	      </script>
	 	 ";
	?>
</body>
