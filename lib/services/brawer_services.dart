import 'dart:convert';

import 'package:maahey_flutter_task/constants/api_manager.dart';
import 'package:maahey_flutter_task/constants/config.dart';
import 'package:maahey_flutter_task/model/brawery_model.dart';

class BraweryServices {
  ApiManager apiManager = ApiManager();

  Future<List<braweryModel>> fetchRequestedItems() async {
    var response = await apiManager.getRequest(getBraweriesRoute);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => braweryModel.fromJson(job)).toList();
    } else {
      throw Exception('Failed to get data');
    }
  }
}
