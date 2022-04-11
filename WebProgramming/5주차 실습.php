<?php

	$count = 0;

	echo "--------------<br>";
	//구구단 결과 2차원 배열에 저장
	for ($i = 0; $i <= 7;  $i++)
		for($j = 0; $j <= 8; $j++)
			$result[$i][$j] = ($i + 2) * ($j + 1);

	for ($i = 0; $i <= 7; $i++)
		for ($j = 0; $j <= 8; $j++)
		{
			$a = $i + 2;
			$b = $j + 1;
			$price = $a * $b;
			echo "$a x $b = $price</br>";
			$count++;

			if ($count % 9 == 0)
			{
				echo "--------------<br>";
			}
		}

?>