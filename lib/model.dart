import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class ImageModel extends HiveObject {
  @HiveField(0)
  final String imgpath;

  ImageModel({required this.imgpath});
}
