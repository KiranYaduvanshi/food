import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_user/common_widgets/common_app_bar.dart';
import 'package:food_user/home/map/map_controller.dart';
import 'package:food_user/utils/app_colors.dart';
import 'package:food_user/utils/app_strings.dart';
import 'package:food_user/utils/inpuFieldDecoration.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

class AddAddressScreen extends StatelessWidget {
  MapImplementController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    print("current location ---- ${controller.currentPosition.value.latitude}");
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          maps(context).expand(),
          SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height * 0.20,
            maxHeight: MediaQuery.of(context).size.height * 0.20,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            panelBuilder: (crt) => ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: bodyWidget(context),
            ),
          ),
          //.positioned(bottom: 5),
          AppBarWidget().positioned(top: 10, left: 10),
        ]),
      ),
    );
  }

  Widget maps(BuildContext context) {
    return Container(
      child: Obx(
        () => GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          onTap: (value) async {
            controller.getAddressFromLatLng(
                Position(latitude: value.latitude, longitude: value.longitude));
            controller.markers.clear();
            controller.markers.add(
              Marker(
                consumeTapEvents: true,
                markerId: const MarkerId("home"),
                draggable: true,
                onDragEnd: (value) {},
                position: LatLng(value.latitude, value.longitude),
              ),
            );
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(
                controller.currentPosition.value.latitude,
                controller.currentPosition.value.longitude,
              ),
              zoom: 14),
          markers: Set<Marker>.of(controller.markers),
          onMapCreated: (GoogleMapController ctr) {
            controller.mapController = ctr;
          },
        ),
      ),
    );
  }

  Widget yourLocation(BuildContext context) {
    return InkWell(
      onTap: () async {
        await controller.mapController!.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(
                  controller.currentPosition.value.latitude,
                  controller.currentPosition.value.longitude,
                ),
                zoom: 17.47),
          ),
        );
      },
      child: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                color: Vx.gray400,
                offset: Offset(2, 2),
              ),
            ],
          ),
          width: MediaQuery.of(context).size.width * 1 - 75,
          alignment: AlignmentDirectional.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/ic_location.png",
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1 - 145,
                    child: "${controller.currentAddress}"
                        .text
                        .bold
                        .overflow(TextOverflow.ellipsis)
                        .make()
                        .px(10),
                  ),
                ],
              ),
              const Icon(CupertinoIcons.heart),
            ],
          ).px12()),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.black,
                    size: 24,
                  ),
                  Container(
                    width: 150,
                    child: controller.currentAddress.value.text
                        .size(13)
                        .maxLines(2)
                        .bold
                        .color(AppColors.black)
                        .ellipsis
                        .make(),
                  ),
                ],
              ).py(12).px(5),
              InkWell(
                onTap: () => controller.getMap(),
                child: AppStrings.useCurrentLoction.text
                    .size(12)
                    .color(AppColors.red)
                    .bold
                    .make(),
              ).px(8)
            ],
          ),
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                isDismissible: false,
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (_) {
                  return completeAddress();
                },
              );
            },
            style:
                ElevatedButton.styleFrom(primary: AppColors.red, elevation: 4),
            child: AppStrings.enterAddress.text.bold.white.make(),
          ),
        ).px(20).py(10)
      ],
    );
  }

  Widget completeAddress() {
    return Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.cancel_outlined),
          ).px(15).py(10),
          AppStrings.enterAddress.text.size(16).semiBold.make().px(10),
          Divider(
            color: Colors.grey.shade300,
            thickness: 1,
          ),
          AppStrings.saveAddressAs.text.make().px(10),
          Row(
            children: [
              for (int i = 0; i < 3; i++) commonTypeAddress("Home", i),
              // commonTypeAddress("Work"),
              // commonTypeAddress("Hotel"),
              // commonTypeAddress("Other"),
            ],
          ).px(10),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]')),
            ],
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {},
            decoration: CustomeInputDecoration.formDecorationSquare(
                "Complete Address", AppStrings.email),
          ).px(10).py8(),
          TextFormField(
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {},
            decoration: CustomeInputDecoration.formDecorationSquare(
                "Floor(Optional)", ""),
          ).px(10).py8(),
          TextFormField(
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {},
            decoration: CustomeInputDecoration.formDecorationSquare(
                "Nearby landmark(optional)", ""),
          ).px(10).py8(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: AppColors.red),
              child: "Save Address".text.white.make(),
            ),
          ).px(10)
        ],
      ),
    );
  }

  Widget commonTypeAddress(String title, int index) {
    return Obx(
      () => InkWell(
        onTap: () {
          controller.value.value = index;
          controller.selectStatus.value = true;
          print("if part --> $index ${controller.selectStatus.value}");
        },
        child: Container(
          width: 60,
          decoration: BoxDecoration(
            color:
                controller.value.value == index ? AppColors.red : Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            boxShadow: [
              BoxShadow(color: AppColors.red, blurRadius: 2),
            ],
          ),
          child: Center(
            child: title.text
                .size(13)
                .color(controller.value.value == index
                    ? AppColors.white
                    : AppColors.black)
                .make()
                .p(4),
          ),
        ).p(5),
      ),
    );
  }
}
