import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/common/extentions/theme_extention.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'firstfirst'),
              Tab(text: 'first'),
              Tab(text: 'first'),
              Tab(text: 'first'),
              Tab(text: 'first'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
                NewsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.getTheme.primaryColor),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'data',
              style: context.getTextTheme.displaySmall!.copyWith(fontSize: 16),
            ),
            Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Text(
                    'data',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA0A0A0),
                    ),
                  ),
                ),

                Text(
                  'data',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA0A0A0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
