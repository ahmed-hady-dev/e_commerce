import 'package:e_commerce/blocs/bloc/payment_bloc.dart';
import 'package:e_commerce/blocs/cart/cart_bloc.dart';
import 'package:e_commerce/blocs/category/category_bloc.dart';
import 'package:e_commerce/blocs/checkout/checkout_bloc.dart';
import 'package:e_commerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:e_commerce/repositories/category/category_repository.dart';
import 'package:e_commerce/repositories/checkout/checkout_repository.dart';
import 'package:e_commerce/repositories/product/product_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/product/product_bloc.dart';
import 'core/blocObserver/bloc_observer.dart';
import 'core/getStorageCacheHelper/get_storage_cache_helper.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_cubit.dart';

import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'firebase_options.dart';
import 'screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  BlocOverrides.runZoned(
    () {
      runApp(EasyLocalization(
        path: 'assets/translation',
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        fallbackLocale: const Locale('en', 'US'),
        child: MyApp(isDark: isDark!),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.isDark}) : super(key: key);
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()..changeTheme(themeModeFromCache: isDark)),
          BlocProvider(
            create: (_) => CartBloc()..add(LoadCart()),
          ),
          BlocProvider(
            create: (_) => PaymentBloc()..add(LoadPaymentMethod()),
          ),
          BlocProvider(
            create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              paymentBloc: context.read<PaymentBloc>(),
              checkoutRepository: CheckoutRepository(),
            ),
          ),
          BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
          BlocProvider(
            create: (_) => CategoryBloc(
              categoryRepository: CategoryRepository(),
            )..add(
                LoadCategories(),
              ),
          ),
          BlocProvider(
            create: (_) => ProductBloc(
              productRepository: ProductRepository(),
            )..add(LoadProducts()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Zero To Unicorn',
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              onGenerateRoute: onGenerateRoute,
              theme: lightTheme(context),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              home: const SplashScreen(),
            );
          },
        ));
  }
}
