import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawerView extends StatelessWidget {
  const HomeDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 166,
            width: double.infinity,
            alignment: Alignment(0, 0),
            child: Text(
              'News App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.read<CategoryProvider>().goToHome();
              Navigator.pop(context);
            },
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Go Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Divider(endIndent: 16, indent: 16),
        ],
      ),
    );
  }
}
