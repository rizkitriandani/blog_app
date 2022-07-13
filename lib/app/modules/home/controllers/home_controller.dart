import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/blog_post.dart';
import '../../../services/http_service.dart';
import '../../../utils/logger.dart';
import 'package:dio/dio.dart' as d;

class HomeController extends GetxController {
  HttpService httpService = HttpService();
  RxBool isLoading = false.obs;

  List<BlogPost> blogPostList = [];
 

  @override
  void onInit() async {
    logger.d("INIT HOME CONTROLLER");
    print("INIT HOME CONTROLLER");
    await httpService.init();
    await fetchBlogPosts();

    super.onInit();
  }

  Future<void> fetchBlogPosts() async {
    dynamic result;
    isLoading(true);
    try {
      logger.d("Fetching blog posts");
      result = await httpService.request(url: "/posts", method: Method.GET);
      result.data
          .forEach((element) => blogPostList.add(BlogPost.fromJson(element)));
    } catch (err) {
      logger.d(err);
      throw err;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
