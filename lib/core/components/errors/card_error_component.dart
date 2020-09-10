import 'package:app_de_clima/core/components/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardErrorComponent extends StatelessWidget {
  final String messege;
  final String description;
  final Function onPress;

  const CardErrorComponent({
    Key key,
    this.messege,
    this.description,
    this.onPress,
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            messege ?? '404',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              height: 0.9,
              color: Colors.grey,
              fontSize: messege == null || messege.isEmpty ? 80 : 40,
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
          Visibility(
            visible: messege != null,
            child: ButtonComponent(
              nameButton: 'Permitir acesso a localização',
              onPress: onPress ?? () {},
            ),
          )
        ],
      ),
    );
  }
}
