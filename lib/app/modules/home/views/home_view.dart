import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (controller.isBusy.value)
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        try {
                          Get.toNamed(controller.bannerModel?.route ?? "");
                        } on Exception catch (e, s) {
                          log('exception in navigating, like the route is null',
                              stackTrace: s);
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      controller.bannerModel?.banner ?? ""))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Tap on banner to go to ${controller.bannerModel?.route}"),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
