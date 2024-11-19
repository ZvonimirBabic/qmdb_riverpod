import 'package:flutter/material.dart';
import 'package:qmdb/views/home/widgets/tabbar.dart';

import '../../shared_widgets/navigation/appbar.dart';
import '../favourites/favourites_screen.dart';
import '../movies_popular/movies_popular_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: QMDBAppBar(),
      bottomNavigationBar: QMDBTabBar(tabController: tabController),
      body: TabBarView(
        controller: tabController,
        children: const [
          MoviesPopularScreen(),
          MoviesFavouritesScreen(),
        ],
      ),
    );
  }
}
