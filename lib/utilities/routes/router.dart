import 'package:flutter/cupertino.dart';
import 'package:flutter_steps_tracker/core/presentation/pages/landing_page.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/pages/bottom_navbar.dart';
import 'package:flutter_steps_tracker/utilities/routes/routes.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homePageRoute:
      return CupertinoPageRoute(
        builder: (_) => const BottomNavbar(),
        settings: settings,
      );
    case AppRoutes.landingPageRoute:
    default:
      return CupertinoPageRoute(
        builder: (_) => const LandingPage(),
        settings: settings,
      );
  }
}
