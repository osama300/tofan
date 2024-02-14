import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
class PDFViewer extends StatelessWidget {
  PDFViewer({Key? key, required this.pdfAssetPath, required this.title}) : super(key: key);
  final String pdfAssetPath;
  final String title;
  final Completer<PDFViewController> _pdfViewController =
  Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
  StreamController<String>();
  final TextEditingController _pageController = TextEditingController();

  void goTo(int pageNumber) async {
    final PDFViewController pdfController = await _pdfViewController.future;
    final int numberOfPages = await pdfController.getPageCount() ?? 0;

    if (pageNumber > 0 && pageNumber <= numberOfPages) {
      await pdfController.setPage(pageNumber - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
        actions: <Widget>[
          StreamBuilder<String>(
            stream: _pageCountController.stream,
            builder: (_, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   color: Colors.blue[900],
                    // ),
                    child: Text(snapshot.data!),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _pageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'رقم الصفحة',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final int pageNumber =
                        int.tryParse(_pageController.text) ?? 0;
                    goTo(pageNumber);
                  },
                  child: const Text('الانتقال للصفحة'),
                ),
              ],
            ),
          ),
          Expanded(
            child:
              PDF(
                enableSwipe: true,
                swipeHorizontal: true,
                autoSpacing: false,
                pageFling: false,
                onPageChanged: (int? current, int? total) =>
                    _pageCountController.add('${current! + 1} - $total'),
                onViewCreated: (PDFViewController pdfViewController) async {
                  _pdfViewController.complete(pdfViewController);
                  final int currentPage =
                      await pdfViewController.getCurrentPage() ?? 0;
                  final int? pageCount =
                  await pdfViewController.getPageCount();
                  _pageCountController.add('${currentPage + 1} - $pageCount');
                },
              ).cachedFromUrl(
                pdfAssetPath,
                placeholder: (double progress) =>
                    Center(child: Text('$progress %')),
                errorWidget: (dynamic error) =>
                    Center(child: Text(error.toString())),
              ),
          ),
        ],
      ),
    );
  }
}
