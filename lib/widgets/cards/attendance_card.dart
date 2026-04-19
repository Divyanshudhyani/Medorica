import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';

class AttendanceCard extends StatelessWidget {
  final VoidCallback onCheckIn;

  const AttendanceCard({super.key, required this.onCheckIn});

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
                Text(
                  'Attendance',
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(LucideIcons.info, size: 20, color: AppColors.textSecondary),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'We capture a timestamped selfie as proof of your visit. The photo and time are stored securely and used by your organization for verification.',
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
                onPressed: onCheckIn,
                icon: const Icon(LucideIcons.camera, size: 18),
                label: const Text('Check In Now!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
