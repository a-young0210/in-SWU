<?php

	for ($num = 1; $num <= 10; $num++)
	{
		$fac = 1;

		for ($i = 0; $i < $num; $i++)
		{
			$var = $num - $i;
			$fac = $fac * $var;

			if ($var == 1)
				echo "{$num}! = $fac<br>";
				
		}

	}

?>