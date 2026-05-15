import 'package:flutter/material.dart';

import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget{

  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late Animation<double> _fadeIn;

  Future<void> _moveToNextScreen() async {

    await Future.delayed(
        const Duration(seconds: 2), () {
      if(!mounted) return;
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

  }

  @override
  void initState(){
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fadeIn = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn
        )
    );
    _animationController.forward();
    _moveToNextScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeIn,
          child: SizedBox(
            height: 300,
            width: 300,
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKSNtO0SV6dQLSu9jci82dGEQGH9cc7foSYw&s',
            ),
          ),
        ),
      ),
    );

  }
}