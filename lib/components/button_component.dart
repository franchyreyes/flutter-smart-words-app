import 'package:findwords/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatefulWidget {
  final textContent;
  final VoidCallback onPressed;
  final Color color;
  ButtonComponent({@required this.textContent, @required this.onPressed,this.color});

  @override
  State<StatefulWidget> createState() => ButtonComponentState();

}

class ButtonComponentState extends State<ButtonComponent> {


  @override
  Widget build(BuildContext context) {

    if(widget.color == null ){
      return RaisedButton(
          onPressed: widget.onPressed,
          textColor: t3_white,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[t3_colorPrimary, t3_colorPrimaryDark]),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(

                  widget.textContent,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ));
    }
    else{
      return RaisedButton(
          onPressed: widget.onPressed,
          textColor: t3_colorPrimary,
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[widget.color, widget.color]),
              borderRadius: BorderRadius.all(Radius.circular(80.0)),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(

                  widget.textContent,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ));
    }

  }
}