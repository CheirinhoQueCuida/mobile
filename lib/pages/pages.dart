import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/pages/items/catspage.dart';
import 'configpage.dart';
import 'homepage.dart';

// ignore: must_be_immutable
class Pages extends StatefulWidget {
  Widget currentPage = HomePage();
  int tab;
  Pages({Key key, this.currentPage, this.tab = 0}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  initState() {
    super.initState();
    _selectTab(widget.tab);
  }

  final List<Widget> pages = <Widget>[
    HomePage(),
    CatsPage(),
    ConfigPage(),
  ];

  void _selectTab(int tabI) {
    setState(() {
      widget.tab = tabI;
      switch (tabI) {
        case 0:
          widget.currentPage = HomePage();
          break;
        case 1:
          widget.currentPage = CatsPage();
          break;
        case 2:
          widget.currentPage = ConfigPage();
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.background, boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black.withOpacity(.2))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 6,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: AppColors.primaryColor,
                backgroundColor: AppColors.background,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    iconColor: AppColors.primaryColor,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColors.background),
                  ),
                  GButton(
                    icon: Icons.eco,
                    text: 'Óleos',
                    iconColor: AppColors.primaryColor,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColors.background),
                  ),
                  // GButton(
                  //   icon: Icons.search,
                  //   text: 'Procurar',
                  //   iconColor: AppColors.primaryColor,
                  // ),
                  GButton(
                    icon: Icons.info,
                    text: 'Info',
                    iconColor: AppColors.primaryColor,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: AppColors.background),
                  ),
                ],
                selectedIndex: widget.tab,
                onTabChange: (i) {
                  this._selectTab(i);
                }),
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            child: child,
            opacity: animation,
          );
        },
        child: widget.currentPage,
      ),
    );
  }
}
