import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/bloc_observer.dart';
import 'package:jody/cache/cache_helper.dart';
import 'package:jody/pages/account.dart';
import 'package:jody/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    CacheHelper().init();
  //Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return ChangeNotifierProvider(
            create: (_) => ThemeProvider(),
            child:
                Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                //theme: ThemeData.light(),
                //darkTheme: ThemeData.dark(),
                //themeMode: currentMode,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: themeProvider.themeMode == ThemeModeType.dark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                home: Account(),
              );
            }),
          );
        });
  }
}

