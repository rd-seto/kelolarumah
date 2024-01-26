import 'package:flutter/material.dart';

class TenantsProfileSetting extends StatefulWidget {
  const TenantsProfileSetting({super.key});

  @override
  State<TenantsProfileSetting> createState() => _TenantsProfileSettingState();
}

class _TenantsProfileSettingState extends State<TenantsProfileSetting>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          padding: EdgeInsets.zero,
          isScrollable: true,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Icon(Icons.person_add_alt_1_outlined),
                SizedBox(width: 6),
                Text("Edit Profile")
              ]),
            ),
            Tab(
              icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline),
                    SizedBox(width: 6),
                    Text("Security")
                  ]),
            ),
            Tab(
              icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add_a_photo_outlined),
                    SizedBox(width: 6),
                    Text("Updated Image")
                  ]),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
