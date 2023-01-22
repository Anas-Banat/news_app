import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/layout/news_app/cubit/cubit.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/layout/news_app/news_layout.dart';
import 'package:todo_app/shared/bloc_observer.dart';
import 'package:todo_app/shared/network/local/cache_helper.dart';
import 'package:todo_app/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // To do the below methods and then do await method

  Bloc.observer = MyBlocObserver(); // To folow up the app
  DioHelper.init();
  await CacheHelper.init(); // To save a small data as a cache

  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark!));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
            ..getScience(),
        ),
        BlocProvider(
          create: (context) => NewsCubit()
            ..changeAppMode(
              formShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
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
                titleSpacing: 20.0,
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
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            // For Dark Theme
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,

                //To change the colors of header
                backgroundColor: HexColor('333739'),
                iconTheme: IconThemeData(color: Colors.white),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  // For the forst line (time, network)
                  statusBarColor: HexColor('333739'),
                  statusBarBrightness: Brightness.light,
                ),
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light, // light or dark,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
