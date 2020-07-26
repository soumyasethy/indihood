import 'package:flutter/cupertino.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:indihood/widgets/components/card_widget.dart';

class RepaymentType extends BaseType {
  RepaymentType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredRepeated(
      BuildContext context, List<Map<String, Widget>> widgetList) {
    List<Widget> list = [];
    widgetList.forEach((widgetMap) {
      list.add(widgetMap["Date"]);
      list.add(widgetMap["Amount"]);
    });
    return CardWidget(
      title: title,
      children: list,
      collapsedRows: 3,
      expandButtonTitle: "SEE FULL SCHEDULE",
    );
  }
}
