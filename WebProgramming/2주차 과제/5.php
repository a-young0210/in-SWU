<html>
	<style>
		table {
			width:  50%;
			border:  1px solid #444444;
			border-collapse:  collapse;
		}
		td {
			border:  1px solid #444444;
		}
	</style>
	<table>
		<?php

			$name="양아영";
			$num1="010";
			$num2="6793";
			$num3="4285";
			$phone_num=$num1."-".$num2."-".$num3;
			$address="서울시 노원구";
			$email1="dkdudab";
			$email2="hanmail.net";
			$email=$email1."@".$email2;
			echo "<tr>";
			echo "<td>이름</td>";
			echo "<td>휴대폰 번호</td>";
			echo "<td>주소</td>";
			echo "<td>이메일</td>";
			echo "</tr>";
			echo "<tr>";
			echo "<td>$name</td>";
			echo "<td>$phone_num</td>";
			echo "<td>$address</td>";
			echo "<td>$email</td>";
			echo "</tr>";
		?>
	</table>
</html>