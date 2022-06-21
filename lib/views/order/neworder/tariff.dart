import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/controllers/order.add.controller.dart';

class Tariff extends GetView<OrderAddController> {
  const Tariff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        children: [
          Text(
            "3-nji ädim.",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text("Töleg usulyny saýlaň", style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
          ),
          ListTile(
            style: ListTileStyle.list,
            selected: controller.paymentMethod?.value == PaymentMethod.full ? true : false,
            onTap: () => controller.setPaymentMethod(PaymentMethod.full),
            shape: RoundedRectangleBorder(borderRadius: circular10, side: controller.paymentMethod?.value == PaymentMethod.full ? const BorderSide(color: primaryColor_2) : BorderSide(color: Colors.grey.shade300)),
            selectedTileColor: primaryColor_2.withOpacity(0.1),
            selectedColor: primaryColor_2.withOpacity(0.4),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            leading: Image.asset("assets/images/pay.png", height: 50),
            title: Text("100% öňünden töleg", style: Theme.of(context).textTheme.titleMedium),
            isThreeLine: true,
            subtitle: Text("1 TL = 1.40 TMT", style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              style: ListTileStyle.list,
              selected: controller.paymentMethod?.value == PaymentMethod.partial ? true : false,
              onTap: () => controller.setPaymentMethod(PaymentMethod.partial),
              shape: RoundedRectangleBorder(borderRadius: circular10, side: controller.paymentMethod?.value == PaymentMethod.partial ? const BorderSide(color: primaryColor_2) : BorderSide(color: Colors.grey.shade300)),
              selectedTileColor: primaryColor_2.withOpacity(0.1),
              selectedColor: primaryColor_2.withOpacity(0.4),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading: Image.asset("assets/images/pay.png", height: 50),
              title: Text("20% öňünden töleg", style: Theme.of(context).textTheme.titleMedium),
              isThreeLine: true,
              subtitle: Text("1 TL = 1.50 TMT", style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
            ),
          ),
          ListTile(
            style: ListTileStyle.list,
            selected: controller.paymentMethod?.value == PaymentMethod.zero ? true : false,
            onTap: () => controller.setPaymentMethod(PaymentMethod.zero),
            shape: RoundedRectangleBorder(borderRadius: circular10, side: controller.paymentMethod?.value == PaymentMethod.zero ? const BorderSide(color: primaryColor_2) : BorderSide(color: Colors.grey.shade300)),
            selectedTileColor: primaryColor_2.withOpacity(0.1),
            selectedColor: primaryColor_2.withOpacity(0.4),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            leading: Image.asset("assets/images/pay.png", height: 50),
            title: Text("Öňünden tölegsiz", style: Theme.of(context).textTheme.titleMedium),
            isThreeLine: true,
            subtitle: Text("1 TL = 1.70 TMT", style: Theme.of(context).textTheme.bodySmall?.copyWith(height: 1.5)),
          ),
          const SizedBox(height: 50),
        ],
      );
    });
  }
}
