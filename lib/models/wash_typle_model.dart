import '../constants/assets.dart';

class WashTypeModel {
  final String title;
  final String subTitle;
  final String pngPath;

  WashTypeModel({
    required this.title,
    required this.subTitle,
    required this.pngPath,
  });
}

List<WashTypeModel> demoWashypeList = [
  WashTypeModel(
    title: 'Normal Wash',
    subTitle: 'Standard cleaning for everyday items',
    pngPath: PngAssets.normalWash,
  ),
  WashTypeModel(
    title: 'Double Wash',
    subTitle: 'Extra-strength for heavily soiled items',
    pngPath: PngAssets.doubleWash,
  ),
  WashTypeModel(
    title: 'Hot Wash',
    subTitle: 'Deep sanitization with hot water',
    pngPath: PngAssets.hotWash,
  ),
];
