import 'package:flutter/material.dart';

class DrawerOptions extends StatelessWidget {
 
 final Icon icon;
 final String title;
 final Function onTap;
 
 DrawerOptions({this.icon, this.title, this.onTap});
 
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: icon,
     title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
     onTap: onTap,
    );
  }
}
