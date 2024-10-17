import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_assignment/constants/color_constant.dart';
import 'package:yoliday_assignment/constants/string_constants.dart';
import '../../constants/number_constant.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  // Sample data for the cards
  final List<Map<String, String>> _projects = [
    {
      'image': 'assets/images/image1.png',
      'title': 'Project One',
      'mainHead': 'Main Head One',
      'subMainHead': 'subMain Head One',
    },
    {
      'image': 'assets/images/image2.png',
      'title': 'Project Two',
      'mainHead': 'Main Head Two',
      'subMainHead': 'subMain Head Two',
    },
    {
      'image': 'assets/images/image3.png',
      'title': 'Project Three',
      'mainHead': 'Main Head Three',
      'subMainHead': 'subMain Head Three',
    },
    {
      'image': 'assets/images/image4.png',
      'title': 'Project Four',
      'mainHead': 'Main Head Four',
      'subMainHead': 'subMain Head Four',
    },
    {
      'image': 'assets/images/image5.png',
      'title': 'Project Five',
      'mainHead': 'Main Head Five',
      'subMainHead': 'subMain Head Five',
    },
    {
      'image': 'assets/images/image5.png',
      'title': 'Project Six',
      'mainHead': 'Main Head Six',
      'subMainHead': 'subMain Head Six',
    },
  ];

  List<Map<String, String>> _filteredProjects = [];

  @override
  void initState() {
    super.initState();
    _filteredProjects = _projects;
    _searchController.addListener(_filterProjects);
  }

  void _filterProjects() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      _filteredProjects = _projects.where((project) {
        return project[StringConstant.textTitle]!
                .toLowerCase()
                .contains(query) ||
            project[StringConstant.textMainHead]!
                .toLowerCase()
                .contains(query) ||
            project[StringConstant.textSubMainHead]!
                .toLowerCase()
                .contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: NumberConstant.doubleTwenty),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: NumberConstant.doubleSixteen),
            child: TextField(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              cursorColor: orangeColor,
              controller: _searchController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: orangeColor),
                ),
                hintText: StringConstant.textSearch,
                hintStyle: const TextStyle(
                  fontFamily: StringConstant.textFontRoboto,
                  fontWeight: FontWeight.w400,
                  fontSize: NumberConstant.doubleSeventeen,
                ),
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.only(right: NumberConstant.doubleEight),
                  child: SvgPicture.asset(
                    StringConstant.icLogoSearch,
                    width: NumberConstant.doubleTwenty,
                    height: NumberConstant.doubleTwenty,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(NumberConstant.doubleEight),
                ),
              ),
            ),
          ),
          const SizedBox(height: NumberConstant.doubleTwenty),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _filteredProjects.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(
                    horizontal: NumberConstant.doubleSixteen,
                    vertical: NumberConstant.doubleEight),
                elevation: NumberConstant.doubleTwo,
                child: Padding(
                  padding: const EdgeInsets.all(NumberConstant.doubleZero),
                  child: Row(
                    children: [
                      Image.asset(
                        _filteredProjects[index][StringConstant.textImage]!,
                        width: NumberConstant.doubleOneTwenty,
                        height: NumberConstant.doubleOneTen,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: NumberConstant.doubleTwenty),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _filteredProjects[index]
                                  [StringConstant.textTitle]!,
                              style: const TextStyle(
                                fontFamily: StringConstant.textFontRoboto,
                                fontWeight: FontWeight.w500,
                                fontSize: NumberConstant.doubleEighteen,
                              ),
                            ),
                            const SizedBox(height: NumberConstant.doubleTwelve),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _filteredProjects[index]
                                            [StringConstant.textMainHead]!,
                                        style: const TextStyle(
                                          fontFamily:
                                              StringConstant.textFontRoboto,
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              NumberConstant.doubleSixteen,
                                        ),
                                      ),
                                      Text(
                                        _filteredProjects[index]
                                            [StringConstant.textSubMainHead]!,
                                        style: const TextStyle(
                                          fontFamily:
                                              StringConstant.textFontRoboto,
                                          fontWeight: FontWeight.w400,
                                          fontSize: NumberConstant.doubleTwelve,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                    width: NumberConstant.doubleFifty),
                                Expanded(
                                  flex: NumberConstant.intZero,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: NumberConstant.doubleEight),
                                    child: SvgPicture.asset(
                                      StringConstant.icLogoCardIcon,
                                      width: NumberConstant.doubleTwentyFour,
                                      height: NumberConstant.doubleThirty,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
