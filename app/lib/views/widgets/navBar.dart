import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/views/pages/map-screen.dart';
import 'package:myapp/views/pages/user-screen.dart';
import 'package:myapp/views/pages/offers-screen.dart';

import '../pages/sign-in-screen.dart';

class NavBar extends StatefulWidget {
  final int pageNumber; // offersScreen : 0 , mapScreen : 1 , userScreen : 2
  const NavBar({Key? key, required this.pageNumber}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    int currentPageIndex = widget.pageNumber;
    return GNav(
      backgroundColor: const Color.fromRGBO(99, 138, 236, 0.69),
      color: Colors.white70,
      activeColor: Colors.white,
      iconSize: screenWidth / 12,
      selectedIndex: currentPageIndex,
      tabs: [
        GButton(
          key: const Key("searchButton"),
          icon: Icons.search,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OffersScreen()),
            );
          },
        ),
        GButton(
          icon: Icons.map_outlined,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MapScreen()),
            );
          },
        ),
        GButton(
          key: const Key("userButton"),
          icon: Icons.verified_user,
          onPressed: () {
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              print(user.email);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            } else {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              }
            }
        )

      ],
    );
  }
}
