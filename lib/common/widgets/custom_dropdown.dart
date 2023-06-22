import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../commons.dart';

class AppDropDownButton<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> dropdownMenuItemList;
  final ValueChanged<T> onChanged;
  final T value;
  final bool isEnabled;
  final bool isBorder;
  final double radius;
  final TextStyle? textStyle;
  final Color? color;
  final Widget? icon;

  const AppDropDownButton({
    Key? key,
    required this.dropdownMenuItemList,
    required this.onChanged,
    required this.value,
    this.isEnabled = true,
    this.isBorder = false,
    this.radius = 10.0,
    this.textStyle,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  _AppDropDownButtonState createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            border: widget.isBorder
                ? Border.all(
              color: Colors.grey,
              width: 0,
            )
                : Border(),
            color: widget.isEnabled
                ? (widget.color ?? primaryColor)
                : lightPrimaryColor),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            itemHeight: 50.0,
            style: (widget.textStyle ?? normalText).copyWith(
                color:
                widget.isEnabled ? primaryColor : Colors.grey),
            items: widget.dropdownMenuItemList,
            onChanged: widget.onChanged,
            value: widget.value,
            dropdownColor: whiteColor,
            iconEnabledColor: Colors.grey,
            icon: widget.icon ?? Icon(Icons.arrow_drop_down),
          ),
        ),
      ),
    );
  }
}

customDropDown() {
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  final _formKey = GlobalKey<FormBuilderFieldState>();
  return FormBuilderDropdown<String>(
    key: _formKey,
  name: 'gender',
  decoration: InputDecoration(
    labelText: 'Gender',
    suffix: IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        _formKey.currentState!.reset();
      },
    ),
    hintText: 'Select Gender',
  ),
  items: genderOptions
      .map((gender) => DropdownMenuItem(
    alignment: AlignmentDirectional.center,
    value: gender,
    child: Text(gender),
  ))
      .toList(),
);
}