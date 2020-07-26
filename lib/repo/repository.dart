import 'package:indihood/models/schema_data_model.dart';
import 'package:indihood/services/api_service.dart';
import 'package:indihood/utils/constants.dart';

class Repository {
  //Fetch data
  static Future<SchemaDataModel> fetchData() async {
    var fullSchema = await ApiService.get(Constants.schemaApi);
    var fullData = await ApiService.get(Constants.recordsApi);
    return SchemaDataModel(fullSchema: fullSchema, fullData: fullData);
  }
}
