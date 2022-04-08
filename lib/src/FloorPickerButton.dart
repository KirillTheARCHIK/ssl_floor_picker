import 'package:flutter/material.dart';

class FloorPickerButton extends StatelessWidget {
  FloorPickerButton({
    Key? key,
    this.isSelected = false,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  void Function()? onPressed;
  bool isSelected;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1),
      width: 50,
      height: 50,
      color: isSelected ? Colors.black : Color.fromARGB(95, 29, 29, 29),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
