import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class DcrListScreen extends StatefulWidget {
  const DcrListScreen({super.key});

  @override
  State<DcrListScreen> createState() => _DcrListScreenState();
}

class _DcrListScreenState extends State<DcrListScreen> {
  DateTime? _selectedDate;
  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildFilterSection(),
            const SizedBox(height: 12),
            Expanded(
              child: _buildAppointmentsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/create-dcr'),
        backgroundColor: AppColors.primary,
        icon: const Icon(LucideIcons.plus, color: Colors.white, size: 20),
        label: Text(
          'New Appointment',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.white),
        ),
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
            'My DCRs',
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'View and Manage Doctor Call Reports',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
          boxShadow: const [
            BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(LucideIcons.filter, size: 20, color: AppColors.textPrimary),
                const SizedBox(width: 8),
                Text(
                  'Filter DCRs',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        setState(() {
                          _selectedDate = picked;
                        });
                      }
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        color: _selectedDate != null ? AppColors.primary.withValues(alpha: 0.1) : AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _selectedDate != null ? AppColors.primary : AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(LucideIcons.calendarDays, size: 18, color: _selectedDate != null ? AppColors.primary : AppColors.textSecondary),
                          const SizedBox(height: 8),
                          Text(
                            _selectedDate != null ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}" : 'By Date',
                            style: GoogleFonts.inter(color: _selectedDate != null ? AppColors.primary : AppColors.textSecondary, fontSize: 13, fontWeight: _selectedDate != null ? FontWeight.w600 : FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: _showStatusPicker,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      decoration: BoxDecoration(
                        color: _selectedStatus != 'All' ? AppColors.primary.withValues(alpha: 0.1) : AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: _selectedStatus != 'All' ? AppColors.primary : AppColors.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(LucideIcons.loader, size: 18, color: _selectedStatus != 'All' ? AppColors.primary : AppColors.textSecondary),
                          const SizedBox(height: 8),
                          Text(
                            _selectedStatus != 'All' ? _selectedStatus : 'By Status',
                            style: GoogleFonts.inter(color: _selectedStatus != 'All' ? AppColors.primary : AppColors.textSecondary, fontSize: 13, fontWeight: _selectedStatus != 'All' ? FontWeight.w600 : FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentsList() {
    final appointments = [
      {'name': 'Dr Debasish Baidya', 'spec': 'MBBS', 'date': 'Apr 30, 2026', 'time': '6:30 PM', 'place': 'Baghajatin, Kolkata', 'status': 'Completed'},
      {'name': 'Dr sumit', 'spec': 'mbbs', 'date': 'Mar 28, 2026', 'time': '3:00 PM', 'place': 'kolkata', 'status': 'Completed'},
      {'name': 'Dr. Pritam Kayal', 'spec': 'Physiotherapy', 'date': 'Mar 19, 2026', 'time': '5:30 PM', 'place': 'Baghajatin', 'status': 'Completed'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
      itemCount: appointments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final apt = appointments[index];
        return _buildAppointmentCard(apt);
      },
    );
  }

  Widget _buildAppointmentCard(Map<String, String> data) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: data['name'] == 'Dr. Pritam Kayal'
                      ? Text('2k25', style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 10))
                      : const Icon(LucideIcons.user, color: AppColors.textSecondary, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name']!,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data['spec']!,
                        style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    data['status']!,
                    style: GoogleFonts.inter(color: Colors.green[700], fontWeight: FontWeight.w600, fontSize: 11),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.border),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(LucideIcons.calendar, size: 16, color: AppColors.textSecondary),
                          const SizedBox(width: 8),
                          Text(data['date']!, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(LucideIcons.clock, size: 16, color: AppColors.textSecondary),
                          const SizedBox(width: 8),
                          Text(data['time']!, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(LucideIcons.messageSquare, size: 16, color: AppColors.textSecondary),
                    const SizedBox(width: 8),
                    Text(data['place']!, style: GoogleFonts.inter(fontSize: 13, color: AppColors.textSecondary)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showStatusPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Status', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                const SizedBox(height: 20),
                ...['All', 'Pending', 'Ongoing', 'Cancelled', 'Completed'].map((status) {
                  return ListTile(
                    title: Text(status, style: GoogleFonts.inter(fontWeight: _selectedStatus == status ? FontWeight.bold : FontWeight.normal)),
                    trailing: _selectedStatus == status ? const Icon(Icons.check, color: AppColors.primary) : null,
                    onTap: () {
                      setState(() {
                        _selectedStatus = status;
                      });
                      Navigator.pop(context);
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
