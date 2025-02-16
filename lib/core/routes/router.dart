import 'package:ecommerce_app/features/customer/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/customer/category/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/customer/category/presentation/screens/category_screen.dart';
import 'package:ecommerce_app/features/customer/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/customer/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/screens/wishlist_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/core/common/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/signup_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeShell');
final _categoriesNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'categoriesShell',
);
final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cartShell');
final _wishlistNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'wishlistShell',
);
final _profilerootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'profileShell',
);

class AppRouter {
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,

    initialLocation: '/home',
    // redirect: (context, state) {
    //   final isOnBoardingDone =
    //       SharedPref().getBool(PrefKeys.onBoardingDone) ?? false;

    //   if (!isOnBoardingDone) {
    //     return state.namedLocation(RouteNames.onBoarding);
    //   }

    //   if (state.matchedLocation == '/login') {
    //     return state.namedLocation(RouteNames.login);
    //   } else if (state.matchedLocation == '/signup') {
    //     return state.namedLocation(RouteNames.signup);
    //   } else if (isOnBoardingDone) {
    //     return state.namedLocation(RouteNames.signup);
    //   }

    //   return null;
    // },
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                MainScreen(navigationShell: navigationShell),

        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: RouteNames.home,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _categoriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/categories',
                name: RouteNames.categories,
                builder: (context, state) => CategoriesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _cartNavigatorKey,
            routes: [
              GoRoute(
                path: '/cart',
                name: RouteNames.cart,
                builder: (context, state) => CartScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _wishlistNavigatorKey,
            routes: [
              GoRoute(
                path: '/wishlist',
                name: RouteNames.wishlist,
                builder: (context, state) => WishlistScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _profilerootNavigatorKey,

            routes: [
              GoRoute(
                path: '/profile',
                name: RouteNames.profile,
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(path: '/', builder: (context, state) => SplashScreen()),

      GoRoute(
        path: '/onboarding',
        name: RouteNames.onBoarding,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => LoginScreen(),
      ),

      GoRoute(
        path: '/category',
        name: RouteNames.category,
        builder: (context, state) => CategoryScreen(),
      ),
    ],
  );

  GoRouter get router => _router;
}
