import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;
  final String date;

  const NewsCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          imageUrl.isEmpty
              ? const SizedBox()
              : ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: imageUrl.isNotEmpty
                      ? Image.network(
                          imageUrl,
                          height: 145.h,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,

                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                const SizedBox(height: 8),
                Text(date),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
