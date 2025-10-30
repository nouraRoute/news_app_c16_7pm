import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c16_7pm/features/categories/viewModel/category_cubit.dart';

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
            height: 166.h,
            width: double.infinity,
            alignment: Alignment(0, 0),
            child: Text(
              'News App',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.read<CategoryCubit>().goToHome();
              Navigator.pop(context);
            },
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Go Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          Divider(endIndent: 16.w, indent: 16.w),
        ],
      ),
    );
  }
}
