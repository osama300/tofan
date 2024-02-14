import 'package:tofan/app/archive/ui/screens/archive_screen.dart';
import 'package:tofan/app/home/ui/screen/home_screen.dart';
import 'package:tofan/app/quiz/screen/quiz_screen.dart';
import 'package:tofan/app/splash/screen/splash_screen.dart';
import 'package:tofan/core/routes/routes.dart';
import 'package:flutter/material.dart';

enum SlideDirection { top, bottom, left, right, none }

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    final data = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return createPageRoute(
          page: const SplashScreen(),
          slideDirection: SlideDirection.none,
        );

      case Routes.home:
        return createPageRoute(
          page: const HomeScreen(),
          slideDirection: SlideDirection.none,
        );

      case Routes.archive:
        return createPageRoute(
          page: ArchiveScreen(data: data ?? ''),
          slideDirection: SlideDirection.bottom,
        );

      case Routes.quiz:
        return createPageRoute(
          page: const QuizScreen(),
          slideDirection: SlideDirection.none,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Unknown Route: ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route createPageRoute({
    required Widget page,
    required SlideDirection slideDirection,
  }) {
    Offset beginOffset = _getBeginOffset(slideDirection);
    Offset endOffset = Offset.zero;
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          page,
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        var tween = Tween(begin: beginOffset, end: endOffset)
            .chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  static Offset _getBeginOffset(SlideDirection slideDirection) {
    switch (slideDirection) {
      case SlideDirection.top:
        return const Offset(0.0, -1.0);
      case SlideDirection.bottom:
        return const Offset(0.0, 1.0);
      case SlideDirection.left:
        return const Offset(-1.0, 0.0);
      case SlideDirection.right:
        return const Offset(1.0, 0.0);
      case SlideDirection.none:
        return Offset.zero; // No offset for 'none'
    }
  }
}
