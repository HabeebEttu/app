import 'package:app/pages/customer_details_page.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller for search functionality
  final searchController = TextEditingController();

  // Filter options for customer list
  final List<String> filters = ['All', 'In Debt', 'No Debt'];
  String selectedFilter = 'All';

  // Sample customer data
  final List<Map<String, dynamic>> customers = [
    {
      'name': 'Al-Fayed Poultry Hub',
      'balance': -4250.00,
      'status': 'Regular buyer since 2023',
    },
    {'name': 'Green Valley Mart', 'balance': 0.00, 'status': 'SETTLED TODAY'},
    {
      'name': 'Omina Bakeries',
      'balance': -820.50,
      'status': 'Last order: 2 days ago',
    },
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.border,
        child: Icon(Icons.add, weight: 900),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            spacing: AppSpacing.lg,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search TextField
              _buildSearchField(),

              // Filter Pills
              _buildFilterPills(),

              // Section Header
              _buildSectionHeader(),

              // Customer List
              _buildCustomerList(),

              // Extra spacing at bottom
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  /// Builds the AppBar with proper styling
  /// Uses theme colors and consistent spacing
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Betfah Egg Sales',
        style: AppTextStyles.headline2.copyWith(
          color: AppColors.primary,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Implement search functionality
          },
          icon: const Icon(Icons.settings),
          color: AppColors.primary,
          padding: const EdgeInsets.all(AppSpacing.lg),
        ),
      ],
    );
  }

  /// Builds search input field with theme styling
  /// Uses AppInputStyles.searchInputDecoration for consistency
  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      decoration: AppInputStyles.searchInputDecoration(
        hintText: 'Filter customers...',
      ),
      onChanged: (value) {
        // TODO: Implement real-time filtering
        setState(() {});
      },
    );
  }

  /// Builds filter chip/pill buttons
  /// Uses proper spacing and responsive layout
  /// WHY: Uses Wrap instead of Row for better responsiveness
  Widget _buildFilterPills() {
    return Wrap(
      spacing: AppSpacing.md,
      children: List.generate(filters.length, (index) {
        final filter = filters[index];
        final isSelected = selectedFilter == filter;

        return FilterPill(
          label: filter,
          isSelected: isSelected,
          onSelected: (selected) {
            setState(() {
              selectedFilter = filter;
            });
          },
        );
      }),
    );
  }

  /// Builds section header with title and count
  /// Shows visual hierarchy and information density
  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Customers'.toUpperCase(), style: AppTextStyles.headline1),
        Text(
          'SHOWING ${customers.length}',
          style: AppTextStyles.caption.copyWith(
            color: AppColors.lightText,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: customers.length,
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.lg),
      itemBuilder: (context, index) {
        final customer = customers[index];
        return CustomerCard(
          customerName: customer['name'],
          balance: customer['balance'],
          status: customer['status'],
        );
      },
    );
  }

  /// Builds bottom navigation bar
  /// Provides navigation to other sections
  // Widget _buildBottomNavigation() {
  //   return BottomNavigationBar(
  //     selectedItemColor: AppColors.primary,
  //     currentIndex: 0,
  //     items: const [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.receipt_long),
  //         label: 'Ledger',
  //       ),
  //       BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  //     ],
  //     onTap: (index) {},
  //   );
  // }
}

/// Filter Pill Widget
/// Reusable component for filter buttons with proper styling
class FilterPill extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const FilterPill({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: isSelected
          ? AppButtonStyles.pillButton
          : ElevatedButton.styleFrom(
              backgroundColor: AppColors.background,
              foregroundColor: AppColors.lightText,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppBorderRadius.circle),
              ),
            ),
      onPressed: () => onSelected(true),
      child: Text(
        label,
        style: AppTextStyles.headline4.copyWith(
          color: isSelected ? AppColors.primary : AppColors.lightText,
        ),
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  final String customerName;
  final double balance;
  final String? status;

  const CustomerCard({
    required this.customerName,
    required this.balance,
    this.status,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Determine card decoration based on balance
    final cardDecoration = balance < 0
        ? AppCardStyles.debtCard
        : balance == 0
        ? AppCardStyles.successCard
        : AppCardStyles.standardCard;

    final statusColor = getStatusColor(balance);
    final statusText = getStatusText(balance);
    final statusIcon = getStatusIcon(balance);

    return Container(
      decoration: cardDecoration,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.lg,
        children: [
          _buildCardHeader(statusColor, statusText),

          _buildCustomerInfo(statusColor),

          Divider(
            color: AppColors.border,
            height: 1,
            thickness: AppDimensions.dividerThickness,
          ),

          _buildCardFooter(statusIcon, statusColor, statusText,context),
        ],
      ),
    );
  }

  Widget _buildCardHeader(Color statusColor, String statusText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Customer label
        Text(
          'CUSTOMER',
          style: AppTextStyles.headline4.copyWith(
            letterSpacing: 0.5,
            color: AppColors.lightText,
          ),
        ),
        // Status label (DUE BALANCE, CLEAR, etc.)
        Text(
          statusText.toUpperCase(),
          style: AppTextStyles.headline4.copyWith(
            color: statusColor,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerInfo(Color statusColor) {
    final isNegative = balance < 0;
    final displayAmount = balance.abs().toStringAsFixed(2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Customer name
        Expanded(
          child: Text(
            customerName,
            style: AppTextStyles.headline2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Text(
          '${isNegative ? '-' : ''}\$$displayAmount',
          style: AppTextStyles.amountLarge.copyWith(color: statusColor),
        ),
      ],
    );
  }

  /// Builds the footer with status badge and action button
  Widget _buildCardFooter(
    IconData statusIcon,
    Color statusColor,
    String statusText,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Status badge with icon
        _buildStatusBadge(statusIcon, statusColor, statusText),

        // Details action button
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CustomerDetailsPage();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_forward, size: 14),
          label: Text(
            'Details',
            style: AppTextStyles.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(IconData icon, Color color, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.5),
        borderRadius: AppBorderRadius.smallRadius,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.sm,
        children: [
          Icon(icon, color: color, size: AppDimensions.iconSmall),
          Text(
            text.toUpperCase(),
            style: AppTextStyles.overline.copyWith(color: color, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
