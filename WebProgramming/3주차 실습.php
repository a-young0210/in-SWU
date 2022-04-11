<?php
	
	$writing_score = 75;
	$practice_score = 85;

	echo "필기시험 점수 : {$writing_score}점 <br>";
	echo "실기시험 점수 : {$practice_score}점 <br>";

	if($writing_score >= 70 && $practice_score >= 80) 
		$pass = "합격";
	else
		$pass = "불합격";

	echo "합격 여부 : $pass";
?>
