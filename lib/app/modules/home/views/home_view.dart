import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
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
        title: Text("Blog Post"),
      ),
      body: GetBuilder<HomeController>(
          init: controller,
          initState: (_) {},
          builder: (_) => controller.isLoading.value
              ? LoadingView()
              : Column(
                  children: [
                    TextField(
                      controller: controller.searchController,
                      style: GoogleFonts.openSans(
                          color: Colors.black, fontSize: 15),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Search a blog post',
                          hintStyle: GoogleFonts.openSans(
                              color: const Color(0xff6F7075)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff6F7075),
                          )),
                        onChanged:(_) => controller.searchPost(controller.searchController.text),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.blogPostList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = controller.blogPostList[index];

                          return InkWell(
                            onTap: () => Get.toNamed(Routes.DETAIL_POST,arguments: post),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                child: Text(post.title.toString())),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(height: 3, color: Colors.grey),
                      ),
                    ),
                  ],
                )),
    );
  }


}
