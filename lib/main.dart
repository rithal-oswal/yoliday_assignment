import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_assignment/screens/home/home_screen.dart';
import 'package:yoliday_assignment/screens/input/input_screen.dart';
import 'package:yoliday_assignment/screens/portfolio/portfolio_screen.dart';
import 'package:yoliday_assignment/screens/profile/profile_screen.dart';

import 'constants/color_constant.dart';
import 'constants/number_constant.dart';
import 'constants/string_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: StringConstant.boolFalse,
      theme: ThemeData(
        fontFamily: StringConstant.textFontPoppins,
        useMaterial3: StringConstant.boolTrue,
        primarySwatch: blueColor,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List tabsList = [
    (
      title: StringConstant.textHome,
      icon: StringConstant.icLogoHome,
    ),
    (
      title: StringConstant.textPortfolio,
      icon: StringConstant.icLogoPortfolio,
    ),
    (
      title: StringConstant.textInput,
      icon: StringConstant.icLogoInput,
    ),
    (
      title: StringConstant.textProfile,
      icon: StringConstant.icLogoProfile,
    ),
  ];
  var selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = NumberConstant.intOne;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: NumberConstant.doubleZero,
        title: Text(
          "${tabsList[selectedIndex].title}",
          style: const TextStyle(
            fontFamily: StringConstant.textFontRoboto,
            fontWeight: FontWeight.w500,
            fontSize: NumberConstant.doubleTwentyFour,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: NumberConstant
                    .doubleSeventeen), // Add padding from the top and right
            child: Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    StringConstant
                        .icLogoBag, // Replace with your first SVG path
                    width: NumberConstant.doubleTwentyFour,
                    height: NumberConstant.doubleTwentyFour,
                  ),
                  onPressed: () {
                    //todo add functionality later
                  },
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    StringConstant
                        .icLogoBell, // Replace with your second SVG path
                    width: NumberConstant.doubleThirty,
                    height: NumberConstant.doubleThirty,
                  ),
                  onPressed: () {
                    //todo add functionality later
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: (selectedIndex == NumberConstant.intZero)
          ? const HomeScreen()
          : (selectedIndex == NumberConstant.intOne)
              ? const PortfolioScreen()
              : (selectedIndex == NumberConstant.intTwo)
                  ? const InputScreen()
                  : (selectedIndex == NumberConstant.intThree)
                      ? const ProfileScreen()
                      : null,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        showSelectedLabels: StringConstant.boolTrue,
        showUnselectedLabels: StringConstant.boolTrue,
        selectedItemColor: orangeColor,
        unselectedItemColor: greyColor,
        currentIndex: selectedIndex,
        iconSize: NumberConstant.doubleThirty,
        selectedFontSize: NumberConstant.doubleTwelve,
        unselectedFontSize: NumberConstant.doubleTwelve,
        type: BottomNavigationBarType.fixed,
        items: List.generate(tabsList.length, (index) {
          final tab = tabsList[index];
          final isSelected = index == selectedIndex;
          return BottomNavigationBarItem(
            backgroundColor: whiteColor,
            icon: SvgPicture.asset(
              tab.icon,
              width: NumberConstant.doubleThirty,
              height: NumberConstant.doubleThirty,
              color: isSelected ? orangeColor : greyColor,
            ),
            label: tab.title,
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: (selectedIndex == NumberConstant.intOne)
          ? Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: NumberConstant.doubleSixteen,
                  vertical: NumberConstant.doubleEight),
              decoration: BoxDecoration(
                color: orangeColor,
                borderRadius:
                    BorderRadius.circular(NumberConstant.doubleThirty),
              ),
              child: GestureDetector(
                onTap: () {
                  // Action for filter button
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      StringConstant.icLogoFilterList,
                      width: NumberConstant.doubleThirty,
                      height: NumberConstant.doubleThirty,
                      color: whiteColor,
                    ),
                    const SizedBox(width: NumberConstant.doubleEight),
                    const Text(
                      StringConstant.textFilter,
                      style: TextStyle(
                          color: whiteColor,
                          fontFamily: StringConstant.textFontRoboto,
                          fontWeight: FontWeight.w400,
                          fontSize: NumberConstant.doubleTwenty),
                    ),
                  ],
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
