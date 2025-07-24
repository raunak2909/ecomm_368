import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'nav_pages/cart/cart_screen.dart';
import 'nav_pages/home/home_screen.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Widget> _buildScreens = [HomeScreen(), HomeScreen(), HomeScreen(), CartScreen(), CartScreen()];

  int selectedIndex = 0;

  /*final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );

  List<PersistentBottomNavBarItem> _navBarsItems(bool isDark) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        activeColorSecondary: Colors.white,
        title: ("Home"),
        textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "pop"),
        activeColorPrimary: Color(0xFF1E88E5),
        inactiveColorPrimary: Color(0xFF1E88E5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart"),
        textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "pop"),
        activeColorPrimary: Color(0xFF1E88E5),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Color(0xFF1E88E5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        textStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: "pop"),
        activeColorPrimary: Color(0xFF1E88E5),
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Color(0xFF1E88E5),
      ),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme
        .of(context)
        .brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,
      body: _buildScreens[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff64B5F6),
        foregroundColor: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none
        ),
        onPressed: (){
          setState(() {
            selectedIndex = 0;
          });
      }, child: Icon(CupertinoIcons.home),),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            }, icon: Icon(Icons.dashboard)),
            IconButton(onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            }, icon: Icon(Icons.favorite_border)),
            Container(
              width: 40,
            ),
            IconButton(onPressed: () {
              setState(() {
                selectedIndex = 3;
              });
            }, icon: Icon(CupertinoIcons.cart)),
            IconButton(onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            }, icon: Icon(CupertinoIcons.profile_circled)),
          ],
        ),
      ),
    );

    // TODO: implement build
    /*return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(isDark),
       onItemSelected: (index){
        page =index;
        print("the index is$index");
        print("the page is $page");
        setState(() {

        });
},
      handleAndroidBackButtonPress: true,
      // Default is true.
      margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(20),
        useBackdropFilter: true,
        border: Border.all(color: Colors.grey.withAlpha(50), width: 1.5),
      ),
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor:page ==0? Colors.transparent:isDark?Color(0xff1E1E1E): Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 80,
      navBarStyle:
      NavBarStyle.style7, // Choose the nav bar style with this property
    );*/
  }
}
