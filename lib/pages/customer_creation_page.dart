import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomerCreationPage extends StatefulWidget {
  const CustomerCreationPage({super.key});

  @override
  State<CustomerCreationPage> createState() => _CustomerCreationPageState();
}

class _CustomerCreationPageState extends State<CustomerCreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new customer', style: AppTextStyles.headline2),
        centerTitle: true,
      ),
      body: SafeArea(child: SingleChildScrollView(child: Column())),
    );
  }
}
