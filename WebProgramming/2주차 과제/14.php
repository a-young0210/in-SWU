<?php
	
	$money = 3000;	//지불액
	$price = 800;	//물건 가격
	$num = 3;		//구매 개수

	$change = $money - $price * $num;

	echo ("물건 가격 : $price <br>");
	echo ("구매 개수 : $num <br>");
	echo ("지불액 : $money <br>");
	echo ("거스름돈은 {$change}원 입니다.<br>");
?>