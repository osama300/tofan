import 'package:tofan/app/news/cubit/news_cubit.dart';
import 'package:tofan/app/news/ui/screen/content_screen.dart';
import 'package:tofan/app/news/ui/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
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
          success: (posts) => ListView.builder(
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
        );
      },
    );
  }
}
