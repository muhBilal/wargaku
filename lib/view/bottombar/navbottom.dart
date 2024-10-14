import 'package:flutter/material.dart';
import 'package:wargaku/view/card/mycard.dart';
import 'package:wargaku/view/home/home.dart';
import 'package:wargaku/view/profile/profile.dart';

class Navbottom extends StatefulWidget {
  const Navbottom({super.key});

  @override
  State<Navbottom> createState() => _NavbottomState();
}

class _NavbottomState extends State<Navbottom> {
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    List pages = const [Home(), Profile(), MyCard()];

    return Scaffold(
      body: Stack(
        children: [
          pages[currIndex],
          Positioned(
            left: 90,
            right: 90,
            bottom: 20,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
                    blurRadius: 50,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(380),
                child: BottomNavigationBar(
                  currentIndex: currIndex,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black45,
                  selectedFontSize: 5,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  onTap: (index) {
                    setState(() {
                      currIndex = index;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              currIndex == 0 ? Colors.red : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.home,
                            color:
                                currIndex == 0 ? Colors.white : Colors.black45),
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              currIndex == 1 ? Colors.red : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.document_scanner,
                            color:
                                currIndex == 1 ? Colors.white : Colors.black45),
                      ),
                      label: "",
                    ),
                    BottomNavigationBarItem(
                      icon: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              currIndex == 2 ? Colors.red : Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.person,
                            color:
                                currIndex == 2 ? Colors.white : Colors.black45),
                      ),
                      label: "",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
