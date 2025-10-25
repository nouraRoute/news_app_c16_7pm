import 'package:news_app_c16_7pm/gen/assets.gen.dart';

enum CategoryEnum {
  health(name: 'Health'),
  general(name: 'General'),
  business(name: 'Business');

  final String name;
  const CategoryEnum({required this.name});
  String getImagePAth() {
    switch (this) {
      case health:
        return Assets.images.helthDesign.path;
      case CategoryEnum.business:
        return Assets.images.busniessDesign.path;
      case CategoryEnum.general:
        return Assets.images.generalDesign.path;
    }
  }
}
