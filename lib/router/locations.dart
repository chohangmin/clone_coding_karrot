import 'package:beamer/beamer.dart';
import 'package:clone_coding_karrot/screens/auth_screen.dart';
import 'package:clone_coding_karrot/screens/home_screen.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    // TODO: implement buildPages
    return [const BeamPage(child: HomeScreen(), key: ValueKey('home'))];
  }

  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => ['/'];
}

class AuthLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    // TODO: implement buildPages
    return [const BeamPage(child: AuthScreen(), key: ValueKey('auth'))];
  }

  @override
  // TODO: implement pathPatterns
  List<Pattern> get pathPatterns => ['/auth'];

}
