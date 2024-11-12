<?php
include("header.php");
?>
 
<?php
include("ketnoi.php");
$sql = "select* from sach";
$kq = mysqli_query($fcn,$sql);
echo("<table border='0' width='100%'>"); $i=0;
while($row=mysqli_fetch_array($kq)){
    if($i%2==0)
        echo("<tr>");
    echo("<td><img src='".$row["HINH_SACH"]."' width='90' height='90'> </td>");
    echo("<td> Tên sách:".$row["TEN_SACH"]."<br> Tác giả:".$row["TAC_GIA"]."<br> </td>");
    if($i%2!=0)
        echo("</tr>");
    $i++;
}
echo("</table>");
?>

<?php
include("footer.php");
?>