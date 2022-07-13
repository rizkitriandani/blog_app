import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/logger.dart';
import '../../../widgets/loading_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    logger.d("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? LoadingView()
          : ListView.separated(
              itemCount: controller.blogPostList.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(controller.blogPostList[index].title.toString());
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(height: 3, color: Colors.red),
            )),
    );
  }
}
