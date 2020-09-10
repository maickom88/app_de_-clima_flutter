import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonComponent extends StatelessWidget {
  final String nameButton;
  final Function onPress;

  const ButtonComponent({Key key, this.nameButton, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPress,
      color: Theme.of(context).secondaryHeaderColor,
      child: Text(
        nameButton,
        style: GoogleFonts.openSans(),
      ),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
