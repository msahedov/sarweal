import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/controllers/order.add.controller.dart';
import 'package:sarweal/models/neworder/item.model.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        autoRemove: false,
        assignId: true,
        init: OrderAddController(),
        builder: (OrderAddController controller) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "1-nji ädim.",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(height: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Text(
                      "Harydyň kodyny ýa-da ssylkasyny girizmeli ýa-da skrinşot(suratyny) ýüklemeli, hem-de ululygyny (razmeryny) görkezmeli.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.5, wordSpacing: 1.5, letterSpacing: 0.5, color: Colors.grey)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.itemList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                        indexOfItem: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: RaisedButton.icon(
                      onPressed: () {
                        controller.addItem(NewOrderItemModel(quantity: 1));
                      },
                      color: primaryColor_2,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      shape: RoundedRectangleBorder(borderRadius: circular5),
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: Text(
                        "Ýene-de goşmak",
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
                      )),
                )
              ],
            ),
          );
        });
    //});
  }
}

class ItemCard extends GetView<OrderAddController> {
  ItemCard({Key? key, required this.indexOfItem}) : super(key: key);

  ///
  TextEditingController? linkController;

  ///
  TextEditingController? sizeController;

  ///
  TextEditingController? colorController;

  ///
  final int indexOfItem;

  @override
  Widget build(BuildContext context) {
    linkController = TextEditingController(text: controller.itemList?[indexOfItem].link);
    colorController = TextEditingController(text: controller.itemList?[indexOfItem].color);
    sizeController = TextEditingController(text: controller.itemList?[indexOfItem].size);

    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(boxShadow: [shadow], color: Colors.white, borderRadius: circular10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  " #${indexOfItem + 1}",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black54),
                ),
                IconButton(
                  onPressed: () {
                    controller.deleteItem(indexOfItem);
                  },
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  icon: const Icon(IconlyLight.closeSquare, size: 30, color: Colors.black54),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 220,
                    width: 130,
                    child: InkWell(
                        onTap: () async {
                          try {
                            final image =
                                await ImagePicker().pickImage(source: ImageSource.gallery) as XFile;
                            controller.changeImage(indexOfItem, image);
                          } catch (err) {
                            debugPrint(err.toString());
                          } finally {}
                        },
                        child: ClipRRect(
                            borderRadius: circular5,
                            child: controller.itemList?[indexOfItem].image != null
                                ? Image.file(
                                    File(controller.itemList?[indexOfItem].image?.path ?? ""),
                                    height: 220,
                                    width: 130,
                                    fit: BoxFit.contain)
                                : Icon(
                                    IconlyLight.image2,
                                    size: 30,
                                    color: Colors.grey.shade400,
                                  ))),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: circular5,
                    ),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5, left: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: linkController,
                              keyboardType: TextInputType.url,
                              cursorColor: primaryColor_2,
                              onChanged: (link) {
                                controller.itemList?[indexOfItem].link = link;
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: circular5),
                                  hintText: "p_url".tr,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey)),
                            ),
                            const Spacer(flex: 1),
                            TextFormField(
                              controller: sizeController,
                              keyboardType: TextInputType.text,
                              cursorColor: primaryColor_2,
                              onChanged: (size) {
                                controller.itemList?[indexOfItem].size = size;
                                //controller.changeSize(indexOfItem, size);
                              },
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black),
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: circular5),
                                  hintText: "p_size".tr,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey)),
                            ),
                            const Spacer(flex: 1),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: colorController,
                              cursorColor: primaryColor_2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.black),
                              onChanged: (color) {
                                controller.itemList?[indexOfItem].color = color;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none, borderRadius: circular5),
                                  hintText: "p_color".tr,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.grey)),
                            ),
                            const Spacer(flex: 2),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    controller.decrementQty(indexOfItem);
                                  },
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.adaptivePlatformDensity,
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade100, borderRadius: circular5),
                                    child: Text(
                                      "${controller.itemList?[indexOfItem].quantity}",
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.incrementQty(indexOfItem);
                                  },
                                  padding: EdgeInsets.zero,
                                  visualDensity: VisualDensity.adaptivePlatformDensity,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
