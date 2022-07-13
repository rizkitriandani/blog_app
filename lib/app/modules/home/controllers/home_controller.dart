import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/models/blog_post.dart';
import '../../../services/http_service.dart';
import '../../../utils/logger.dart';

class HomeController extends GetxController {
  HttpService httpService = HttpService();
  RxBool isLoading = false.obs;

  List<BlogPost> allBlogPostList = [];
  List<BlogPost> blogPostList = [];

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
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
      result.data.forEach(
          (element) => allBlogPostList.add(BlogPost.fromJson(element)));
      blogPostList = allBlogPostList;
    } catch (err) {
      logger.d(err);
      throw err;
    } finally {
      isLoading(false);
    }
    update();
  }

  void searchPost(String query) {
    final suggestions = allBlogPostList.where((post) {
      final blogTitle = post.title!.toLowerCase();
      final input = query.toLowerCase();

      return blogTitle.contains(input);
    }).toList();

    blogPostList = suggestions;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
