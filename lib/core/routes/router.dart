import 'package:flutter/material.dart' show GlobalKey, NavigatorState, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ecommerce_app/core/common/screens/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/core/common/screens/splash/splash_screen.dart';
import 'package:ecommerce_app/core/di/init_dependencies.dart';
import 'package:ecommerce_app/core/routes/route_names.dart';
import 'package:ecommerce_app/core/services/shared_pref/pref_keys.dart';
import 'package:ecommerce_app/core/services/shared_pref/shared_pref.dart';
import 'package:ecommerce_app/features/admin/home/presentation/screen/admin_home_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:ecommerce_app/features/customer/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app/features/customer/category/presentation/blocs/get_products_by_category_bloc/get_products_by_category_bloc.dart';
import 'package:ecommerce_app/features/customer/category/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/customer/category/presentation/screens/category_products_list_screen.dart';
import 'package:ecommerce_app/features/customer/checkout/presentation/screens/checkout_screen.dart';
import 'package:ecommerce_app/features/customer/checkout/presentation/screens/order_success_screen.dart';
import 'package:ecommerce_app/features/customer/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/customer/home/presentation/screens/latest_products_list_screen.dart';
import 'package:ecommerce_app/features/customer/main/presentation/screens/main_screen.dart';
import 'package:ecommerce_app/features/customer/product_details/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/customer/product_details/presentation/screens/product_details.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/change_password_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/order_history_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/payment_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/profile_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/shipping_screen.dart';
import 'package:ecommerce_app/features/customer/profile/presentation/screens/support_and_info_screen.dart';
import 'package:ecommerce_app/features/customer/search/presentation/screens/search_screen.dart';
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
      final userRole = SharedPref().getString(PrefKeys.userRole);
      final currentLocation = state.matchedLocation;

      // Handle splash screen redirection
      if (currentLocation == '/') {
        if (authState is AuthInitial || authState is AuthLoading) {
          // Let splash screen stay while checking auth
          return '/';
        } else if (authState is AuthLoggedIn) {
          // Redirect based on user role
          return userRole == 'admin' ? '/admin-home' : '/home';
        } else if (authState is AuthLoggedOut) {
          // Redirect to onboarding if not authenticated
          return '/onboarding';
        } else {
          return userRole == 'admin' ? '/admin-home' : '/home';
        }
      }

      // Prevent logged-in users from accessing onboarding
      if ((authState is AuthSuccess || authState is AuthLoggedIn) &&
          currentLocation == '/onboarding') {
        return userRole == 'admin' ? '/admin-home' : '/home';
      }

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
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _categoriesNavigatorKey,
            routes: [
              GoRoute(
                path: '/categories',
                name: RouteNames.categories,
                builder: (context, state) => const CategoriesScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _cartNavigatorKey,
            routes: [
              GoRoute(
                path: '/cart',
                name: RouteNames.cart,
                builder: (context, state) => const CartScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _wishlistNavigatorKey,
            routes: [
              GoRoute(
                path: '/wishlist',
                name: RouteNames.wishlist,
                builder: (context, state) => const WishlistScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: RouteNames.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(path: '/', builder: (context, routeState) => const SplashScreen()),

      GoRoute(
        path: '/onboarding',
        name: RouteNames.onBoarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) => const SignupScreen(),
      ),

      GoRoute(
        path: '/login',
        name: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),

      GoRoute(
        path: '/products-list/:title',
        name: RouteNames.productsList,
        builder: (context, state) {
          final title = state.pathParameters['title'] ?? 'Items';
          final products = state.extra as List<ProductEntity>;

          return LatestProductsListScreen(title: title, products: products);
        },
      ),

      GoRoute(
        path: '/category-products-list/:id/:title',
        name: RouteNames.categoryProductsList,
        builder: (context, state) {
          final title = state.pathParameters['title'] ?? 'Items';
          final id = int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;

          return BlocProvider(
            create: (context) => sl<GetProductsByCategoryBloc>(),
            child: CategoryProductsListScreen(title: title, id: id),
          );
        },
      ),

      GoRoute(
        path: '/product-details',
        name: RouteNames.productDetails,
        builder: (context, state) {
          final product = state.extra as ProductEntity;
          return ProductDetails(product: product);
        },
      ),

      GoRoute(
        path: '/search',
        name: RouteNames.search,
        builder: (context, state) => const SearchScreen(),
      ),

      GoRoute(
        path: '/checkout',
        name: RouteNames.checkout,
        builder: (context, state) => const CheckoutScreen(),
      ),

      GoRoute(
        path: '/shipping',
        name: RouteNames.shipping,
        builder: (context, state) => const ShippingScreen(),
      ),

      GoRoute(
        path: '/payment',
        name: RouteNames.payment,
        builder: (context, state) => const PaymentScreen(),
      ),

      GoRoute(
        path: '/order-success',
        name: RouteNames.orderSuccess,
        builder: (context, state) => const OrderSuccessScreen(),
      ),

      GoRoute(
        path: '/support-and-info/:title',
        name: RouteNames.support,
        builder: (context, state) {
          final title = state.pathParameters['title'] as String;
          final widgets = state.extra as List<Widget>;

          return SupportAndInfoScreen(title: title, widgets: widgets);
        },
      ),

      GoRoute(
        path: '/change-password',
        name: RouteNames.changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),

      GoRoute(
        path: '/order-history',
        name: RouteNames.orderHistory,
        builder: (context, state) => const OrderHistoryScreen(),
      ),

      GoRoute(
        path: '/admin-home',
        name: RouteNames.adminHome,
        builder: (context, state) => const AdminHomeScreen(),
      ),
    ],
  );

  GoRouter get router => _router;
}
