import 'package:flutter/material.dart';
import 'labour_rate_calculaor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Center(child: Text('Property Business',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
          Spacer(),
          Divider(),
          FlatButton(onPressed: () {
//            Navigator.of(context).push(routeName);
          }, child: Text('Construction Cost')),
          Divider(),
          FlatButton(onPressed: () {}, child: Text('Comission Calculator')),
          Divider(),
          FlatButton(onPressed: () {}, child: Text('Tip Calculator')),
          Divider(),
          Spacer(),
          Center(child: Text('Sigma-One Technolgies',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold ),))
          
        ],
      ),
    );
  }
}
