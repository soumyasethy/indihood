import 'package:flutter/material.dart';
import 'package:indihood/widgets/base_type.dart';

class StringType extends BaseType {
  StringType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.caption),
        Text(
          data.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  @override
  Widget requiredRepeated(
      BuildContext context, List<Map<String, Widget>> widgetList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: Theme.of(context).textTheme.caption),
        Text(
          data.join(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
