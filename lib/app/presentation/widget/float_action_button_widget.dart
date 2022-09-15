import 'package:flutter/material.dart';

class FloatActionButtonWidget extends StatelessWidget {
  const FloatActionButtonWidget({Key? key, required this.iconData, required this.onPressed}) : super(key: key);

  final IconData? iconData;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12.0)),
        fixedSize: MaterialStateProperty.all<Size>(const Size(60, 60)),
        elevation: MaterialStateProperty.all<double>(4),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48.0),
          ),
        ),
      ),
      child: Icon(
        iconData,
        color: Colors.red,
      ),
    );
  }
}
