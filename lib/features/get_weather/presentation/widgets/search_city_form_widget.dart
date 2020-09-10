import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/widgets/components.dart';

class SearchCityFormWidget extends StatelessWidget {
  final Function onPress;
  final TextEditingController textController;
  const SearchCityFormWidget({
    Key key,
    @required this.onPress,
    this.textController,
  }) : super(key: key);

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
                controller: textController,
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
            ButtonComponent(
              nameButton: 'Procurar',
              onPress: onPress,
            )
          ],
        ),
      ),
    );
  }
}
