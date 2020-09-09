import 'dart:io';

import 'package:flutter/material.dart';
import 'package:xshoes/constant.dart';

import 'model/shoes.dart';

List<Shoe> getNewItem(List<Shoe> shoes){
  List<Shoe> newShoes=[];
  for(Shoe item in shoes){
    if(newShoes.length==10){
      break;
    }
    if(item.isnew){
        newShoes.add(item);
    }
  }
  return newShoes;
}
createTextField(TextEditingController controller, String label, IconData icon,
        {bool isObscure}) =>
    TextFormField(
        
        cursorColor: background,
        controller: controller,
        obscureText: isObscure ?? false,
        decoration: InputDecoration(
          focusColor: background,
            focusedBorder: UnderlineInputBorder(borderSide:BorderSide(color: background)),
            labelText: label,
            prefixIcon: Icon(icon),
            border: UnderlineInputBorder(),
            hintText: ' $label'));

String getImageUrl(String fname)=>"http://192.168.43.150/xshoes-webservice/images/$fname";
String getSimpleName(String str){
  String name='';
  str.split('').forEach((ch){
    if(name.length<18){
      name+=ch;
    }
  });
  return name;
}

emailValidator(String email) {
  if (email.contains('@')) {
    if (email.split('@')[1].contains('.')) {
      return true;
    }
  }
  return false;
}
bool isTimeOut(SocketException e) =>
    e.osError.message.contains('Connection timed out');

