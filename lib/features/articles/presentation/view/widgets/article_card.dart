import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c16_7pm/common/extentions/theme_extention.dart';
import 'package:news_app_c16_7pm/features/articles/domain/entity/article_entity.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.article});
  final ArticleEntity article;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                alignment: Alignment(0, 0),
                height: 100.h,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                alignment: Alignment(0, 0),
                height: 100.h,
                child: Icon(Icons.broken_image_outlined),
              ),
            ),
          ),
          Text(
            article.title ?? '',
            style: context.getTextTheme.displaySmall!.copyWith(fontSize: 16),
          ),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: Text(
                  article.description ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffA0A0A0),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),

              Text(
                timeago.format(DateTime.parse(article.publishedAt ?? '')),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffA0A0A0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
