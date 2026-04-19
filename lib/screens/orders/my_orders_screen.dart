import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  String _selectedStatus = 'All Orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearch(),
            const SizedBox(height: 12),
            Expanded(
              child: _buildOrdersList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/create-order'),
        backgroundColor: AppColors.primary,
        icon: const Icon(LucideIcons.plus, color: Colors.white, size: 20),
        label: Text(
          'New Order',
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
            'My Orders',
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Track your orders',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search orders...',
                hintStyle: GoogleFonts.inter(color: AppColors.textSecondary, fontSize: 14),
                prefixIcon: const Icon(LucideIcons.search, color: AppColors.textSecondary, size: 20),
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
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
          ),
          const SizedBox(width: 12),
          InkWell(
            onTap: _showStatusPicker,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _selectedStatus != 'All Orders' ? AppColors.primary.withValues(alpha: 0.1) : AppColors.white,
                border: Border.all(color: _selectedStatus != 'All Orders' ? AppColors.primary : AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                LucideIcons.slidersHorizontal, 
                color: _selectedStatus != 'All Orders' ? AppColors.primary : AppColors.textSecondary, 
                size: 20
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    final allOrders = [
      {'id': 'MR6289398298-ORD-20260319082511-B12FFD', 'status': 'APPROVED', 'shop': '-', 'dist': '-'},
      {'id': 'MR6289398298-ORD-20260319115834-99C8AB', 'status': 'PENDING', 'shop': '-', 'dist': '-'},
      {'id': 'MR6289398298-ORD-20260327092001-F1A395', 'status': 'PENDING', 'shop': '-', 'dist': '-'},
    ];

    final orders = _selectedStatus == 'All Orders'
        ? allOrders
        : allOrders.where((o) => o['status']?.toUpperCase() == _selectedStatus.toUpperCase()).toList();

    return ListView.separated(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 100),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final order = orders[index];
        return _buildOrderCard(order);
      },
    );
  }

  Widget _buildOrderCard(Map<String, String> data) {
    final isApproved = data['status'] == 'APPROVED';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
        boxShadow: const [
          BoxShadow(color: Color(0x05000000), blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: GoogleFonts.inter(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        data['id']!,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 13, color: AppColors.textPrimary),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isApproved ? Colors.green.shade500 : Colors.amber.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data['status']!,
                    style: GoogleFonts.inter(color: isApproved ? Colors.white : AppColors.textPrimary, fontWeight: FontWeight.w700, fontSize: 10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.store, size: 18, color: AppColors.textSecondary),
                  const SizedBox(width: 12),
                  Text('Shop: ${data['shop']}', style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.truck, size: 18, color: AppColors.textSecondary),
                  const SizedBox(width: 12),
                  Text('Distributor: ${data['dist']}', style: GoogleFonts.inter(fontSize: 13, color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
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
                Text('Filter by Status', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primary)),
                const SizedBox(height: 20),
                ...['All Orders', 'Pending', 'Approved', 'Delivered', 'Shipped'].map((status) {
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
