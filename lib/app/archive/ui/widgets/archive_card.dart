import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tofan/app/archive/data/models/data_request.dart';
import 'package:tofan/core/routes/routes.dart';

class ArchiveCard extends StatelessWidget {
  final String name;
  DataRequest? type;
  bool isQuiz ;
  ArchiveCard({super.key, required this.name,
    this.type =DataRequest.aqsa,
    this.isQuiz=false

  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(isQuiz){
          Navigator.pushNamed(context ,Routes.quiz);
        }else{
          Navigator.pushNamed(context, Routes.archive,
              arguments: {'name': name, "type": type});
        }
      },
      child: Card(
        elevation: 8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF359488).withAlpha(70),
                const Color(0xFF359488).withAlpha(130),
                const Color(0xFF359488)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(3, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Text(
            name,
            style: TextStyle(fontSize: 16.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
