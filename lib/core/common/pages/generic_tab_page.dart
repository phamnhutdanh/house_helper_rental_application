import 'package:flutter/material.dart';
import 'package:house_helper_rental_application/core/theme/app_palette.dart';

class GenericTabPage extends StatelessWidget {
  final String title;
  final List<Widget> tabs;
  final List<Widget> children;
  final bool isScrollableTab;

  const GenericTabPage({
    super.key,
    required this.title,
    required this.tabs,
    required this.children,
    required this.isScrollableTab,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: AppPalette.whiteColor,
        appBar: AppBar(
          title: Text(
            title,
            style: const TextStyle(
              color: AppPalette.blackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppPalette.transparentColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppPalette.greyColor.withOpacity(0.1),
                ),
                child: TabBar(
                  isScrollable: isScrollableTab,
                  tabAlignment: isScrollableTab ? TabAlignment.start : null,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: AppPalette.transparentColor,
                  indicator: const BoxDecoration(
                    color: AppPalette.thirdColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: AppPalette.whiteColor,
                  unselectedLabelColor: AppPalette.blackColor,
                  tabs: tabs,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: children,
        ),
      ),
    );
  }
}
