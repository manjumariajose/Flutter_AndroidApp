import 'package:flutter/material.dart';
import 'package:achieveit/constants.dart';

class TextWidget extends StatelessWidget {
  TextWidget({this.text, this.onPress});
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      textColor: Colors.black54,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      onPressed: onPress,
      child: Row(
        children: <Widget>[
          Text('+'),
          SizedBox(
            width: 20.0,
          ),
          Text(
            text,
            style: kTextStyle,
          ),
        ],
      ),
    );

//      Row(
//      children: <Widget>[
//        IconButton(
//          icon: Icon(Icons.add),
//          color: Colors.black54,
//          onPressed: () {},
//        ),
//        Text(
//          text,
//          style: kDashboardButtonTextStyle,
//        ),
//      ],
//    );
  }
}
