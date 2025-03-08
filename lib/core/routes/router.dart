import 'package:ecommerce_app/features/customer/category/presentation/screens/category_products_list_screen.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/core/common/screens/products_list_screen.dart';
import 'package:ecommerce_app/core/common/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/customer/category/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/customer/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/customer/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/screens/product_details.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/features/customer/wishlist/presentation/screens/wishlist_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeShell');
final _categoriesNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'categoriesShell',
);
final _cartNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cartShell');
final _wishlistNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'wishlistShell',
);
final _profileNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'profileShell',
);

class AppRouter {
  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/',
    redirect: (context, state) {
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;
      final currentLocation = state.matchedLocation;

      // Handle splash screen redirection
      if (currentLocation == '/') {
        if (authState is AuthInitial || authState is AuthLoading) {
          // Let splash screen stay while checking auth
          return '/';
        }

        if (authState is AuthLoggedIn) {
          // Redirect based on user role
          return '/home';
        }
        if (authState is AuthLoggedOut) {
          // Redirect to onboarding if not authenticated
          return '/onboarding';
        }
      }

      // Prevent logged-in users from accessing onboarding
      if ((authState is AuthSuccess || authState is AuthLoggedIn) &&
          currentLocation == '/onboarding') {
        return '/home';
        // return authState.user.role == 'admin' ? '/admin-home' : '/home';
      }

      // Prevent unauthenticated users from accessing protected routes
      // if (authState is! AuthSuccess &&
      //     (currentLocation == '/home' || currentLocation == '/admin-home')) {
      //   return '/onboarding';
      // }

      return null;
    },
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
            navigatorKey: _profileNavigatorKey,

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
      GoRoute(path: '/', builder: (context, routeState) => SplashScreen()),
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
        path: '/products-list/:title',
        name: RouteNames.productsList,
        builder: (context, state) {
          final title = state.pathParameters['title'] ?? 'Items';

          return ProductsListScreen(title: title);
        },
      ),
      GoRoute(
        path: '/category-products-list/:id/:title',
        name: RouteNames.categoryProductsList,
        builder: (context, state) {
          final title = state.pathParameters['title'] ?? 'Items';
          final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;

          return CategoryProductsListScreen(title: title, id: id);
        },
      ),

      GoRoute(
        path: '/product-details',
        name: RouteNames.productDetails,
        builder: (context, state) {
          return ProductDetails();
        },
      ),
    ],
  );

  GoRouter get router => _router;
}
