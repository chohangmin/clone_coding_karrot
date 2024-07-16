import 'package:beamer/beamer.dart';
import 'package:clone_coding_karrot/router/locations.dart';
import 'package:clone_coding_karrot/screens/auth_screen.dart';
import 'package:clone_coding_karrot/screens/home_screen.dart';
import 'package:clone_coding_karrot/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final _routerDelegates = BeamerDelegate(
  guards: [
    BeamGuard(
      pathPatterns: ['/'],
      check: (context, location) {
        return false;
      },
      beamToNamed: (context, location) => '/auth',
    ),
  ],
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      HomeLocation(),
      AuthLocation(),
    ],
  ).call,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 3), () => 100),
          builder: (context, snapshot) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 900),
              child: _splashLoadingWidget(snapshot),
            );
          }),
    );
  }
}

StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object> snapshot) {
  if (snapshot.hasError) {
    print('Error has occured.');
    return const Text('Error');
  } else if (snapshot.hasData) {
    return const KarrotApp();
  } else {
    return const SplashScreen();
  }
}

class KarrotApp extends StatelessWidget {
  const KarrotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegates,
    );
  }
}
