import 'package:ecommerce_app/core/common/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/test_screen.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      final isOnBoardingDone = SharedPref().getBool(PrefKeys.onBoardingDone) ?? false;

      if (!isOnBoardingDone) {
        return state.namedLocation(RouteNames.onBoarding);
      }

      if (isOnBoardingDone) {
        return state.namedLocation(RouteNames.test);
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteNames.onBoarding,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: '/test',
        name: RouteNames.test,
        builder: (context, state) => TestScreen(),
      ),
    ],
  );
}
