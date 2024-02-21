import 'package:dainsleif_journal/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Utils/theme_data.dart';
import 'cubit/data_cubit/data_cubit.dart';
import 'cubit/genshin_cubit/g_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GCubit()),
          BlocProvider(create: (context) => DataCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Genshin Impact',
          theme: MyAppThemeData.themeData,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
