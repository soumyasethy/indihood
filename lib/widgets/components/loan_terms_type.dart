import 'package:flutter/cupertino.dart';
import 'package:indihood/utils/constants.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:indihood/widgets/components/card_widget.dart';

class LoanTermsType extends BaseType {
  LoanTermsType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return CardWidget(
      title: title,
      children: <Widget>[
        widgetMap[Constants.durationText],
        widgetMap[Constants.interestRateText],
        widgetMap[Constants.loanAmountText],
        widgetMap[Constants.loanProductText],
      ],
    );
  }
}
