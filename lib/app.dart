import 'package:flutter/material.dart';
import 'package:state_management_inherited_widget/pages/detail_page.dart';
import 'package:state_management_inherited_widget/pages/home_page.dart';
import 'package:state_management_inherited_widget/services/product_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return ProductService(
      child: MaterialApp(
        navigatorObservers: [routeObserver],
        title: "Learn State Management Lesson 1",
        home: const HomePage(),
        routes: {
          HomePage.id: (context) => const HomePage(),
          DetailPage.id: (context) => const DetailPage(),
        },
      ),
    );
  }
}
