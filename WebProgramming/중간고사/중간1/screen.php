<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<form name = "form1" method="post" action="price.php">

	<h3>영화표 가격 계산하기</h3>
	<ul>
		<li>상영시간 : 
			<select name = "time">
			<option>선택하세요!</option>
			<option>모닝(6:00~)</option>
			<option>브런치(11:00~)</option>
			<option>데이(13:00~)</option>
			<option>프라임(14:00~)</option>
			<option>문라이트(21:00~)</option>
			<option>나이트(24:00~)</option>
			</select>
		</li>

		<li>성 &nbsp; &nbsp; &nbsp;인 : 
			<select name = "adult">
			<option>선택하세요!</option>
			<option>0</option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			</select>
		</li>

		<li>청 &nbsp;소 &nbsp;년 : 
			<select name = "kids">
			<option>선택하세요!</option>
			<option>0</option>
			<option>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			</select>
		</li>
		<li><input type = "submit" value = "가격 알아보기"></li>
	</ul>
</body>