import 'package:flutter/material.dart';
import 'package:xshoes/constant.dart';
import 'package:xshoes/screens/logre.dart';
import 'package:xshoes/screens/page.dart';
import 'package:xshoes/service/sharepref_service.dart';

class Profile extends StatelessWidget {
  Profile({this.isLogin,this.loginDetail});
  final bool isLogin;
  final Map loginDetail;
  List<Widget> txt=[];
  @override
  Widget build(BuildContext context) {
   if(loginDetail!=null) loginDetail.forEach((key, value) { 
      txt.add(Material(type: MaterialType.transparency,elevation: 15, child: Container(
        
        padding: EdgeInsets.all(20),child: Text('$value',style: TextStyle(color: secodaryGreyActive,fontWeight: FontWeight.w600),),)));

    });
    return (isLogin) ? Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(top:50,left: 5,right: 5),
          child: Column(
            children:[
              Align(
                alignment:FractionalOffset.bottomCenter,
                child: Transform.scale(
                  scale: 2,
                              child: CircleAvatar(backgroundImage:NetworkImage(
                    
                    'https://i2.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?fit=256%2C256&quality=100&ssl=1')),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,children:txt)
          ]),
        ),
        InkWell(
          onTap: ()=>logout(context),
                            child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.redAccent[100].withOpacity(0.4),
                    height: 50,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Text('logout',style: TextStyle(color: Colors.redAccent[100],fontSize: 16,fontWeight: FontWeight.w500),),
                        Icon(Icons.exit_to_app,color: Colors.redAccent[100],)
                     ],)
                    ),
                  )
                ],
              ) : LoginAndRegister();
            }
          
            logout(BuildContext ctx) async{
                await SFService().removeSaveLogin();
               Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder:(ctx)=>PageContainer(page: 1,)));
            }
}
