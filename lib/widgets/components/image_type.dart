import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';

class ImageType extends BaseType {
  ImageType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Image.network(
      data["url"],
    );
  }
}
