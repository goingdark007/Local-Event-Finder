import 'package:flutter/material.dart';
import 'package:of26_local_event_finder_app/data/services/event_service.dart';
import 'package:of26_local_event_finder_app/presentation/providers/event_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/events/event_details.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

void main() {

  final EventService eventService = EventService();

  runApp(
      ChangeNotifierProvider(
        create: (context) => EventProvider(eventService),
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Event Finder',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.white,
          centerTitle: false
        )
      ),
      initialRoute:  SplashScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        HomeScreen.routeName : (context) => const HomeScreen(),
        EventDetails.routeName : (context) => const EventDetails()
      },
    );
  }
}

