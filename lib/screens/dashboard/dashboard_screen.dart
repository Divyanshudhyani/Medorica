import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_appbar.dart';
import '../../widgets/cards/attendance_card.dart';
import '../../widgets/cards/planning_card.dart';
import '../../widgets/cards/target_card.dart';
import '../../widgets/dashboard/quick_actions_grid.dart';
import '../../widgets/dashboard/new_arrivals_carousel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(),
            const SizedBox(height: 24),
            AttendanceCard(
              onCheckIn: () => context.push('/attendance'),
            ),
            const SizedBox(height: 16),
            PlanningCard(
              onViewPlan: () => context.push('/month-plan'),
            ),
            const SizedBox(height: 16),
            const TargetCard(),
            const SizedBox(height: 24),
            const QuickActionsGrid(),
            const SizedBox(height: 32),
            const Center(
              child: NewArrivalsCarousel(),
            ),
            const SizedBox(height: 32),
            _buildBottomWatermark(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomWatermark() {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          LucideIcons.leaf,
          size: 180,
          color: Color(0x1A455A64),
        ),
        const SizedBox(height: 16),
        Text(
          'Medorica',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: const Color(0x1A455A64),
            letterSpacing: -1.5,
          ),
        ),
        Text(
          'YOUR DAILY DOSE OF HEALING',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: const Color(0x26455A64),
            letterSpacing: 1.5,
          ),
        ),
      ],
    ),
  );
}

  Widget _buildGreetingSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(LucideIcons.sun, color: AppColors.white, size: 28),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good afternoon,',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Medical Representative',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Serving healthcare, one visit at a time.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Keep pushing — every call makes a difference.',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
