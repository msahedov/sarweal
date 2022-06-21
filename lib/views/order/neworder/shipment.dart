import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/constants/enums.dart';
import 'package:sarweal/controllers/order.add.controller.dart';

class Shipment extends GetView<OrderAddController> {
  const Shipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
        children: [
          Text(
            "2-nji ädim.",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text("Getirmegiň usulyny saýlaň",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
          ),
          ListTile(
            isThreeLine: true,
            tileColor: Colors.white,
            selected: controller.shipmentType?.value == ShipmentType.truck ? true : false,
            onTap: () {
              controller.setShipmentType(ShipmentType.truck);
            },
            selectedTileColor: primaryColor_2.withOpacity(0.1),
            selectedColor: primaryColor_2.withOpacity(0.4),
            shape: RoundedRectangleBorder(
                borderRadius: circular10,
                side: controller.shipmentType?.value == ShipmentType.truck
                    ? const BorderSide(color: primaryColor_2)
                    : BorderSide(color: Colors.grey.shade300)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            leading:
                SvgPicture.asset("assets/images/truck.svg", height: 50, semanticsLabel: 'truck'),
            title: Text("Maşyn bilen getirmek",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 2)),
            subtitle: RichText(
                text: TextSpan(
                    text:
                        "\nMaşyn bilen getirmek \nEltip berme wagty 20-dan 25 güne çenli \nBahasy",
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                  TextSpan(
                      text: "\nHer 1kg üçin 35 tmt",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(height: 2, color: primaryColor_1))
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 50),
            child: ListTile(
              isThreeLine: true,
              tileColor: Colors.white,
              selected: controller.shipmentType?.value == ShipmentType.plane ? true : false,
              onTap: () {
                controller.setShipmentType(ShipmentType.plane);
              },
              selectedTileColor: primaryColor_2.withOpacity(0.1),
              selectedColor: primaryColor_2.withOpacity(0.4),
              shape: RoundedRectangleBorder(
                  borderRadius: circular10,
                  side: controller.shipmentType?.value == ShipmentType.plane
                      ? const BorderSide(color: primaryColor_2)
                      : BorderSide(color: Colors.grey.shade300)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              leading:
                  SvgPicture.asset("assets/images/plane.svg", height: 50, semanticsLabel: 'plane'),
              title: Text("Uçar bilen getirmek",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 2)),
              subtitle: RichText(
                  text: TextSpan(
                      text:
                          "\nUçar bilen getirmek \nEltip berme wagty 10-dan 14 güne çenli \nBahasy",
                      style: Theme.of(context).textTheme.bodySmall,
                      children: [
                    TextSpan(
                        text: "\nHer 1kg üçin 80 tmt",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(height: 2, color: primaryColor_1))
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
