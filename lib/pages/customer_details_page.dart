import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({super.key});

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
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
                _buildCustomerCard(),
                SizedBox(height: 30),
                _buildTransactionHistory(context),
                SizedBox(height: 20),
                _buildTransactionOrderCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'Betfah Egg Sales',
        style: AppTextStyles.headline1.copyWith(
          color: AppColors.darkText,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // TODO: Implement more functionality
          },
          icon: const Icon(Icons.more_vert),
          color: AppColors.primary,
          padding: const EdgeInsets.only(right: AppSpacing.lg),
        ),
      ],
    );
  }

  Widget _buildCustomerCard() {
    return Container(
      decoration: AppCardStyles.highlightCard,

      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'customer account'.toUpperCase(),

            style: AppTextStyles.headline4.copyWith(color: Colors.white70),
          ),
          SizedBox(height: 10),
          Text(
            'Damilola Marcus',
            style: AppTextStyles.headline1.copyWith(color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Since Oct 2023',
            style: AppTextStyles.headline4.copyWith(color: Colors.white70),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(AppSpacing.lg),
            decoration: AppCardStyles.highlightCard.copyWith(
              color: Color(0xFF468366),
              border: Border.all(width: 0.85, color: Colors.grey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  'outstanding balance'.toUpperCase(),
                  style: AppTextStyles.headline4.copyWith(
                    letterSpacing: 1.8,
                    color: Color(0xFFE3E3DC),
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      "₦142,500",
                      style: AppTextStyles.amountLarge.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.trending_up,
                      color: AppColors.clearGreen.withAlpha(50),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTransactionHistory(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transaction History', style: AppTextStyles.headline2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Text(
                  'Chronological history of orders and payments', //TODO fix word wrap
                  style: AppTextStyles.headline4,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: AppButtonStyles.secondaryButton,
            child: Padding(
              padding: EdgeInsets.symmetric(),
              child: Row(
                spacing: AppSpacing.sm,
                children: [Icon(Icons.filter_list_outlined), Text('Filter')],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildTransactionOrderCard() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppBorderRadius.large),
            topRight: Radius.circular(AppBorderRadius.large),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: AppSpacing.md,
                children: [
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.shopping_basket,
                        size: 20,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  Text(
                    'Order #388DYES'.toUpperCase(),
                    style: AppTextStyles.successText.copyWith(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Jan 12, 2026', style: AppTextStyles.headline2),
              Text('10:45 AM', style: AppTextStyles.headline4),
            ],
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(AppBorderRadius.large),
            bottomLeft: Radius.circular(AppBorderRadius.large),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                children: [
                  Container(
                    decoration: AppCardStyles.formCard,
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Big'.toUpperCase(),
                          style: AppTextStyles.headline2,
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text('20 ', style: AppTextStyles.amountLarge),
                            Text('crates'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: AppCardStyles.formCard,
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'medium'.toUpperCase(),
                          style: AppTextStyles.headline2,
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text('20 ', style: AppTextStyles.amountLarge),
                            Text('crates'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: AppCardStyles.formCard,
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'small'.toUpperCase(),
                          style: AppTextStyles.headline2,
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text('20 ', style: AppTextStyles.amountLarge),
                            Text('crates'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: AppCardStyles.formCard,
                    padding: EdgeInsets.all(13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'cracked'.toUpperCase(),
                          style: AppTextStyles.headline2,
                        ),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text('20 ', style: AppTextStyles.amountLarge),
                            Text('crates'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxl),
                child: Divider(),
              ),
              Row(children: [
                Text('Total Order Value'),
                Text('₦60,000')
              ],)
            ],
          ),
        ),
      ),
    ],
  );
}
