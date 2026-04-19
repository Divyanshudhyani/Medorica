import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class CreateDcrScreen extends StatefulWidget {
  const CreateDcrScreen({super.key});

  @override
  State<CreateDcrScreen> createState() => _CreateDcrScreenState();
}

class _CreateDcrScreenState extends State<CreateDcrScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedDoctor;
  String _selectedStatus = 'Pending';
  final Set<String> _selectedAds = {};
  final TextEditingController _placeController = TextEditingController();

  final List<String> _dummyDoctors = [
    'Dr Debasish Baidya',
    'Dr sumit',
    'Dr. Pritam Kayal',
    'Dr raj dutta'
  ];

  @override
  void dispose() {
    _placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Appointment',
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: -0.5,
              ),
            ),
            Text(
              'Book an Appointment',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormCard(
                'Appointment Date',
                LucideIcons.calendarDays,
                _buildInteractiveInput(
                  _selectedDate != null ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}" : 'Select Date',
                  trailingIcon: LucideIcons.calendar,
                  isActive: _selectedDate != null,
                  onTap: _pickDate,
                ),
              ),
              const SizedBox(height: 16),
              _buildFormCard(
                'Appointment Time',
                LucideIcons.clock,
                _buildInteractiveInput(
                  _selectedTime != null ? _selectedTime!.format(context) : 'Select Time',
                  trailingIcon: LucideIcons.clock,
                  isActive: _selectedTime != null,
                  onTap: _pickTime,
                ),
              ),
              const SizedBox(height: 16),
              _buildFormCard(
                'Select Doctor',
                LucideIcons.user,
                _buildInteractiveInput(
                  _selectedDoctor ?? 'Choose a doctor',
                  trailingIcon: LucideIcons.chevronDown,
                  isActive: _selectedDoctor != null,
                  onTap: _pickDoctor,
                ),
              ),
              const SizedBox(height: 16),
              _buildFormCard(
                'Appointment Status',
                LucideIcons.squareAsterisk,
                _buildInteractiveInput(
                  _selectedStatus,
                  trailingIcon: LucideIcons.chevronDown,
                  isActive: true,
                  isBlackText: true,
                  onTap: _pickStatus,
                ),
              ),
              const SizedBox(height: 16),
              _buildFormCard(
                'Appointment Place',
                LucideIcons.messageSquare,
                _buildTextField(),
              ),
              const SizedBox(height: 16),
              _buildFormCard(
                'Select Visual Ads',
                LucideIcons.inbox,
                _buildVisualAdsGrid(),
              ),
              const SizedBox(height: 100), // Space for bottom button
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.background,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Submit logic here
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
            child: const Text('Schedule Appointment'),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(String title, IconData icon, Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: AppColors.textPrimary),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInteractiveInput(String hint, {required IconData trailingIcon, required bool isActive, bool isBlackText = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary.withValues(alpha: 0.05) : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isActive ? AppColors.primary : AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint,
              style: GoogleFonts.inter(
                color: isBlackText || isActive ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            Icon(trailingIcon, color: isActive ? AppColors.primary : AppColors.textSecondary, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _placeController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Enter appointment place...',
        hintStyle: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 14),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _pickDoctor() {
    _showSelectorSheet('Select Doctor', _dummyDoctors, (val) {
      setState(() => _selectedDoctor = val);
    }, _selectedDoctor);
  }

  void _pickStatus() {
    _showSelectorSheet('Appointment Status', ['Pending', 'Confirmed', 'Cancelled'], (val) {
      setState(() => _selectedStatus = val);
    }, _selectedStatus);
  }

  void _showSelectorSheet(String title, List<String> options, Function(String) onSelect, String? currentVal) {
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
                Text(title, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                const SizedBox(height: 16),
                ...options.map((opt) {
                  return ListTile(
                    title: Text(opt, style: GoogleFonts.inter(fontWeight: currentVal == opt ? FontWeight.bold : FontWeight.normal)),
                    trailing: currentVal == opt ? const Icon(Icons.check, color: AppColors.primary) : null,
                    onTap: () {
                      onSelect(opt);
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

  Widget _buildVisualAdsGrid() {
    final ads = [
      'MEDCLEAR', 'MEDOPED', 'CYPORICA', 'RICAHIST',
      'LIVORICA-10', 'MEDSLEEP', 'PARARICA-T', 'MEDOHEX',
      'MVMED', 'MEDCAL-500', 'RICAZYME', 'RICAPLEX-L',
      'MEDCOBAL-OD', 'GABAMED-NT', 'MEDOCOUGH-LS',
      'MLM', 'MED-D3', 'NASORICA', 'PEGRICA-20',
      'MEDOHEME-SF', 'MUPIRICA-ONT', 'LULIRICA-ONT',
      'MEDOCEF', 'MEDOHEAL', 'EVOMED-LC', 'UDIMED-300',
      'MEDCLAV-CV-625', 'CEFIRICA-XL', 'RABOMED-DSR',
      'RABOMED-DSR', 'CANMED-B LOTION', 'RICAZYME-TAB',
      'MEDOZOL-20', 'CLAVRICA-625', 'AZIRICA-500',
      'DICLORICA-HOT GEL', 'DICLORICA-SP', 'PARARICA-A',
      'MEDOPAN-40',
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 12,
      children: ads.map((ad) {
        final isSelected = _selectedAds.contains(ad);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                _selectedAds.remove(ad);
              } else {
                _selectedAds.add(ad);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.background,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: isSelected ? AppColors.primary : AppColors.textPrimary),
            ),
            child: Text(
              ad,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
