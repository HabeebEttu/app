import 'package:app/pages/home_page.dart';
import 'package:app/pages/setting_page.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _selectedIndex = 0;

  // Pages to display for each tab
  final List<Widget> _pages = [HomePage(), Scaffold(), SettingPage()];
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      title: 'Flutter Demo',
debugShowCheckedModeBanner: false,
      theme:AppTheme.lightTheme(),
      home: Scaffold(body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      currentIndex: _selectedIndex   ,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Ledger',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
        setState(() {
              _selectedIndex = index;
            });
      },
    )
,),
      
    );
  }
}

