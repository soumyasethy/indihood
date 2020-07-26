import 'package:flutter/material.dart';
import 'package:indihood/utils/constants.dart';
import 'package:indihood/widgets/base_type.dart';

class LoanType extends BaseType {
  LoanType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data["title"],
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  widgetMap["image"],
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Positioned(
                child: Text(
                  data["image"]["label"],
                  style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
                bottom: 64,
                left: 104,
              ),
              widgetMap[Constants.borrowerLocationText]
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 6.0),
                widgetMap[Constants.applicationDetailsText],
                widgetMap[Constants.loanTermsText],
                widgetMap[Constants.repaymentScheduleText],
                SizedBox(height: 6.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
