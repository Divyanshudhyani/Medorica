import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_names.dart';
import '../screens/main_shell/main_shell_screen.dart';
import '../widgets/common/placeholder_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/doctors/my_doctors_screen.dart';
import '../screens/doctors/add_doctor_screen.dart';
import '../screens/dcr/dcr_list_screen.dart';
import '../screens/dcr/create_dcr_screen.dart';
import '../screens/orders/my_orders_screen.dart';
import '../screens/orders/create_order_screen.dart';
import '../screens/shops/shops_list_screen.dart';
import '../screens/shops/add_shop_screen.dart';
import '../screens/distributors/distributors_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            name: RouteNames.dashboard,
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/my-doctors',
            name: RouteNames.myDoctors,
            builder: (context, state) => const MyDoctorsScreen(),
          ),
          GoRoute(
            path: '/dcr',
            name: RouteNames.dcr,
            builder: (context, state) => const DcrListScreen(),
          ),
          GoRoute(
            path: '/my-orders',
            name: RouteNames.myOrders,
            builder: (context, state) => const MyOrdersScreen(),
          ),
          GoRoute(
            path: '/shops',
            name: RouteNames.shops,
            builder: (context, state) => const ShopsListScreen(),
          ),
          GoRoute(
            path: '/add-shop',
            name: RouteNames.addShop,
            builder: (context, state) => const AddShopScreen(),
          ),
          GoRoute(
            path: '/distributors',
            name: RouteNames.distributors,
            builder: (context, state) => const DistributorsScreen(),
          ),
        ],
      ),
      
      // Top level routes (no bottom nav)
      GoRoute(
        path: '/attendance',
        name: RouteNames.attendance,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Attendance'),
      ),
      GoRoute(
        path: '/month-plan',
        name: RouteNames.monthPlan,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Month Plan'),
      ),
      GoRoute(
        path: '/gifts',
        name: RouteNames.gifts,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Gifts'),
      ),
      GoRoute(
        path: '/add-doctors',
        name: RouteNames.addDoctors,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AddDoctorScreen(),
      ),
      GoRoute(
        path: '/create-dcr',
        name: RouteNames.createDcr,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreateDcrScreen(),
      ),
      GoRoute(
        path: '/create-order',
        name: RouteNames.createOrder,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreateOrderScreen(),
      ),
      GoRoute(
        path: '/visual-ads',
        name: RouteNames.visualAds,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Visual Ads'),
      ),
      GoRoute(
        path: '/my-team',
        name: RouteNames.myTeam,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'My Team'),
      ),
      GoRoute(
        path: '/salary-slip',
        name: RouteNames.salarySlip,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Salary Slip'),
      ),
      GoRoute(
        path: '/profile',
        name: RouteNames.profile,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Profile'),
      ),
      GoRoute(
        path: '/alerts',
        name: RouteNames.alerts,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const PlaceholderScreen(title: 'Alerts'),
      ),
    ],
  );
});
