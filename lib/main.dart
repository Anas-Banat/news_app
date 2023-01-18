import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/layout/news_app/news_layout.dart';
import 'package:todo_app/layout/todo_app/todo_app.dart';
import 'package:todo_app/shared/bloc_observer.dart';
import 'package:todo_app/shared/network/remote/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver(); // To folow up the app
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // For All App Screen
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        appBarTheme: AppBarTheme(
          //To change the colors of header
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            // For the forst line (time, network)
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 20.0,
        ),
      ),
      // For Dark Theme
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.light, // or .dark,
      home: NewsLayout(),
    );
  }
}
