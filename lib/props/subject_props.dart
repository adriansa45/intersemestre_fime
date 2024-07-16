import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'subject_props.g.dart';

@HiveType(typeId: 1)
class SubjectProps extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String text;

  SubjectProps(this.id, this.image, this.text);
}
