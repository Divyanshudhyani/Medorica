import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  String? _selectedChemist;
  String? _selectedDoctor;
  String? _selectedDistributor;

  final TextEditingController _medNameController = TextEditingController();
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _packController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final List<String> _dummyChemists = ['Apollo Pharmacy', 'MedPlus', 'Frank Ross'];
  final List<String> _dummyDoctors = ['Dr Debasish Baidya', 'Dr sumit', 'Dr. Pritam Kayal'];
  final List<String> _dummyDistributors = ['Distributor A', 'Distributor B', 'Distributor C'];

  @override
  void dispose() {
    _medNameController.dispose();
    _qtyController.dispose();
    _packController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.primary),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Create New Order',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Select Chemist Shop'),
              _buildLabel('Chemist Shop'),
              _buildDropdown(
                hint: 'Select a chemist shop',
                value: _selectedChemist,
                onTap: () => _showSelectorSheet('Select Chemist', _dummyChemists, (val) => setState(() => _selectedChemist = val), _selectedChemist),
              ),
              const SizedBox(height: 24),

              _buildSectionTitle('Select Doctor'),
              _buildLabel('Doctor'),
              _buildDropdown(
                hint: 'Select a doctor',
                value: _selectedDoctor,
                onTap: () => _showSelectorSheet('Select Doctor', _dummyDoctors, (val) => setState(() => _selectedDoctor = val), _selectedDoctor),
              ),
              const SizedBox(height: 24),

              _buildSectionTitle('Select Distributor'),
              _buildLabel('Distributor'),
              _buildDropdown(
                hint: 'Select a distributor',
                value: _selectedDistributor,
                onTap: () => _showSelectorSheet('Select Distributor', _dummyDistributors, (val) => setState(() => _selectedDistributor = val), _selectedDistributor),
              ),
              const SizedBox(height: 32),

              _buildSectionTitle('Add Medicines'),
              _buildLabel('Medicine Name'),
              _buildTextField(hint: 'e.g., Aspirin 500mg', icon: LucideIcons.package, controller: _medNameController),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Quantity'),
                        _buildTextField(hint: 'Enter qu...', icon: LucideIcons.package, controller: _qtyController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Pack'),
                        _buildTextField(hint: 'e.g., Blist...', icon: LucideIcons.packageOpen, controller: _packController),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Total Amount'),
                        _buildTextField(hint: 'Amount ...', icon: LucideIcons.wallet, controller: _amountController),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.plus, size: 18, color: AppColors.textPrimary),
                  label: Text(
                    'Add Medicine',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.border.withValues(alpha: 0.3), // Soft grey
                    foregroundColor: AppColors.textPrimary,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),

              const SizedBox(height: 100), // Space for bottom button
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        color: AppColors.white,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              // Submit logic
            },
            icon: const Icon(Icons.add_circle_outline, size: 20),
            label: const Text('Create Order'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildDropdown({required String hint, String? value, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.border.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? hint,
              style: GoogleFonts.inter(
                color: value != null ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: value != null ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.textSecondary, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String hint, required IconData icon, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 13),
        prefixIcon: Icon(icon, color: AppColors.textSecondary, size: 18),
        filled: true,
        fillColor: AppColors.border.withValues(alpha: 0.3),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
      style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary),
    );
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
}
