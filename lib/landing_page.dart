import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/help.dart';
import 'pages/home.dart';
import 'pages/profile.dart';
import 'pages/setting.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key, required this.page, required this.extra})
      : super(key: key);
  final String page;
  final String extra;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<String> pages = [
    'home',
    'about',
    'profile',
    'settings',
    'help',
  ];

  List<IconData> icons = [
    Icons.home,
    Icons.pages_rounded,
    Icons.person_rounded,
    Icons.settings_rounded,
    Icons.help_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Container(
              width: size.width * 0.1,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: icons.map((e) {
                  return NavItem(
                    iconData: e,
                    selected: icons.indexOf(e) == pages.indexOf(widget.page),
                    onTap: () {
                      if (icons.indexOf(e) == 1) {
                        Navigator.pushNamed(context,
                            '/main/${pages[icons.indexOf(e)]}/Allison');
                      } else {
                        Navigator.pushNamed(
                            context, '/main/${pages[icons.indexOf(e)]}');
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            Container(
              width: size.width * 0.9,
              child: Center(
                child: IndexedStack(
                  index: pages.indexOf(widget.page),
                  children: [
                    Home(),
                    About(name: widget.extra),
                    Setting(),
                    Profile(),
                    Help(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  const NavItem(
      {Key? key,
      required this.iconData,
      required this.selected,
      required this.onTap})
      : super(key: key);
  final IconData iconData;
  final bool selected;
  final Function onTap;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.onTap();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 375),
          width: double.infinity,
          height: 60,
          color: widget.selected ? Colors.black87 : Colors.white,
          child: Icon(widget.iconData),
        ),
      ),
    );
  }
}
