import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class PlanningCard extends StatelessWidget {
  final VoidCallback onViewPlan;

  const PlanningCard({super.key, required this.onViewPlan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.border.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(LucideIcons.calendar, size: 20, color: AppColors.textPrimary),
                ),
                const SizedBox(width: 12),
                Text(
                  'Monthly Planning',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Plan your month effectively by organizing daily visits, DCRs, and tasks. Stay on top of your schedule and achieve your monthly targets.',
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onViewPlan,
                icon: const Icon(LucideIcons.eye, size: 18),
                label: const Text('View Plan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
