import 'package:flutter/material.dart';
import 'package:yoliday_assignment/constants/color_constant.dart';
import 'package:yoliday_assignment/constants/number_constant.dart';
import 'package:yoliday_assignment/constants/string_constants.dart';
import 'package:yoliday_assignment/screens/portfolio/projects_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: NumberConstant.intFour, vsync: this); // Four tabs
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            indicatorColor: orangeColor,
            labelColor: orangeColor,
            controller: _tabController,
            labelStyle: const TextStyle(
              fontFamily: StringConstant.textFontRoboto,
              fontWeight: FontWeight.w500,
              fontSize: NumberConstant.doubleSeventeen,
            ),
            tabs: const [
              Tab(text: StringConstant.textProject),
              Tab(text: StringConstant.textSaved),
              Tab(text: StringConstant.textShared),
              Tab(text: StringConstant.textAchievement),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProjectsScreen(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
