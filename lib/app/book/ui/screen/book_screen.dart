import 'package:tofan/app/book/ui/data/insert/list_book.dart';
import 'package:tofan/app/book/ui/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0


          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookWidget(
              imageUrl: books[index].imageUri,
              bookName: books[index].name,
              url: books[index].url,
            );
          },
        ),
      ),
    );
  }
}
