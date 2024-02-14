import 'package:tofan/app/archive/cubit/archive_cubit.dart';
import 'package:tofan/app/archive/ui/screens/details_screen.dart';
import 'package:tofan/app/news/ui/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveScreen extends StatelessWidget {
  final data;
  const ArchiveScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ArchiveCubit>().init(data['type']);
    return Scaffold(
      appBar: AppBar(
        title: Text(data['name']),
      ),
      body: Center(
        child: BlocBuilder<ArchiveCubit, ArchiveState>(
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
                        // context.read<ArchiveCubit>().getNakba();
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
                        return DetailsScreen(
                          archiveResponse: posts[index],
                        );
                      }));
                   //   context.pushNamed(Routes.about);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsCard(
                        title: posts[index].title,
                        imageUrl: posts[index].img == null
                            ? ""
                            : "https://pal48.ps${posts[index].img}",
                        content: posts[index].description,
                        date: posts[index].title,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
