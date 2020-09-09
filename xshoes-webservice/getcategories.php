<?php 
include 'connection.php';
include 'util.php';
$var=$_SERVER['REQUEST_METHOD'];
if($var=='GET'){
    $res=Array();
    $res['categories']=Array();
        $q="SELECT catname FROM `category`";
        if($result=$connect->query($q)){
            $res['result']=1;
            while($data=$result->fetch_assoc()){
                array_push($res['categories'],$data['catname']);
               
                
            }
            echo json_encode($res);
        }else{
            $res['result']=0;
            echo json_encode($res);;
        }
    
}
?>