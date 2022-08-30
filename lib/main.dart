import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/simple_bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/getStorageCacheHelper/get_storage_cache_helper.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_cubit.dart';

import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Widget? home;
  // FirebaseAuth.instance.userChanges().listen((user) {
  //   if (user == null) {
  //     home = const LoginView();
  //   } else {
  //     home = const HomeView();
  //   }
  // });
  //===============================================================
  DioHelper.init();
  //===============================================================
  await EasyLocalization.ensureInitialized();
  //===============================================================
  await CacheHelper.init();
  await CacheHelper.getTheme ?? await CacheHelper.cacheTheme(value: false);
  bool? isDark = await CacheHelper.getTheme;
  //===============================================================
  Bloc.observer = SimpleBlocObserver();
  runApp(EasyLocalization(
    child: MyApp(isDark: isDark!),
    path: 'assets/translation',
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
    fallbackLocale: const Locale('en', 'US'),
  ));
  // BlocOverrides.runZoned(
  //   () {
  //     runApp(EasyLocalization(
  //       child: MyApp(isDark: isDark!),
  //       path: 'assets/translation',
  //       supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
  //       fallbackLocale: const Locale('en', 'US'),
  //     ));
  //   },
  //   blocObserver: MyBlocObserver(),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => WishlistBloc()..add(StartWishlist())),
          BlocProvider(create: (context) => CartBloc()..add(CartStarted())),
          BlocProvider(create: (context) => ThemeCubit()..changeTheme(themeModeFromCache: isDark)),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Zero To Unicorn',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              onGenerateRoute: onGenerateRoute,
              theme: lightTheme(context),
              // darkTheme: darkTheme(context),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home: const SplashScreen(),
            );
          },
        ));
  }
}
