import 'package:flutter/material.dart';
import 'package:froot_app/content_model.dart';

class ToggleSwitch extends StatefulWidget {
  ContentType contentType;

  ToggleSwitch(this.contentType, {Key? key}) : super(key: key);

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  late ContentType selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.contentType;
  }

  @override
  Widget build(BuildContext context) {
    var selectedDecoration = BoxDecoration(
      color: Color.fromRGBO(106, 147, 191, 0.7),
    );
    var defaultDecoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromRGBO(106, 147, 191, 1)));

    var selectedTxtStyle = TextStyle(fontSize: 12, color: Colors.white);
    var defaultTxtStyle =
        TextStyle(fontSize: 12, color: Color.fromRGBO(153, 153, 153, 1));

    return selectedType == ContentType.income
        ? Container(
            width: 108,
            height: 28,
            decoration:
                BoxDecoration(color: Color.fromRGBO(118, 118, 118, 0.7)),
            alignment: Alignment.center,
            child: Text("수입",style: TextStyle(color: Colors.white, fontSize: 12),),
          )
        : SizedBox(
            width: 108,
            height: 28,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => selectedType = ContentType.consumption),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: selectedType == ContentType.consumption
                          ? selectedDecoration
                          : defaultDecoration,
                      child: Text(
                        "소비",
                        style: selectedType == ContentType.consumption
                            ? selectedTxtStyle
                            : defaultTxtStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => selectedType = ContentType.waste),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: selectedType == ContentType.waste
                          ? selectedDecoration
                          : defaultDecoration,
                      child: Text(
                        "낭비",
                        style: selectedType == ContentType.waste
                            ? selectedTxtStyle
                            : defaultTxtStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () =>
                      setState(() => selectedType = ContentType.invest),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: selectedType == ContentType.invest
                        ? selectedDecoration
                        : defaultDecoration,
                    child: Text(
                      "투자",
                      style: selectedType == ContentType.invest
                          ? selectedTxtStyle
                          : defaultTxtStyle,
                    ),
                  ),
                ))
              ],
            ),
          );
  }
}
