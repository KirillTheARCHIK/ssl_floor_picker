import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:ssl_floor_picker/src/Floor.dart';
import 'package:ssl_floor_picker/src/FloorPickerButton.dart';
import 'package:ssl_floor_picker/src/FloorPickerColumn.dart';

class FloorPickerWidget extends StatefulWidget {
  List<dynamic> floors = [];
  int selectedFloorIndex = 0;
  void Function(int)? setSelectedFloorIndex;
  String selectedMode = 'I';
  void Function(String)? setSelectedMode;

  FloorPickerWidget({
    Key? key,
    this.floors = const [],
    this.selectedFloorIndex = 0,
    this.setSelectedFloorIndex,
    this.selectedMode = 'I',
    this.setSelectedMode,
  }) : super(key: key);

  @override
  State<FloorPickerWidget> createState() => _FloorPickerWidgetState();
}

class _FloorPickerWidgetState extends State<FloorPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //общая колонка
      children: [
        FloorPickerColumn(
          //колонка с выбором этажа
          children: [
            ...widget.floors.reversed
                .map(
                  (e) => Container(
                    margin: EdgeInsets.only(top: 1),
                    width: 50,
                    height: 50,
                    color: e.id == widget.selectedFloorIndex
                        ? Colors.black
                        : Color.fromARGB(95, 29, 29, 29),
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        if (widget.setSelectedFloorIndex != null)
                          widget
                              .setSelectedFloorIndex!(widget.floors.indexOf(e));
                      },
                      child: Center(
                        child: Text(
                          e.name,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
        FloorPickerColumn(
          //колонка с выбором режима
          children: [
            FloorPickerButton(
              text: 'I',
              onPressed: () {
                if (widget.setSelectedMode != null)
                  widget.setSelectedMode!('I');
                else
                  setState(() {
                    widget.selectedMode = 'I';
                  });
              },
              isSelected: widget.selectedMode == 'I',
            ),
            FloorPickerButton(
              text: 'O',
              onPressed: () {
                if (widget.setSelectedMode != null)
                  widget.setSelectedMode!('O');
                else
                  setState(() {
                    widget.selectedMode = 'O';
                  });
              },
              isSelected: widget.selectedMode == 'O',
            ),
          ],
        ),
      ],
    );
  }
}
