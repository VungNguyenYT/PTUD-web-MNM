<?php
include("header.php");
?>
 
<?php
include("ketnoi.php");
$sql = "select* from sach";
$kq = mysqli_query($sfcn,$sql);
echo("<table border='0' width='100%'>");
while($row=mysqli_fetch_array($kq)){
    echo("<tr>");
    echo("<td><img src='".$row["hinhsach"]."' width='90' height='90'> </td>");
    echo("<td> Tên sách:".$row["tensach"]."<br> Tác giả:".$row["tacgia"]."<br> </td>");
    echo("</tr>");
}
echo("</table>");
?>

<?php
include("footer.php");
?>