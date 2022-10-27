import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:maahey_flutter_task/model/brawery_model.dart';
import 'package:maahey_flutter_task/services/brawer_services.dart';

class BraweryController extends GetxController {
  BraweryServices braweryServices = BraweryServices();

  final brawerList = <braweryModel>[].obs;
  bool loader = false;

  fetchBrawerList() async {
    loader = true;
    update();
    var itemList = await braweryServices.fetchRequestedItems();
    if (itemList.length != 0) {
      brawerList.assignAll(itemList);
      loader = false;
      update();
    }
  }
}
