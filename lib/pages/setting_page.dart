import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.md,
            ),
            child: Column(
              children: [
                SizedBox(height: 5),
                Text(
                  'Manage your farm operations and account preferences',
                  style: AppTextStyles.headline4.copyWith(
                    fontSize: AppTextStyles.bodyText1.fontSize,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  spacing: 8,
                  children: [
                    Icon(
                      Icons.payments_outlined,
                      color: AppColors.primary,
                      size: AppTextStyles.headline1.fontSize,
                    ),
                    Text(
                      'Egg Pricing'.toUpperCase(),
                      style: AppTextStyles.headline4.copyWith(
                        fontSize: AppTextStyles.headline2.fontSize,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                _buildFormContainer(),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.display_settings_outlined,
                      color: AppColors.primary,
                      size: AppTextStyles.headline1.fontSize,
                    ),
                    Text(
                      'app settings'.toUpperCase(),
                      style: AppTextStyles.headline4.copyWith(
                        fontSize: AppTextStyles.headline2.fontSize,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: AppCardStyles.formCard,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppBorderRadius.medium,
                      ),
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration: AppCardStyles.formCard,
                        padding: EdgeInsets.all(AppSpacing.xs),
                        child: Icon(Icons.dark_mode_outlined),
                      ),
                      title: Text('Dark Mode', style: AppTextStyles.headline3),
                      subtitle: Text(
                        'Switch on dark visual theme',
                        style: AppTextStyles.headline4,
                      ),
                      trailing: Theme(
                        data: Theme.of(context).copyWith(
                          switchTheme: SwitchThemeData(
                            trackOutlineColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                            thumbColor: WidgetStateProperty.all(Colors.white),
                            trackColor: WidgetStateProperty.all(
                              AppColors.border,
                            ),
                          ),
                        ),
                        child: Switch(value: false, onChanged: (value) {}),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.manage_accounts_outlined,
                      color: AppColors.primary,
                      size: AppTextStyles.headline1.fontSize,
                    ),
                    Text(
                      'Account'.toUpperCase(),
                      style: AppTextStyles.headline4.copyWith(
                        fontSize: AppTextStyles.headline2.fontSize,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: AppCardStyles.formCard,
                  child: Column(
                    children: [
                      _buildFormField(
                        label: 'username',
                        placeholder: 'Enter username',
                        isNumerical: false,
                      ),
                      _buildFormField(
                        label: 'password',
                        placeholder: '······',
                        isNumerical: false,
                        isPassword: true,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: AppButtonStyles.secondaryButton.copyWith(
                         padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: AppSpacing.sm))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Update Account Security',style: AppTextStyles.headline3.copyWith(color: AppColors.darkText),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Container _buildFormContainer() {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xl),
      decoration: AppCardStyles.formCard,
      child: Column(
        spacing: 15,
        children: [
          _buildFormField(
            label: 'Big Eggs (crate)',
            controller: TextEditingController(text: r'$12.50'),
          ),
          _buildFormField(
            label: 'Medium Eggs (crate)',
            controller: TextEditingController(text: r'$6.50'),
          ),
          _buildFormField(
            label: 'Small Eggs (crate)',
            controller: TextEditingController(text: r'$4.25'),
          ),
          _buildFormField(
            label: 'Cracked Eggs (crate)',
            controller: TextEditingController(text: r'$2.50'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              spacing: 8,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.payments, size: AppTextStyles.headline1.fontSize),
                Text(
                  'Update Pricing',
                  style: TextStyle(fontSize: AppTextStyles.headline3.fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildFormField({
    String label = '',
    TextEditingController? controller,
    String placeholder = 'Enter Amount',
    bool isPassword = false,
    bool isNumerical = true, 
    ValueChanged<String>? onChanged,
  }) {

    return Column(
      spacing: 9,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTextStyles.headline4.copyWith(
            fontSize: AppTextStyles.headline3.fontSize,
            letterSpacing: 2,
          ),
        ),
        TextField(
          controller: controller,
          obscureText: isPassword,
          onChanged: onChanged, 
          decoration:
              AppInputStyles.textInputDecoration(
                hintText: placeholder,
              ).copyWith(
                suffixIcon: isPassword
                    ? Icon(
                        Icons.visibility_outlined,
                      ) 
                    : null,
                    floatingLabelBehavior: FloatingLabelBehavior.never,labelText:null
              ),
          keyboardType: isNumerical
              ? TextInputType.numberWithOptions(decimal: true) // ✅ explicit
              : TextInputType.text,
          style: AppTextStyles.headline4,
        ),
        SizedBox(height: 10),
      ],
    );
  }
  
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Settings',
        style: AppTextStyles.headline1.copyWith(
          color: AppColors.darkText,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Implement search functionality
          },
          icon: const Icon(Icons.search),
          color: AppColors.primary,
          padding: const EdgeInsets.only(right: AppSpacing.lg),
        ),
      ],
    );
  }

  
}
