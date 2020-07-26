import 'package:flutter/material.dart';
import 'package:indihood/models/schema_data_model.dart';
import 'package:indihood/widgets/widget_manager.dart';
import 'package:provider/provider.dart';

abstract class BaseType extends StatelessWidget {
  //Title of the type
  final String title;

  //Schema of the type
  final Map<String, dynamic> schema;

  //Data corresponding to the schema of the type
  final dynamic data;

  //Constructor to initialise the fields
  const BaseType(this.title, this.schema, this.data, {Key key})
      : super(key: key);

  //check cardinality
  @override
  Widget build(BuildContext context) {
    switch (schema['num']) {
      case "0+":
        return optionalRepeated(
            context, _widgetListRenderer(context, schema, data));
        break;
      case "1":
        return requiredSingle(
            context, _widgetMapRenderer(context, schema, data));
        break;
      case "1+":
        return requiredRepeated(
            context, _widgetListRenderer(context, schema, data));
        break;
      case "0-1":
        return optionalSingle(
            context, _widgetMapRenderer(context, schema, data));
        break;
      default:
        return requiredSingle(
            context, _widgetMapRenderer(context, schema, data));
    }
  }

  //render list of widget
  List<Map<String, Widget>> _widgetListRenderer(
      BuildContext context, Map<String, dynamic> schema, List data) {
    return data.map((data) {
      return _widgetMapRenderer(context, schema, data);
    }).toList();
  }

  //render single widget
  Map<String, Widget> _widgetMapRenderer(
      BuildContext context, Map<String, dynamic> schema, dynamic data) {
    Map<String, dynamic> currentSchema =
        context.watch<SchemaDataModel>().fullSchema[schema["type"]];
    return currentSchema?.map((key, value) {
      if (key == "type") {
        return MapEntry(key, Container());
      }
      Widget baseType = widgetManager(key, value, data[key]);
      return MapEntry(key, baseType);
    });
  }

  //optionalRepeated(0+) num in schema
  Widget optionalRepeated(
      BuildContext context, List<Map<String, Widget>> widgetList) {
    return Container();
  }

  //requiredSingle(1) num in schema
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Container();
  }

  //requiredRepeated(1+) num in schema
  Widget requiredRepeated(
      BuildContext context, List<Map<String, Widget>> widgetList) {
    return Container();
  }

  //optionalSingle(0-1) num in schema
  Widget optionalSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Container();
  }
}
