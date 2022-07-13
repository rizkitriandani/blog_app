import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/blog_post.dart';
import '../controllers/detail_post_controller.dart';

class DetailPostView extends GetView<DetailPostController> {
  DetailPostView({Key? key}) : super(key: key);
  final BlogPost post = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPostView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title.toString(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 24
              ),
            ),

            SizedBox(height: 20,),
            Text(
              post.body.toString(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
