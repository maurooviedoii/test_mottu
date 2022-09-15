import 'package:flutter/material.dart';

import '../../core/route/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _updateIsVisible();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 1000),
          child: Image.asset(
            "assets/img.png",
            width: 200,
            height: 200,
          ),
          onEnd: () {
            _navigateToHomePage(context);
          },
        ),
      ),
    );
  }

  void _updateIsVisible() {
    Future.delayed(
      const Duration(milliseconds: 500),
      () => setState(
        () {
          _isVisible = !_isVisible;
        },
      ),
    );
  }

  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }
}
