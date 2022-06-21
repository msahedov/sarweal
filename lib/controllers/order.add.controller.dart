import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/models/neworder/item.model.dart';
import 'package:sarweal/models/neworder/new.order.model.dart';

class OrderAddController extends GetxController {
  RxList orderList = [].obs;
  Rx<ShipmentType>? shipmentType;
  Rx<PaymentMethod>? paymentMethod;
  RxList<NewOrderItemModel>? itemList;
  Rx<NewOrderModel>? newOrder;
  @override
  void onInit() {
    shipmentType = ShipmentType.truck.obs;
    paymentMethod = PaymentMethod.full.obs;
    itemList = <NewOrderItemModel>[NewOrderItemModel(quantity: 1)].obs;
    super.onInit();
  }

  @override
  void onClose() {
    itemList?.clear();
    shipmentType = null;
    paymentMethod = null;
    super.onClose();
  }

  ///
  ///Add New Order Item to List
  ///
  void addItem(NewOrderItemModel item) {
    itemList?.insert(itemList?.length ?? 0, item);
    update();
  }

  void deleteItem(int index) {
    if (itemList!.length >= 2) {
      itemList?.removeAt(index);
      update();
    }
  }

  void changeImage(int index, XFile imageFile) {
    itemList?[index].image = imageFile;
    update();
  }

  void incrementQty(int index) {
    itemList?[index].quantity = (itemList?[index].quantity ?? 0) + 1;
    update();
  }

  void decrementQty(int index) {
    if (itemList?[index].quantity == 1) {
      deleteItem(index);
      return;
    }
    itemList?[index].quantity = (itemList?[index].quantity ?? 0) - 1;
    update();
  }

  ///
  ///Payment Type change
  ///
  void setPaymentMethod(PaymentMethod method) {
    if (method != paymentMethod?.value) {
      paymentMethod?.value = method;
      update();
    }
  }

  ///
  ///Shipment Type Change
  ///
  void setShipmentType(ShipmentType type) {
    if (type != shipmentType?.value) {
      shipmentType?.value = type;
      update();
    }
  }
}
