import 'package:tofan/app/archive/data/models/data_request.dart';
import 'package:tofan/app/archive/ui/widgets/archive_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// var logger = Logger();

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 10.w,
        shrinkWrap: true,
        children:  [
          ArchiveCard(
            name: 'النكبة الفلسطينية',
            type: DataRequest.nakba,
          ),
          ArchiveCard(
            name: 'المجازر الصهوينية',
            type: DataRequest.massacre,
          ),
          ArchiveCard(
            name: 'المسجد الاقصى',
            type: DataRequest.aqsa,
          ),
          ArchiveCard(
            name: 'الاماكن الاثرية',
            type: DataRequest.place,
          ),
          ArchiveCard(
            name: 'المقالات',
            type: DataRequest.articles,
          ),
          ArchiveCard(
            name: 'الاسئلة',
            isQuiz: true,
          ),
        ],
      ),
    );
  }
}
