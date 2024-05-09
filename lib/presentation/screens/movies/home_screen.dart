import 'package:flutter/material.dart';

import '../../views/views.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;
  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: pageIndex),
    );
  }
}
