import 'package:get/state_manager.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:sarweal/service/order.service.dart';

class OrderController extends GetxController with StateMixin<List<OrderModel>> {
  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async {
    change(null, status: RxStatus.loading());
    await OrderService?.getOrders().then((data) {
      if (data != null) {
        if (data.isNotEmpty) {
          change([], status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Data error"));
      }
    });
  }
}
