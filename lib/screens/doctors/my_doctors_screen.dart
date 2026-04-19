import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class MyDoctorsScreen extends StatefulWidget {
  const MyDoctorsScreen({super.key});

  @override
  State<MyDoctorsScreen> createState() => _MyDoctorsScreenState();
}

class _MyDoctorsScreenState extends State<MyDoctorsScreen> {
  final List<String> _specializations = const [
    'All Specializations',
    'Physiotherapy',
    'MBBS',
    'Cardiology',
    'Dermatology',
    'Pediatrics',
    'Orthopedics',
  ];

  String _selectedSpecialization = 'All Specializations';

  void _onSpecializationSelected(String? value) {
    if (value != null) {
      setState(() {
        _selectedSpecialization = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchAndFilter(),
            Expanded(
              child: _buildDoctorsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-doctors'),
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(LucideIcons.plus, color: Colors.white, size: 28),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Doctors',
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'List of doctors you manage',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search doctors by name or specialization',
              hintStyle: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 14),
              prefixIcon: const Icon(LucideIcons.search, color: AppColors.textSecondary, size: 20),
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _selectedSpecialization,
            items: _specializations
                .map((spec) => DropdownMenuItem(
                      value: spec,
                      child: Text(
                        spec,
                        style: GoogleFonts.inter(color: AppColors.textPrimary, fontSize: 14),
                      ),
                    ))
                .toList(),
            onChanged: _onSpecializationSelected,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              filled: true,
              fillColor: AppColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorsList() {
    // Dummy data matching screenshot
    final doctors = [
      {'name': 'Dr. Pritam Kayal', 'spec': 'Physiotherapy', 'prefix': '2k25', 'desc': '23'},
      {'name': 'Dr sumit', 'spec': 'mbbs', 'prefix': 'icon'},
      {'name': 'Dr Debasish Baidya', 'spec': 'MBBS', 'prefix': 'icon'},
      {'name': 'Dr raj dutta', 'spec': 'mbbs', 'prefix': 'icon'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
      itemCount: doctors.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final doc = doctors[index];
        return _buildDoctorCard(doc['name']!, doc['spec']!, doc['prefix']!, doc['desc']);
      },
    );
  }

  Widget _buildDoctorCard(String name, String spec, String prefixType, String? desc) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(color: Color(0x05000000), blurRadius: 8, offset: Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          // Left Icon/Prefix Box
          Container(
            width: 80,
            height: 90,
            decoration: BoxDecoration(
              // According to screenshot, "icon" variants have a grey block
              color: prefixType == 'icon' ? AppColors.border.withValues(alpha: 0.8) : Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Center(
              child: prefixType == 'icon'
                  ? const Icon(LucideIcons.user, color: AppColors.primary, size: 28)
                  : Text(
                      prefixType,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 16),
          // Info Center
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  spec,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                if (desc != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: AppColors.border.withValues(alpha: 0.8), // Faint grey like screenshot? Actually it looks like textSecondary too
                    ),
                  )
                ]
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(LucideIcons.chevronRight, color: AppColors.textSecondary, size: 20),
          ),
        ],
      ),
    );
  }
}
