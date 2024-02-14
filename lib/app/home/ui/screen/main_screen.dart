import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tofan/app/archive/ui/screens/details_screen.dart';
import 'package:tofan/app/home/ui/widgets/slide_card.dart';
import 'package:tofan/app/news/cubit/news_cubit.dart';
import 'package:tofan/app/archive/cubit/archive_cubit.dart';
import 'package:tofan/app/news/ui/screen/content_screen.dart';
import 'package:tofan/app/news/ui/widgets/news_card.dart';

class MainScreen extends StatelessWidget {
  var posts =[];

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           BlocBuilder<ArchiveCubit, ArchiveState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(),
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: () => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("حدث خطا تحقق من اتصالك بالانترنت"),
                        ElevatedButton(
                          child: const Text("حاول مره اخرى"),
                          onPressed: () {
                            // context.read<ArchiveCubit>().getNakba();
                          },
                        ),
                      ],
                    ),
                  ),
                  success: (list) {
                    if(posts.isEmpty){
                      posts=list;
                    }
                    return Expanded(
                     child: ListView(
                       children: [
                         CarouselSlider(
                           options: CarouselOptions(
                             aspectRatio: 1.4.sp,
                             enlargeCenterPage: false,
                             scrollDirection: Axis.horizontal,
                             autoPlay: true,
                           ),
                           items: posts.take(3).map((post) {

                             return InkWell(
                               onTap: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                                   return DetailsScreen(
                                     archiveResponse: post,
                                   );
                                 }));
                               },
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: SlideCard(
                                   title: post.title,
                                   imageUrl: post.img == null ? "" : "https://pal48.ps${post.img}",
                                   content: post.description,
                                   date: post.title,
                                 ),
                               ),
                             );
                           }).toList(),
                         ),
                       ],
                     ),
                   );
                  },
                );
              },
            ),
           SizedBox(height: 10.h,),
           Text("الاخبار" ,style: TextStyle(fontSize:18.sp),),
           BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: () => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("حدث خطا تحقق من اتصالك بالانترنت"),
                        ElevatedButton(
                          child: const Text("حاول مره اخرى"),
                          onPressed: () {
                            context.read<NewsCubit>().getNews();
                          },
                        ),
                      ],
                    ),
                  ),
                  success: (posts) => Expanded(
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return ContentScreen(
                                newsResponse: posts[index],
                              );
                            }));
                            //context.pushNamed(Routes.about);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewsCard(
                              title: posts[index].title,
                              imageUrl: posts[index].img,
                              content: posts[index].body,
                              date: posts[index].date,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            // يمكنك استمرار إضافة المزيد من القسم بناءً على احتياجاتك
          ],
        ),
      ),
    );
  }
}
