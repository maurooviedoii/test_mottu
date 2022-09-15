import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      elevation: 4.0,
      child: SizedBox(
        height: 122,
        width: 50,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(
              height: 22,
            ),
            CircularProgressIndicator(
              color: Colors.red,
            ),
            SizedBox(
              height: 22,
            ),
            Text('Aguarde...'),
            SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}
