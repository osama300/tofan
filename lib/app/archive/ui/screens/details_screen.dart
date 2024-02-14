import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tofan/app/archive/data/models/archive_response.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final ArchiveResponse archiveResponse;
  const DetailsScreen({
    Key? key,
    required this.archiveResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(archiveResponse.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              archiveResponse.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: archiveResponse.img==null ? const SizedBox.shrink():
              Image.network(
                "https://pal48.ps${archiveResponse.img}",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            HtmlWidget(archiveResponse.description,
              textStyle: TextStyle(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }
}
