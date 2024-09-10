import 'package:get/get.dart';
import 'package:sgt_owner/feature/More/route_screen/edit_route/controller/edit_route_controller.dart';

class EditRouteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRouteController>(() => EditRouteController());
  }
}