import 'package:demo_app/presentation/main/view/profile_page.dart';
import 'package:flutter/material.dart';
import '../shared_prefrences/shared_pref.dart';
import 'main/view/profile_view.dart';
import 'main/view/user_network_api_list_data.dart';

class dashBoardScreen extends StatefulWidget {

  const dashBoardScreen({super.key,});

  @override
  State<dashBoardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<dashBoardScreen>
    with SingleTickerProviderStateMixin {




  late TabController tabController;
  SharedPref sharedPref = SharedPref();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          tabs: const [
            Tab(text: "Profile"),
            Tab(text: "User List Data"),
            Tab(text: "Local data store user details"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ProfileScreen(),
          UserListPage(),
          ProfileView(),

        ],
      ),
    );
  }
}
