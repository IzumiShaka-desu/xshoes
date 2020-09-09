<?php 
include 'connection.php';
include 'util.php';
$var=$_SERVER['REQUEST_METHOD'];
if($var=='GET'){
    $res=Array();
    $res['shoes']=Array();
        $q="SELECT product.id,product.brand,product.seriesname,product.detail,product.varian,product.stock,product.size,product.isnew,category.catname FROM `product` INNER Join category ON product.idCat = category.idCat";
        if($result=$connect->query($q)){
            $res['result']=1;
            while($data=$result->fetch_assoc()){
                $data['varian']=json_decode($data['varian']);
                array_push($res['shoes'],$data);
               
                
            }
            echo json_encode($res);
        }else{
            $res['result']=0;
            echo json_encode($res);;
        }
    
}
?>