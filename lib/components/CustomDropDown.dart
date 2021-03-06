import 'package:flutter/material.dart';
import 'package:paw/constants.dart';

class CustomDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T> onChanged;
  final T value;
  final bool isEnabled;
  final double width;
  CustomDropdown({
    Key key,
    @required this.dropdownMenuItemList,
    @required this.onChanged,
    @required this.value,
    this.width,
    this.isEnabled = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return IgnorePointer(
      ignoring: !isEnabled,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        width: width ?? size.width * 0.8,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: kBlack,
              width: 1,
            ),
            color: isEnabled ? kPrimaryColor : Colors.grey.withAlpha(100)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            itemHeight: 50.0,
            style: TextStyle(
                fontSize: 15.0,
                color: isEnabled ? Colors.black : Colors.grey[700]),
            items: dropdownMenuItemList,
            onChanged: onChanged,
            value: value,
          ),
        ),
      ),
    );
  }
}
