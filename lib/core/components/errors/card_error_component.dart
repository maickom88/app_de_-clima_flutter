import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardErrorComponent extends StatelessWidget {
  final String messege;
  final String description;

  const CardErrorComponent({
    Key key,
    this.messege,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: Get.height * 0.5,
      decoration: BoxDecoration(
        color: Color(0xff323544),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            messege ?? '404',
            style: GoogleFonts.openSans(
              color: Colors.grey,
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            description ?? 'Error ao buscar por essa cidade',
            style: GoogleFonts.openSans(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
