import 'package:tofan/app/about/about_screen.dart';
import 'package:tofan/app/archive/ui/screens/list_screen.dart';
import 'package:tofan/app/book/ui/screen/book_screen.dart';
import 'package:tofan/app/home/cubit/home_cubit.dart';
import 'package:tofan/app/home/ui/screen/main_screen.dart';
import 'package:tofan/app/news/ui/screen/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screen = 0;
  List<Widget> screens =  [
    MainScreen(),
    ListScreen(),
    BookScreen(),
    AboutScreen(),
  ];
  final HomeCubit _homeCubit = HomeCubit();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          automaticallyImplyLeading: false,
          title: Text(
            "طوفان",
            style: TextStyle(fontSize: 18.sp),
          ),

        ),
        body: Builder(
          builder: (context) {
            return screens[screen];
          },
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: screen,
          backgroundColor: NavigationBarTheme.of(context).backgroundColor,
          onDestinationSelected: (int index) {
            _homeCubit.emitScreen(index);
            setState(() {
              screen = index;
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.newspaper, color: Colors.white),
              icon: Icon(Icons.newspaper_outlined),
              label: 'الأخبار',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.assignment , color: Colors.white),
              icon: Icon(Icons.assignment_outlined),
              label: 'الارشيف',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.library_books , color: Colors.white),
              icon: Icon(Icons.library_books_outlined),
              label: 'كتب',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.more_horiz, color: Colors.white),
              icon: Icon(Icons.more_horiz_outlined),
              label: "حول",
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _homeCubit.close();
    super.dispose();
  }
}
