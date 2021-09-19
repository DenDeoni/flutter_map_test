import 'package:dactyl_test_app/pages/geo_map.dart';
import 'package:dactyl_test_app/pages/home_page.dart';
import 'package:dactyl_test_app/pages/not_found.dart';
import 'package:dactyl_test_app/pages/restaurant_detail.dart';
import 'package:dactyl_test_app/utils/consts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/restaurant_detail/rest_detail_bloc.dart';
import 'bloc/restaurants/restaurants_bloc.dart';
import 'generated/locale_keys.g.dart';
import 'models/details_route_params.dart';
import 'providers/rest_detail_data_provider.dart';
import 'providers/restaurants_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => RestaurantsDataProvider()),
        RepositoryProvider(create: (_) => RestDetailDataProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RestaurantsBloc>(
            create: (BuildContext context) => RestaurantsBloc(RestaurantsDataProvider()),
          ),
          BlocProvider<RestDetailBloc>(
            create: (BuildContext context) => RestDetailBloc(RestDetailDataProvider(), id: ''),
          ),
        ],
        child: EasyLocalization(
          supportedLocales: [
            Locale('en', 'US'),
            Locale('cs', 'CZ'),
          ],
          path: 'assets/translations',
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.title.tr(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: EasyLocalization.of(context)!.supportedLocales.contains(Intl.systemLocale.toLocale())
          ? Locale(Intl.systemLocale)
          : Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HOME,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return NotFound();
          },
        );
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (context) {
              return HomePage();
            });
          case RestaurantDetail.routeName:
            final DetailsRouteParameters args = settings.arguments as DetailsRouteParameters;
            return MaterialPageRoute(
              builder: (context) {
                return RestaurantDetail(args.restaurantModel, args.id);
              },
            );
          case GeoMap.routeName:
            return MaterialPageRoute(builder: (context) {
              return GeoMap();
            });
          default:
            return MaterialPageRoute(
              builder: (context) {
                return NotFound();
              },
            );
        }
      },
    );
  }
}
