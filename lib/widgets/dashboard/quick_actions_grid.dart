import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 8, // Reduced vertical spacing between items
          crossAxisSpacing: 12,
          childAspectRatio: 0.8, // Adjusted aspect ratio for better balance
          children: [
            _buildActionItem(context, 'Month Plan', LucideIcons.calendarClock, '/month-plan'),
            _buildActionItem(context, 'Gifts', LucideIcons.gift, '/gifts'),
            _buildActionItem(context, 'Add Doctors', LucideIcons.userPlus, '/add-doctors'),
            _buildActionItem(context, 'Visual Ads', LucideIcons.image, '/visual-ads'),
            _buildActionItem(context, 'My Team', LucideIcons.users, '/my-team'),
            _buildActionItem(context, 'Salary Slip', LucideIcons.fileText, '/salary-slip'),
            _buildActionItem(context, 'Chemists', LucideIcons.store, '/shops'), // Route to shops screen
            _buildActionItem(context, 'Attendance', LucideIcons.calendarCheck, '/attendance'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionItem(BuildContext context, String label, IconData icon, String route) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
