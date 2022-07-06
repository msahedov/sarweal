import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sarweal/constants/constants.dart';
import 'package:sarweal/controllers/order.add.controller.dart';

class Info extends GetView<OrderAddController> {
  const Info({Key? key}) : super(key: key);

  // Future<void> uploadOrder() async {
  //   try {
  //     final String token = _storage?.getDataInDisk(StorageKey.accesstoken.toString());
  //     final String uuid = const Uuid().v4();

  //     ///request
  //     final request = http.MultipartRequest("POST", ApiService.orderUploadUrl(uuid));
  //     request.headers.addAll(ApiService.authorizationHeader(token));
  //     request.fields["customerAddress"] = "";
  //     request.fields["note"] = "";

  //     ///
  //     for (var file in controller.itemList ?? []) {
  //       final String fileName = file["image"].path.split("/").last;
  //       final stream = http.ByteStream(DelegatingStream.typed(file["image"].openRead()));
  //       final length = file["image"].length();
  //       final mimeType = lookupMimeType(file["image"].path, headerBytes: [0xFF, 0xD8])!.split('/');
  //       final fileContent = http.MultipartFile('picture', stream, length, filename: fileName, contentType: MediaType(mimeType[0], mimeType[1]));

  //       //   final fileBytes = file.readAsBytesSync();
  //       // final fileContent = http.MultipartFile.fromBytes(
  //       //   "file",
  //       //   fileBytes,
  //       //   filename: fileNameWithExtension,
  //       //   contentType: MediaType(mimeType),
  //       // );
  //       request.files.add(fileContent);
  //     }
  //   } catch (err) {
  //     throw Exception(err);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(color: Colors.white, borderRadius: circular10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                cursorColor: primaryColor_2,
                onChanged: (text) {
                  // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
                },
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    hintText: "Adyňyz",
                    hintStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  cursorColor: primaryColor_2,
                  onChanged: (text) {
                    // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
                  },
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      hintText: "Familiýaňyz",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: primaryColor_2,
                onChanged: (text) {
                  // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
                },
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    hintText: "Telefon belgiňiz",
                    prefixIconConstraints: BoxConstraints(maxHeight: 40),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "+993 ",
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                      ),
                    ),
                    hintStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: primaryColor_2,
                  onChanged: (text) {
                    // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
                  },
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: circular5),
                      hintText: "Eltip berme adresi",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: primaryColor_2,
                onChanged: (text) {
                  // Get.find<OrderAddController>().orderList[indexOfItem]["size"] = text;
                },
                maxLines: 5,
                minLines: 5,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade200),
                        borderRadius: circular5),
                    hintText: "Bellik",
                    hintStyle:
                        Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: ListTile(
            isThreeLine: true,
            horizontalTitleGap: 5,
            leading: Image.asset("assets/images/check.png"),
            title: Text("Ygtybarly söwda", style: Theme.of(context).textTheme.labelLarge),
            subtitle: Text("Harydyňyzy almasaňyz pulyňyzy doly yzyna gaýtarylyp beriler",
                style: Theme.of(context).textTheme.labelSmall),
          ),
        ),
        RaisedButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            "order_btn_txt".tr,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
          ),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: primaryColor_2), borderRadius: circular5),
          color: primaryColor_2,
        ),
      ]),
    );
  }
}
