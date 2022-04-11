<?php
	
	$child_fee = 5000;	//청소년 입장료 5,000원
	$adult_fee = 8000;	//성인 입장료 8,000원
	$num_child = 3;		//청소년 3매
	$num_adult = 2;		//성인 2매

	$total_fee = $child_fee * $num_child + $adult_fee * $num_adult;

	echo "전체 입장료 : {$total_fee}원";
?>