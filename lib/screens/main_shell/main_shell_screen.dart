import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/app_colors.dart';

class MainShellScreen extends StatelessWidget {
  final Widget child;

  const MainShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.border,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.userPlus),
              label: 'My Doctors',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.calendar),
              label: 'DCR',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.shoppingBag),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.store),
              label: 'Shops',
            ),
            BottomNavigationBarItem(
              icon: Icon(LucideIcons.truck),
              label: 'Distributors',
            ),
          ],
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textSecondary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          elevation: 0,
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/dashboard')) return 0;
    if (location.startsWith('/my-doctors')) return 1;
    if (location.startsWith('/dcr')) return 2;
    if (location.startsWith('/my-orders')) return 3;
    if (location.startsWith('/shops')) return 4;
    if (location.startsWith('/distributors')) return 5;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/dashboard');
        break;
      case 1:
        context.go('/my-doctors');
        break;
      case 2:
        context.go('/dcr');
        break;
      case 3:
        context.go('/my-orders');
        break;
      case 4:
        context.go('/shops');
        break;
      case 5:
        context.go('/distributors');
        break;
    }
  }
}
