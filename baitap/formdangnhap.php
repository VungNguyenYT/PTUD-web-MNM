<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phân loại và Kiểm tra biển số đẹp</title>
</head>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>--oO sachhay.com Oo--</title>
<link rel="stylesheet" type="text/css" href="css.css" />
</head>

<body bgcolor="#999999">
<center>
<table width="1000" border="1" cellspacing="0" bordercolor="#003300" cellpadding="0" style="box-shadow: #6C0 0px 30px 150px;">
    <tr>
    	<td colspan="3" height="200" background="hinhanh/sachhay_new1.gif"></td>
    </tr>
    <tr  bgcolor="#92D84E">
    	<td colspan="3">
        	<table border="0" width="100%" cellpadding="0" cellspacing="0">
            	<tr>
                	<td width="80"><a id="thuong" href="./">Trang chủ</a></td>
                    <td><font color="#FF6600"><marquee>Cùng bạn đi tìm tri thức!</marquee></font></td>
             </tr>
            </table>
        </td>
    </tr>
    <tr >
    	<td width="200" align="left" valign="top" bgcolor="#92D84E">
        	<table border="1" cellspacing="0" width="100%" cellpadding="0" bordercolor="#003300">
            	<tr>
                	<th><font color="#FF6600">Bài tập PHP căn bản</font></th>
                </tr>
                <tr>
                    <td><a href="baitap/formdangnhap.php">BT1 - Máy tính</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT2 - Giải PT bậc I một ẩn</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT3 - Giải PT bậc II một ẩn</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT4 - Tính diện tích</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT5 - Tam giác</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT6 - Số ngày trong tháng</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT7 - Bảng cửu chương</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT8 - Bảng cửu chương NC</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT9 - Số nguyên tố</a></td>
                </tr>
                <tr>
                    <td><a href="#">BT10 - Ngày tháng hiện tại</a></td>
                </tr>
                 <tr>
                    <td><a href="#">BT11 - Biển số xe đẹp</a></td>
                </tr>
                
                <tr>
                	<th><font color="#FF6600">Bài tập PHP-MySQL</font></th>
                </tr>
                <tr>
                    <td><a href="#">Đăng ký thành viên</a></td>
                </tr>
                <tr>
                    <td><a href="#">Chat với bạn bè</a></td>
                </tr>
                <tr>
                    <td><a href="#">Tải sản phẩm miễn phí</a></td>
                </tr>
                <tr>
                    <td><a href="#">Quản trị</a></td>
                </tr>        
                <tr>
                	<th><font color="#FF6600">Bài tập PHP nâng cao</font></th>
                </tr>
                <tr>
                	<td><a href="#" target="_new">Đọc file trên Web</a></td>
                </tr>
                <tr>
                	<td><a href="#">Đọc/ghi nội dung file với PHP</a></td>
                </tr>               
            </table>
        </td>
        <td valign="top" bgcolor="#FFFFFF">

    <h1>Nhập biển số xe để phân loại</h1>
    
    <!-- Form nhập biển số xe -->
    <form method="POST" action="">
        <label for="bienSo">Biển số xe (4 chữ số):</label>
        <input type="text" id="bienSo" name="bienSo" maxlength="4" pattern="\d{4}" required>
        <button type="submit">Phân loại</button>
    </form>

    <?php
    // Hàm tính tổng các chữ số trong biển số
    function tongCacChuSo($bienSo) {
        $tong = 0;
        // Duyệt qua từng ký tự trong biển số
        for ($i = 0; $i < strlen($bienSo); $i++) {
            if (is_numeric($bienSo[$i])) {
                $tong += intval($bienSo[$i]);
            }
        }
        return $tong;
    }


    // Hàm kiểm tra xem biển số có phải là dãy số giống nhau
    function kiemTraSoGiongNhau($bienSo) {
        $firstDigit = '';
        for ($i = 0; $i < strlen($bienSo); $i++) {
            if (is_numeric($bienSo[$i])) {
                if ($firstDigit == '') {
                    $firstDigit = $bienSo[$i];
                } elseif ($bienSo[$i] != $firstDigit) {
                    return false;
                }
            }
        }
        return true;
    }

    function phanLoaiXe($bienSo) {
        $tong = tongCacChuSo($bienSo);

        // Nếu tổng là số lẻ thì là xe tốt
        if ($tong == 9) {
            return "Biển số xe đẹp";
        }

        // Kiểm tra các quy tắc cho xe đẹp
        if (kiemTraSoGiongNhau($bienSo)) {
            return "Biển số xe đẹp";
        }
    }
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $bienSo = $_POST['bienSo'];

        if (preg_match('/^\d{4}$/', $bienSo)) {
            $loaiXe = phanLoaiXe($bienSo);
            // Hiển thị kết quả
            echo "<h2>Kết quả:</h2>";
            echo "<p>Biển số xe $bienSo thuộc loại: $loaiXe</p>";
            
        }
}

    ?>
</td>
<td width="200" valign="top"  bgcolor="#92D84E">	
            <form action="xly_dangnhap.php" name="frmDN" method="post" >
            <table cellpadding="0" cellspacing="0">
            <tr>
            	<th colspan="2"><font color="#ff6600">Đăng nhập</font></th>
             </tr>
             <tr>
                <td>Tân đăng nhập:</td>
                <td><input type="text" name="txtTDNhap" size="12" /></td>
            </tr>
            <tr>
            	<td>Mật khẩu:</td>
                <td><input type="password" name="pswMKhau" size="12" /></td>
            </tr>
            <tr>
            	<td><input type="submit" name="sbmDN" value="Đăng nhập" /></td>
                <td><input type="reset" name="rsHB" value="Hủy bỏ" /></td>
            </tr>
            </table>
            </form>
<table border="1" cellspacing="0" width="100%" cellpadding="0" bordercolor="#003300">
            	<tr>
                	<th><font color="#FF6600">Bài tập giáo trình</font></th>
                </tr>
                <tr>
                    <td><a href="kiem tra so.php">BT - Kiểm tra số</a></td>
                </tr>
                <tr>
                    <td><a href="BT_chuoingaunhien.php">BT - Lấy chuỗi ngẫu nhiên</a></td>
               </tr>
               <tr>
                    <td><a href="BT_kytungaunhien.php">BT - Lấy ký tự ngẫu nhiên</a></td>
               </tr>
               <tr>
               
                   <td><a href="docchuoi_xuatchuoi.php">Đọc chuỗi ký tự</a></td>
                </tr>
                </tr>
            </table>
        </td>
    </tr>
    <tr  bgcolor="#92D84E">
    	<td colspan="3" align="center">
        	CopyRight&copy; sachhay.com <br />
            Design by TrucMaiPham
        </td>
    </tr>
</table>
</center>
</body>
</html>