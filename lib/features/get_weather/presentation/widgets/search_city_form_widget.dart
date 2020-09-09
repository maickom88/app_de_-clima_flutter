import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCityFormWidget extends StatelessWidget {
  final Function onPress;

  const SearchCityFormWidget({Key key, @required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        height: Get.height * 0.1,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.6),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Buscar por sua cidade',
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: onPress,
              color: Theme.of(context).secondaryHeaderColor,
              child: Text(
                'Procurar',
                style: GoogleFonts.openSans(),
              ),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
