/*
 * @Author: ZY 
 * @Date: 2020-08-26 15:09:21 
 * @Last Modified by: ZY
 * @Last Modified time: 2020-08-26 15:11:53
 */

library loading_button;

import 'package:flutter/material.dart';

enum ButtonState { Normal, Loading }

class LoadingButton extends StatefulWidget {
  final String btnTitle;
  final ButtonState btnState;
  final VoidCallback onPressed;
  final Color backgroudColor;

  LoadingButton(
      {Key key,
      this.btnTitle,
      this.btnState,
      this.onPressed,
      this.backgroudColor})
      : assert(btnTitle != null, backgroudColor != null),
        super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
                color: widget.backgroudColor,
                textColor: Colors.white,
                onPressed: () {
                  if (widget.btnState == ButtonState.Normal) {
                    this.widget.onPressed();
                  }
                },
                child: statusWidget(widget.btnState)),
          )
        ],
      ),
    );
  }

  Widget statusWidget(ButtonState state) {
    if (state == ButtonState.Normal) {
      return Text(
        widget.btnTitle,
        style: TextStyle(fontSize: 16),
      );
    } else {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
  }
}
