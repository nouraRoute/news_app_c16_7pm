import 'package:flutter/material.dart';
import 'package:news_app_c16_7pm/common/extentions/theme_extention.dart';
import 'package:news_app_c16_7pm/enums/category_enum.dart';
import 'package:news_app_c16_7pm/providers/category_provider.dart';
import 'package:provider/provider.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryEnum,
    required this.isRight,
  });
  final CategoryEnum categoryEnum;
  final bool isRight;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.read<CategoryProvider>().selectCategory(categoryEnum),
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        height: 200,
        alignment: isRight ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: context.getTheme.colorScheme.primary,
          image: DecorationImage(
            image: AssetImage(categoryEnum.getImagePAth()),
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                categoryEnum.name,
                style: context.getTextTheme.displayLarge!.copyWith(
                  color: context.getTheme.colorScheme.secondary,
                ),
              ),
            ),
            //TODO:button
            Container(
              decoration: BoxDecoration(
                color: context.getTheme.scaffoldBackgroundColor.withValues(
                  alpha: .5,
                ),
                borderRadius: BorderRadius.circular(84),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isRight)
                    Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: context.getTheme.colorScheme.primary,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: context.getTheme.colorScheme.primary,
                      ),
                    ),
                  ),
                  if (isRight)
                    Container(
                      height: 54,

                      width: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.getTheme.scaffoldBackgroundColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: context.getTheme.colorScheme.primary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
