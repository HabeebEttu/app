import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewActivityPage extends StatefulWidget {
  const NewActivityPage({super.key});

  @override
  State<NewActivityPage> createState() => _NewActivityPageState();
}

class _NewActivityPageState extends State<NewActivityPage> {
  // Egg order quantities
  final TextEditingController _bigController = TextEditingController(text: '0');
  final TextEditingController _mediumController = TextEditingController(
    text: '0',
  );
  final TextEditingController _smallController = TextEditingController(
    text: '0',
  );
  final TextEditingController _crackedController = TextEditingController(
    text: '0',
  );

  // Payment
  final TextEditingController _amountController = TextEditingController(
    text: '0.00',
  );

  // Price per crate (adjust as needed)
  static const double _pricePerCrate = 1000.0;

  bool _paymentWithOrder = true;
  int _selectedPaymentMethod = 0; // 0 = Cash, 1 = Transfer

  double get _estimatedSubtotal {
    final big = int.tryParse(_bigController.text) ?? 0;
    final medium = int.tryParse(_mediumController.text) ?? 0;
    final small = int.tryParse(_smallController.text) ?? 0;
    final cracked = int.tryParse(_crackedController.text) ?? 0;
    return (big + medium + small + cracked) * _pricePerCrate;
  }

  final FocusNode _bigFocus = FocusNode();
  final FocusNode _mediumFocus = FocusNode();
  final FocusNode _smallFocus = FocusNode();
  final FocusNode _crackedFocus = FocusNode();

  // initState
  @override
  void initState() {
    super.initState();
    for (final pair in [
      (_bigFocus, _bigController),
      (_mediumFocus, _mediumController),
      (_smallFocus, _smallController),
      (_crackedFocus, _crackedController),
    ]) {
      final focus = pair.$1;
      final ctrl = pair.$2;
      focus.addListener(() {
        if (!focus.hasFocus && ctrl.text.isEmpty) {
          setState(() => ctrl.text = '0');
        }
      });
    }
  }

  // dispose
  @override
  void dispose() {
    for (final f in [_bigFocus, _mediumFocus, _smallFocus, _crackedFocus]) {
      f.dispose();
    }
    // ... controllers
    _bigController.dispose();
    _mediumController.dispose();
    _smallController.dispose();
    _crackedController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _onQtyChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(),
              SizedBox(height: AppSpacing.xxl),
              _buildEggOrderSection(),
              SizedBox(height: AppSpacing.xl),
              _buildSubtotalCard(),
              SizedBox(height: AppSpacing.xxl),
              _buildPaymentDetailsSection(),
              SizedBox(height: AppSpacing.xxl),
              _buildConfirmButton(),
              SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  // ── AppBar ──────────────────────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      titleSpacing: AppSpacing.lg,
      title: Row(
        spacing: AppSpacing.sm,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppBorderRadius.medium),
            child: Container(
              width: 38,
              height: 38,
              color: AppColors.primary,
              child: Icon(Icons.egg_alt, color: Colors.white, size: 22),
            ),
          ),
          Text(
            'AgriEgg',
            style: AppTextStyles.headline2.copyWith(color: AppColors.primary),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: AppColors.darkText),
          padding: EdgeInsets.only(right: AppSpacing.lg),
        ),
      ],
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('New Activity', style: AppTextStyles.display1),
        SizedBox(height: 6),
        Text(
          'Log your daily egg harvest and sales.',
          style: AppTextStyles.bodyText2.copyWith(color: AppColors.lightText),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String badge) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.headline2),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryLightest,
            borderRadius: BorderRadius.circular(AppBorderRadius.circle),
          ),
          child: Text(
            badge.toUpperCase(),
            style: AppTextStyles.overline.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEggOrderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Egg Order', 'Inventory'),
        SizedBox(height: AppSpacing.lg),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          childAspectRatio: 1.6,
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          children: [
            _buildQtyCard('Big Eggs', _bigController, _bigFocus),
            _buildQtyCard('Medium Eggs', _mediumController, _mediumFocus),
            _buildQtyCard('Small Eggs', _smallController, _smallFocus),
            _buildQtyCard('Cracked', _crackedController, _crackedFocus),
          ],
        ),
      ],
    );
  }

  Widget _buildQtyCard(
    String label,
    TextEditingController controller,
    FocusNode focusNode,
  ) {
    return Container(
      decoration: AppCardStyles.formCard,
      padding: EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label.toUpperCase(),
            style: AppTextStyles.overline.copyWith(
              color: AppColors.lightText,
              letterSpacing: 1.2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onTap: () {
                    if (controller.text == '0') controller.clear();
                  },
                  onChanged: (val) {
                    if (val.isEmpty) {
                      controller.text = '0';
                      controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: controller.text.length),
                      );
                    }
                    _onQtyChanged();
                  },
                  onEditingComplete: () {
                    if (controller.text.isEmpty) controller.text = '0';
                  },
                  onTapOutside: (_) {
                    if (controller.text.isEmpty) controller.text = '0';
                    FocusScope.of(context).unfocus();
                  },
                  style: AppTextStyles.amountLarge.copyWith(
                    color: AppColors.hintText,
                    fontSize: 28,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    isDense: true,
                    filled: false,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Text(
                'Qty',
                style: AppTextStyles.bodyText2.copyWith(
                  color: AppColors.lightText,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubtotalCard() {
    return Container(
      decoration: AppCardStyles.formCard,
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xl,
        vertical: AppSpacing.lg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Estimated Subtotal', style: AppTextStyles.bodyText1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                _estimatedSubtotal.toStringAsFixed(2),
                style: AppTextStyles.amountLarge.copyWith(
                  color: AppColors.primary,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Payment details section ─────────────────────────────────────────────

  Widget _buildPaymentDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Payment Details', 'Finances'),
        SizedBox(height: AppSpacing.lg),
        _buildAmountReceivedField(),
        SizedBox(height: AppSpacing.xl),
        _buildPaymentMethodToggle(),
        SizedBox(height: AppSpacing.xl),
        _buildPaymentWithOrderSwitch(),
      ],
    );
  }

  Widget _buildAmountReceivedField() {
    return Container(
      decoration: AppCardStyles.formCard,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AMOUNT RECEIVED',
            style: AppTextStyles.overline.copyWith(
              color: AppColors.lightText,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₦',
                style: AppTextStyles.amountLarge.copyWith(
                  color: AppColors.hintText,
                  fontSize: 28,
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: TextField(
                  controller: _amountController,
                  onTap: () {
                    if (_amountController.text == '0.00') {
                      _amountController.clear();
                    }
                  },
                  onTapOutside: (event) {
                    if (_amountController.text.isEmpty) {
                      _amountController.text = '0.00';
                    }
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: AppTextStyles.amountLarge.copyWith(
                    color: AppColors.hintText,
                    fontSize: 28,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    filled: false,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          Divider(color: AppColors.primary, thickness: 1.5),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodToggle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PAYMENT METHOD',
          style: AppTextStyles.overline.copyWith(
            color: AppColors.lightText,
            letterSpacing: 1.5,
          ),
        ),
        SizedBox(height: AppSpacing.md),
        Container(
          decoration: AppCardStyles.formCard,
          padding: EdgeInsets.all(AppSpacing.xs),
          child: Row(
            children: [
              _buildMethodOption(0, Icons.wallet_outlined, 'Cash'),
              _buildMethodOption(1, Icons.account_balance_outlined, 'Transfer'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMethodOption(int index, IconData icon, String label) {
    final isSelected = _selectedPaymentMethod == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPaymentMethod = index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(AppBorderRadius.medium),
            boxShadow: isSelected ? AppShadows.smallList : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: AppSpacing.sm,
            children: [
              Icon(
                icon,
                size: 18,
                color: isSelected ? AppColors.darkText : AppColors.lightText,
              ),
              Text(
                label,
                style: AppTextStyles.bodyText1.copyWith(
                  color: isSelected ? AppColors.darkText : AppColors.lightText,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentWithOrderSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Payment made with order', style: AppTextStyles.bodyText1),
            Text('Mark as immediate settlement', style: AppTextStyles.caption),
          ],
        ),
        Switch(
          value: _paymentWithOrder,
          onChanged: (val) => setState(() => _paymentWithOrder = val),
          activeColor: Colors.white,
          activeTrackColor: AppColors.primary,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: AppColors.border,
        ),
      ],
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonLarge,
      child: ElevatedButton(
        onPressed: () {
          // TODO: handle submission
        },
        style: AppButtonStyles.primaryButton.copyWith(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppBorderRadius.xlarge),
            ),
          ),
        ),
        child: Text(
          'Confirm Transaction',
          style: AppTextStyles.bodyText1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Widget _buildBottomNav() {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: AppColors.surface,
  //       boxShadow: AppShadows.smallList,
  //     ),
  //     child: SafeArea(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
  //           children: [
  //             _buildNavItem(Icons.home_outlined, 'Home', false),
  //             _buildNavItemActive(Icons.book_outlined, 'Ledger'),
  //             _buildNavItem(Icons.settings_outlined, 'Settings', false),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildNavItem(IconData icon, String label, bool active) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     spacing: 4,
  //     children: [
  //       Icon(
  //         icon,
  //         color: active ? AppColors.primary : AppColors.lightText,
  //         size: AppDimensions.iconMedium,
  //       ),
  //       Text(
  //         label.toUpperCase(),
  //         style: AppTextStyles.overline.copyWith(
  //           color: active ? AppColors.primary : AppColors.lightText,
  //           letterSpacing: 1.0,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildNavItemActive(IconData icon, String label) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     spacing: 4,
  //     children: [
  //       Container(
  //         padding: EdgeInsets.all(AppSpacing.md),
  //         decoration: BoxDecoration(
  //           color: AppColors.primary,
  //           borderRadius: BorderRadius.circular(AppBorderRadius.medium),
  //         ),
  //         child: Icon(
  //           icon,
  //           color: Colors.white,
  //           size: AppDimensions.iconMedium,
  //         ),
  //       ),
  //       Text(
  //         label.toUpperCase(),
  //         style: AppTextStyles.overline.copyWith(
  //           color: AppColors.primary,
  //           fontWeight: FontWeight.w600,
  //           letterSpacing: 1.0,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
