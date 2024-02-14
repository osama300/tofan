import 'package:tofan/app.dart';
import 'package:tofan/app/archive/cubit/archive_cubit.dart';
import 'package:tofan/app/home/cubit/home_cubit.dart';
import 'package:tofan/app/news/cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// var logger = Logger(
//   printer: PrettyPrinter(),
// );
//
// var loggerNoStack = Logger(
//   printer: PrettyPrinter(methodCount: 0),
// );

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()),
        BlocProvider(create: (context) => ArchiveCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: const TofanApp(),
    ),
  );
  //best();dd
}