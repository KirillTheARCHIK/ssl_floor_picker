import 'package:flutter/material.dart';

class FloorPickerColumn extends StatelessWidget {
  FloorPickerColumn({Key? key, this.children = const []}) : super(key: key);
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color.fromARGB(60, 99, 99, 99),
      ),
      padding: const EdgeInsets.all(3.0),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        //колонка с этажами
        children: children,
      ),
    );
  }
}
