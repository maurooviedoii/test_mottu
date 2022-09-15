import 'package:flutter/material.dart';

class ErrorPageArguments {
  ErrorPageArguments(this.onPressed, this.error);

  final Function()? onPressed;
  final String error;
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    Key? key,
    required this.errorPageArguments,
  }) : super(key: key);

  final ErrorPageArguments errorPageArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('OOps...', style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 8,),
          Text(errorPageArguments.error, style: Theme.of(context).textTheme.subtitle1,),
          Image.asset('assets/thor_hammer.png'),
          Visibility(
              visible: errorPageArguments.onPressed != null,
              child: TextButton(
                style: ButtonStyle(overlayColor: MaterialStateProperty.all(Colors.grey)),
                onPressed: errorPageArguments.onPressed,
                child: Text(
                  'Tente novamente',
                  style: Theme.of(context).textTheme.button?.copyWith(fontSize: 18, color: Colors.red),
                ),
              )),
        ],
      ),
    );
  }
}
