import 'package:flutter/material.dart';
import 'package:indihood/models/schema_data_model.dart';
import 'package:indihood/repo/repository.dart';
import 'package:indihood/widgets/widget_manager.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

// Main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indihood Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF122D49),
        scaffoldBackgroundColor: Color(0xFFF1F5F5),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context).textTheme.headline6.copyWith(
                  color: Color(0xFF3A474E), fontWeight: FontWeight.w700),
              bodyText1: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Color(0xFF3A474E), fontSize: 16),
              bodyText2: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Color(0xFF3A474E), fontWeight: FontWeight.w500),
              caption: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(color: Color(0xFF3A474E)),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureProvider<SchemaDataModel>(
        create: (_) => Repository.fetchData(),
        initialData: null,
        child: _WidgetizedPage(),
      ),
    );
  }
}

//render widgets dynamically
class _WidgetizedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchemaDataModel schemaDataModel = context.watch<SchemaDataModel>();
    if (schemaDataModel == null) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return widgetManager(
      "loan1",
      schemaDataModel.fullData["loan1"],
      schemaDataModel.fullData["loan1"],
    );
  }
}
