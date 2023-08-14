import 'package:app_state/app_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

// import 'firebase_options.dart'; // Generated.
import 'locator.dart';
import 'pages/about/page.dart';
import 'pages/home/screen.dart';
import 'pages/search/page.dart';
import 'router/page_factory.dart';
import 'router/route_information_parser.dart';
import 'router/router_delegate.dart';
import 'router/tab_enum.dart';
import 'theme/theme.dart';

final pageStacks = PageStacks();

void main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  await initializeServiceLocator();

  pageStacks.addPageStack(
    TabEnum.search.name,
    PageStack(
      bottomPage: SearchPage(),
      createPage: PageFactory.createPage,
    ),
  );

  pageStacks.addPageStack(
    TabEnum.about.name,
    PageStack(
      bottomPage: AboutPage(),
      createPage: PageFactory.createPage,
    ),
  );

  runApp(const MyAppLocalizer());
}

class MyAppLocalizer extends StatelessWidget {
  const MyAppLocalizer();

  @override
  Widget build(BuildContext context) {
    const en = Locale('en');

    return EasyLocalization(
      supportedLocales: const [en],
      path: 'assets/translations',
      startLocale: en,
      assetLoader: YamlAssetLoader(),
      fallbackLocale: en,
      child: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _routerDelegate = MyRouterDeleagate(
    pageStacks,
    HomeScreen(pageStacks: pageStacks),
  );

  final _routeInformationParser = MyRouteInformationParser();
  final _backButtonDispatcher = PageStacksBackButtonDispatcher(pageStacks);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      backButtonDispatcher: _backButtonDispatcher,
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routerDelegate,
      theme: themeData,

      // Localization.
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }
}
