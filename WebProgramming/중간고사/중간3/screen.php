<html>
<head>
<meta charset="utf-8">
</head>
<body>
	<form name = "form1" method="post" action="reservation.php">

	<h3>영화표 가격 계산하기</h3>
	<ul>
		<li>영화선택 : 
			<select name = "title">
			<option>선택하세요!</option>
			<option>1. 라이언킹 (6천원)</option>
			<option>2. 겨울왕국1 (6천원)</option>
			<option>3. 겨울왕국2 (7천원)</option>
			<option>4. 알라딘 (7천원)</option>
			<option>5. 뮬란 (8천원)</option>
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
		<li><input type = "submit" value = "예매 확인하기"></li>
	</ul>
</body>