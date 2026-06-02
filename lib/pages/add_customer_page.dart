import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/theme/theme.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  String _selectedCategory = 'Wholesaler';
  final _balanceController = TextEditingController(text: '0');

  @override
  void dispose() {
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            _TopAppBar(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xl,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppSpacing.xxl),
                      const _PageHeader(),
                      const SizedBox(height: AppSpacing.xxxl),
                      const _BusinessDetailsSection(),
                      const SizedBox(height: AppSpacing.xxxl),
                      const _ContactInfoSection(),
                      const SizedBox(height: AppSpacing.xxxl),
                      _AccountSetupSection(
                        selectedCategory: _selectedCategory,
                        balanceController: _balanceController,
                        onCategoryChanged: (v) =>
                            setState(() => _selectedCategory = v!),
                      ),
                      const SizedBox(height: AppSpacing.xxxl),
                      const _SaveButton(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const _BottomNavBar(),
      ),
    );
  }
}

class _TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.9),
        boxShadow: [
          AppShadows.small,
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md, 
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Avatar circle — surfaceContainerHigh background
                  Container(
                    width: AppDimensions.iconXLarge, // 48
                    height: AppDimensions.iconXLarge,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.border, // #E0E0E0
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCnjqV0VmiOB2jZfpQxMaCh8EI_MKgJlO3K63AuHb39xINKQlxnVvIsQtP5umMxtc_hvQF4UlImpxcqPn5uE945QKWF1YrxgvmGw_k4YWbfXYoSljKsotULip6Rr9qqMyzkI5pxQ5Dw_8V8kznQOEuAmGOWKqfC72w48Q7-_KW7w_YEE9hd07vOL2I9Fl6Fdajp2VFXbJ6w0GTBPMzvwdY2fpmwPdgZ_AVfqlwwGuP6v8eCh-lv-f5jcEmV52_1AwI4X8JT03fkAP24',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.person,
                        // AppColors.lightText = #757575
                        color: AppColors.lightText,
                        size: AppDimensions.iconMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md), // 12
                  // Brand name — Manrope font, AppColors.primary
                  Text(
                    'AgriEgg',
                    style: AppTextStyles.headline2.copyWith(
                      // AppTextStyles.headline2: 20px, w600, darkText
                      // Override to brand primary green & Manrope weight
                      fontWeight: FontWeight.w900,
                      fontSize: 22,
                      color: AppColors.primary, // #1B5E3F
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
              // Search icon button — AppButtonStyles.iconButton
              IconButton(
                style: AppButtonStyles.iconButton,
                icon: const Icon(Icons.search_rounded),
                // icon color = AppColors.primary via iconButton style
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// PAGE HEADER  (back button + title)
// ============================================================
class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back button — AppCardStyles.formCard background
        Container(
          width: AppDimensions.buttonMedium, // 44
          height: AppDimensions.buttonMedium,
          decoration: BoxDecoration(
            // formCard = Color(0xFFE6E6E6), mediumRadius (8)
            color: const Color(0xFFE6E6E6),
            borderRadius: AppBorderRadius.mediumRadius,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary, // #1B5E3F
            size: AppDimensions.iconSmall + 4, // 20
          ),
        ),
        const SizedBox(width: AppSpacing.lg), // 16
        Expanded(
          // AppTextStyles.headline1: 28px, bold, darkText, Manrope implied
          child: Text('Add New Customer', style: AppTextStyles.headline1),
        ),
      ],
    );
  }
}

// ============================================================
// SECTION HEADER WIDGET
// ============================================================
class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // AppTextStyles.overline: 10px, w500, hintText, ls 0.5
        Text(label.toUpperCase(), style: AppTextStyles.overline),
        const SizedBox(width: AppSpacing.md), // 12
        Container(
          width: AppSpacing.xxl, // 32
          height: AppDimensions.dividerThickness, // 1
          // AppColors.divider = #BDBDBD at low opacity
          color: AppColors.divider.withOpacity(0.4),
        ),
      ],
    );
  }
}

// ============================================================
// TRAY INPUT  (minimalist, no box, surface-variant bg + underline)
// Design rule: "Minimalist Tray" — surface-variant bg, sm radius,
// focused → primary-fixed bg + primary underline
// ============================================================
class _TrayInput extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextInputType keyboardType;
  final IconData? prefixIcon;

  const _TrayInput({
    required this.label,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
  });

  @override
  State<_TrayInput> createState() => _TrayInputState();
}

class _TrayInputState extends State<_TrayInput> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label — AppTextStyles.overline but primary color
        Text(
          widget.label.toUpperCase(),
          style: AppTextStyles.overline.copyWith(
            color: AppColors.primary, // #1B5E3F
            letterSpacing: 1.8,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.sm), // 8
        Focus(
          onFocusChange: (v) => setState(() => _focused = v),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              // idle: background = AppColors.background (#FAFAF3)
              // focused: AppColors.primaryLightest (#C8E6C9)
              color: _focused
                  ? AppColors.primaryLightest
                  : AppColors.background,
              // sm radius bottom only → 0.125rem ≈ 2px
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(AppBorderRadius.small),
                bottomRight: Radius.circular(AppBorderRadius.small),
              ),
            ),
            child: Row(
              children: [
                if (widget.prefixIcon != null) ...[
                  const SizedBox(width: AppSpacing.lg), // 16
                  Icon(
                    widget.prefixIcon,
                    // AppColors.lightText = #757575
                    color: AppColors.lightText,
                    size: AppDimensions.iconSmall + 2, // 18
                  ),
                  const SizedBox(width: AppSpacing.sm), // 8
                ] else
                  const SizedBox(width: AppSpacing.lg), // 16
                Expanded(
                  child: TextField(
                    keyboardType: widget.keyboardType,
                    // AppTextStyles.bodyText1: 16, w500, darkText
                    style: AppTextStyles.bodyText1,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      // hint → AppColors.hintText = #BDBDBD
                      hintStyle: AppTextStyles.bodyText1.copyWith(
                        color: AppColors.hintText,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.lg, // 16
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
              ],
            ),
          ),
        ),
        // Animated underline — primary when focused
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: AppDimensions.dividersideThickness / 2, // 2px
          color: _focused ? AppColors.primary : Colors.transparent,
        ),
      ],
    );
  }
}

// ============================================================
// BUSINESS DETAILS SECTION
// ============================================================
class _BusinessDetailsSection extends StatelessWidget {
  const _BusinessDetailsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Business Details'),
        const SizedBox(height: AppSpacing.lg), // 16
        const _TrayInput(
          label: 'Business/Customer Name',
          placeholder: 'Green Valley Markets',
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: AppSpacing.xl), // 24
        const _TrayInput(
          label: 'Location/Address',
          placeholder: '123 Farm Road, Sector 4',
          keyboardType: TextInputType.streetAddress,
          prefixIcon: Icons.location_on_outlined,
        ),
      ],
    );
  }
}

// ============================================================
// CONTACT CARD  (white surface, shadow, rounded)
// AppCardStyles.standardCard: surface bg, largeRadius, smallShadow
// ============================================================
class _ContactCard extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextInputType keyboardType;

  const _ContactCard({
    required this.label,
    required this.placeholder,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // AppCardStyles.standardCard
      decoration: AppCardStyles.standardCard,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg, // 16
        AppSpacing.md, // 12
        AppSpacing.lg,
        AppSpacing.xs, // 4
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppTextStyles.overline: 10px, hintText
          Text(label.toUpperCase(), style: AppTextStyles.overline),
          TextField(
            keyboardType: keyboardType,
            // AppTextStyles.amountMedium: 18px, bold, darkText
            style: AppTextStyles.amountMedium,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: AppTextStyles.amountMedium.copyWith(
                color: AppColors.hintText,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                vertical: AppSpacing.sm, // 8
              ),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// CONTACT INFO SECTION
// Wrapped in a surface-container-low tinted card
// ============================================================
class _ContactInfoSection extends StatelessWidget {
  const _ContactInfoSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      // background shift: AppColors.background variant → use formCard
      decoration: BoxDecoration(
        // Slightly tinted: AppColors.border at low opacity over surface
        color: AppColors.background,
        border: Border.all(
          // "Ghost Border" fallback: outline-variant at 15% opacity
          color: AppColors.divider.withOpacity(0.15),
          width: AppDimensions.dividerThickness,
        ),
        borderRadius: AppBorderRadius.xlargeRadius, // 16
      ),
      padding: const EdgeInsets.all(AppSpacing.xl), // 24
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CONTACT INFORMATION', style: AppTextStyles.overline),
          const SizedBox(height: AppSpacing.xl), // 24
          const _ContactCard(
            label: 'Phone Number',
            placeholder: '+1 (555) 000-0000',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: AppSpacing.lg), // 16
          const _ContactCard(
            label: 'Email Address (Optional)',
            placeholder: 'contact@business.com',
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ACCOUNT SETUP SECTION
// ============================================================
class _AccountSetupSection extends StatelessWidget {
  final String selectedCategory;
  final TextEditingController balanceController;
  final ValueChanged<String?> onCategoryChanged;

  const _AccountSetupSection({
    required this.selectedCategory,
    required this.balanceController,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Account Setup'),
        const SizedBox(height: AppSpacing.lg), // 16
        Row(
          children: [
            // ── Initial Balance card ────────────────────────
            // AppCardStyles.successCard: surface bg, left primary border,
            // largeRadius, smallShadow — repurposed as "balance card"
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface, // #FFFFFF
                  borderRadius: AppBorderRadius.largeRadius, // 12
                  border: const Border(
                    left: BorderSide(
                      color: AppColors.primary, // #1B5E3F
                      width: AppDimensions.dividersideThickness, // 4
                    ),
                  ),
                  boxShadow: AppShadows.smallList,
                ),
                padding: const EdgeInsets.all(AppSpacing.lg), // 16
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INITIAL BALANCE',
                      // AppTextStyles.overline: 10, w500, hintText
                      style: AppTextStyles.overline.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm), // 8
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // AppTextStyles.amountLarge: 24, bold, darkText
                        Text('₦', style: AppTextStyles.amountLarge),
                        const SizedBox(width: AppSpacing.xs), // 4
                        Expanded(
                          child: TextField(
                            controller: balanceController,
                            keyboardType: TextInputType.number,
                            // AppTextStyles.amountLarge: 24, bold
                            style: AppTextStyles.amountLarge.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w900,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.lg), // 16
            // ── Category card ───────────────────────────────
            // AppCardStyles.standardCard
            Expanded(
              child: Container(
                decoration: AppCardStyles.standardCard,
                padding: const EdgeInsets.all(AppSpacing.lg), // 16
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CATEGORY',
                      style: AppTextStyles.overline.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm), // 8
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedCategory,
                        isExpanded: true,
                        icon: Icon(
                          Icons.unfold_more_rounded,
                          // AppColors.hintText = #BDBDBD
                          color: AppColors.hintText,
                          size: AppDimensions.iconSmall, // 16
                        ),
                        // AppTextStyles.headline4: 14, w600, lightText
                        // Override to primary for emphasis
                        style: AppTextStyles.headline4.copyWith(
                          color: AppColors.primaryLight, // #2E7D32
                          fontWeight: FontWeight.w700,
                        ),
                        items: ['Wholesaler', 'Retailer', 'Hotel', 'Individual']
                            .map(
                              (c) => DropdownMenuItem(value: c, child: Text(c)),
                            )
                            .toList(),
                        onChanged: onCategoryChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ============================================================
// SAVE BUTTON
// AppButtonStyles.primaryButton + gradient from design system
// "Signature Textures": primary → primaryLight gradient
// ============================================================
class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.buttonLarge + 12, // 64
      decoration: BoxDecoration(
        // Design rule "Glass & Gradient":
        // primary (#1B5E3F) → primaryLight (#2E7D32)
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryLight],
        ),
        // AppBorderRadius.xlarge = 16
        borderRadius: AppBorderRadius.xlargeRadius,
        boxShadow: [
          // AppShadows.medium: 8% black, 8px blur, (0,4) offset
          AppShadows.medium,
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: AppBorderRadius.xlargeRadius,
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person_add_rounded,
                color: Colors.white,
                size: AppDimensions.iconMedium, // 24
              ),
              const SizedBox(width: AppSpacing.md), // 12
              // AppTextStyles.bodyText1: 16, w500 — override to bold
              Text(
                'Save Customer',
                style: AppTextStyles.bodyText1.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// BOTTOM NAV BAR
// Active item: AppButtonStyles.primaryButton style (gradient pill)
// Inactive: AppColors.lightText icons & labels
// ============================================================
class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Glassmorphism: background at 90% opacity
        color: AppColors.surface.withOpacity(0.95),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppBorderRadius.xlarge + 8), // 24
        ),
        boxShadow: [AppShadows.large],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, // 16
            vertical: AppSpacing.md, // 12
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              _NavItem(
                icon: Icons.storage_rounded,
                label: 'HOME',
                active: false,
              ),
              _NavItem(
                icon: Icons.account_balance_wallet_rounded,
                label: 'LEDGER',
                active: true,
              ),
              _NavItem(
                icon: Icons.settings_rounded,
                label: 'SETTINGS',
                active: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    if (active) {
      // Active: gradient pill — matches AppButtonStyles.primaryButton
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl, // 24
          vertical: AppSpacing.md, // 12
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryLight],
          ),
          // AppBorderRadius.large = 12
          borderRadius: AppBorderRadius.largeRadius,
          boxShadow: [AppShadows.small],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: AppDimensions.iconMedium),
            const SizedBox(height: AppSpacing.xs), // 4
            Text(
              label,
              // AppTextStyles.caption: 12, normal, lightText
              style: AppTextStyles.caption.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
    }

    // Inactive
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg, // 16
        vertical: AppSpacing.md, // 12
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            // AppColors.lightText = #757575
            color: AppColors.lightText,
            size: AppDimensions.iconMedium, // 24
          ),
          const SizedBox(height: AppSpacing.xs), // 4
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.lightText,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// APP ENTRY  (for standalone testing)
// Uses AppTheme.lightTheme() from theme.dart
// ============================================================
void main() {
  runApp(const AgriEggApp());
}

class AgriEggApp extends StatelessWidget {
  const AgriEggApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriEgg',
      debugShowCheckedModeBanner: false,
      // ← plug in AppTheme.lightTheme() from your theme.dart
      theme: AppTheme.lightTheme(),
      home: const AddCustomerPage(),
    );
  }
}
