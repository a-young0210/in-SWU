<html>
<head>
	<meta charset="utf-8">
</head>
	<?php
		$num1 = $_POST["num1"];
		$num2 = $_POST["num2"];

		$sum = 0;
		if($num1 <= $num2) {
			for ($i = $num1; $i <= $num2; $i++)
				$sum = $sum + $i;
		}
	?>
<body>
	<ul>
		<li>첫번째 입력받은 숫자부터 두번째 입력받은 숫자까지의 합: <?= $sum?></li>
	</ul>
</body>	
</html>
