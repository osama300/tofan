import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'تطبيق طوفان '
              '1.0',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'تطبيق يجمع البيانات والمعلومات والاخبار من الانترنت التي تتناول القضية الفسلطينية',
              style: TextStyle(fontSize: 16.sp),
            ),
            const SizedBox(height: 20),
            Text(
              'التصميم والبيانات',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "حسن الكتف",
              style: TextStyle(fontSize: 18.sp),
            ),
            const SizedBox(height: 30),
            Text(
              'برمجة وتطوير',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "اسامة الشكري",
              style: TextStyle(fontSize: 18.sp),
            ),


          ],
        ),
      ),
    );
  }
}
