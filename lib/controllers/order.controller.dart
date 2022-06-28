import 'package:get/state_manager.dart';
import 'package:sarweal/models/order.model.dart';
import 'package:sarweal/service/order.service.dart';

class OrderController extends GetxController with StateMixin<List<OrderModel>> {
  var orderList = <OrderModel>[].obs;
  var isLoading = true.obs;
  var connection = true.obs;

  @override
  void onInit() {
    connection.value = true;
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async {
    //isLoading.value = true;
    change(null, status: RxStatus.loading());
    try {
      await OrderService?.getOrders().then((data) {
        if (data != null) {
          change(data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error("Data error"));
        }
      });
    } catch (err) {
      throw Exception(err);
    }
  }
}
