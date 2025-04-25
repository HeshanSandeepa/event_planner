import 'package:event_planner/src/core/utils/strings.dart';
import 'package:event_planner/src/features/events/presentation/event_home_page.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/src/shared/widgets/drawer_view.dart';

import '../../features/auth/presentation/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.title),
      ),
      drawer: const DrawerView(),
      body: TabBarView(
        controller: _tabController,
        children: const [EventHomePage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: Strings.tabHome),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: Strings.tabProfile),
        ],
      ),
    );
  }
}
