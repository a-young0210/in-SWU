<!DOCTYPE html>
<html>
<head> 
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<link rel="stylesheet" type="text/css" href="./css/board.css">
</head>
<body> 
<header>
</header>  
<section>
	    <h3>
	    	예매현황 > 목록보기
		</h3>
	    <ul id="board_list">
				<li>
					<span class="col1">번호</span>
					<span class="col2">영화제목</span>
					<span class="col3">성인</span>
					<span class="col4">청소년</span>
					<span class="col5">총예매금액</span>
					<span class="col6">등록일</span>
				</li>
<?php
	if (isset($_GET["page"]))
		$page = $_GET["page"];
	else
		$page = 1;

	$con = mysqli_connect("localhost", "user1", "12345", "sample");
	$sql = "select * from reserve order by num";
	$result = mysqli_query($con, $sql);
	$total_record = mysqli_num_rows($result); // 전체 글 수

	$scale = 5;

	// 전체 페이지 수($total_page) 계산 
	if ($total_record % $scale == 0)     
		$total_page = floor($total_record/$scale);      
	else
		$total_page = floor($total_record/$scale) + 1; 
 
	// 표시할 페이지($page)에 따라 $start 계산  
	$start = ($page - 1) * $scale;      

	$number = $total_record - $start;

   for ($i=$start; $i<$start+$scale && $i < $total_record; $i++)
   {
      mysqli_data_seek($result, $i);
      // 가져올 레코드로 위치(포인터) 이동
      $row = mysqli_fetch_array($result);
      // 하나의 레코드 가져오기
	  $num         = $row["num"];
	  $choice          = $row["choice"];
	  $adult       = $row["adult"];
	  $child    = $row["child"];
	  $price         = $row["price"];
      $regist_day  = $row["regist_day"];
?>
				<li>
					<span class="col1"><?=$number?></span>
					<span class="col2"><?=$choice?></span>
					<span class="col3"><?=$adult?></span>
					<span class="col4"><?=$child?></span>
					<span class="col5"><?=$price?></span>
					<span class="col6"><?=$regist_day?></span>
				</li>	
<?php
   	   $number--;
   }
   mysqli_close($con);

?>
	    	</ul>
			<ul id="page_num"> 	
<?php
	if ($total_page>=2 && $page >= 2)	
	{
		$new_page = $page-1;
		echo "<li><a href='reserve_list.php?page=$new_page'>◀ 이전</a> </li>";
	}		
	else 
		echo "<li>&nbsp;</li>";

   	// 게시판 목록 하단에 페이지 링크 번호 출력
   	for ($i=1; $i<=$total_page; $i++)
   	{
		if ($page == $i)     // 현재 페이지 번호 링크 안함
		{
			echo "<li><b> $i </b></li>";
		}
		else
		{
			echo "<li><a href='reserve_list.php?page=$i'> $i </a><li>";
		}
   	}
   	if ($total_page>=2 && $page != $total_page)		
   	{
		$new_page = $page+1;	
		echo "<li> <a href='reserve_list.php?page=$new_page'>다음 ▶</a> </li>";
	}
	else 
		echo "<li>&nbsp;</li>";
?>
			</ul> <!-- page -->	    	
			<ul class="buttons">
				<li><button onclick="location.href='reserve_list.php'">목록</button></li>
				<li><button onclick="location.href='screen.php'">예매하기</button></li>
			</ul>
	</div>
</section> 
</body>
</html>
