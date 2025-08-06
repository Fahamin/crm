import 'package:crm/app/modules/anatomy/views/anatomy_view.dart';
import 'package:crm/app/modules/information/views/information_view.dart';
import 'package:crm/core/colors.dart';
import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

import '../../skpage.dart';
class TabpageView extends StatefulWidget {
  @override
  _TabpageViewState createState() => _TabpageViewState();
}

class _TabpageViewState extends State<TabpageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: cardbg,
        title:  Text(
          'Information Bank',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize:  Size.fromHeight(48.0),
          child: Container(
            color: cardbg,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              labelStyle:
               TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:  TextStyle(fontSize: 16),
              tabs:  [
                Tab(text: 'Journal'),
                Tab(text: 'Anatomy'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          InformationView(), // ✅ Replaced the recursive call
         // AnatomyView(),
          SketchfabListScreen()
        ],
      ),
    );
  }
}
