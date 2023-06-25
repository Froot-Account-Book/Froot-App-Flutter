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
  var selectedDecoration = BoxDecoration(
    color: Color.fromRGBO(106, 147, 191, 0.7),
  );

  static const borderColor = const Color.fromRGBO(106, 147, 191, 1);
  static const borderSide = const BorderSide(color: borderColor);

  var rightDeco = BoxDecoration(
      color: Colors.white,
      border: Border(right: borderSide, top: borderSide, bottom: borderSide));

  var middleDeco = BoxDecoration(
      color: Colors.white, border: Border.symmetric(horizontal: borderSide));

  var leftDeco = BoxDecoration(
      color: Colors.white,
      border: Border(left: borderSide, top: borderSide, bottom: borderSide));

  var selectedTxtStyle = TextStyle(fontSize: 12, color: Colors.white);
  var defaultTxtStyle =
  TextStyle(fontSize: 12, color: Color.fromRGBO(153, 153, 153, 1));

  @override
  void initState() {
    super.initState();
    selectedType = widget.contentType;
  }

  @override
  Widget build(BuildContext context) {
    return selectedType == ContentType.income
        ? Container(
            width: 108,
            height: 28,
            decoration:
                BoxDecoration(color: Color.fromRGBO(118, 118, 118, 0.7)),
            alignment: Alignment.center,
            child: Text(
              "수입",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
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
                          : leftDeco,
                      child: Text(
                        "소비",
                        style: selectedType == ContentType.consumption
                            ? selectedTxtStyle
                            : defaultTxtStyle,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  color: borderColor,
                  thickness: 1,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => selectedType = ContentType.waste),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: selectedType == ContentType.waste
                          ? selectedDecoration
                          : middleDeco,
                      child: Text(
                        "낭비",
                        style: selectedType == ContentType.waste
                            ? selectedTxtStyle
                            : defaultTxtStyle,
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 1,
                  color: borderColor,
                  thickness: 1,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () =>
                      setState(() => selectedType = ContentType.invest),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: selectedType == ContentType.invest
                        ? selectedDecoration
                        : rightDeco,
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
