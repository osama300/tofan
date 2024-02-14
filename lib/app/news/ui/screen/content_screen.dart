import 'package:tofan/app/news/data/models/news_response.dart';
import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  final NewsResponse newsResponse;

  const ContentScreen({
    Key? key,
    required this.newsResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل الخبر'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              newsResponse.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                newsResponse.img,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                newsResponse.date,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              newsResponse.body,
              style: const TextStyle(
                fontSize: 18,
               // color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
