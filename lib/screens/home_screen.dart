import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatelessWidget {
  static const routeArgs = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: [
          ClipPath(
            clipper: ClippingClass(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 3 / 7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff000000), Color(0xff000000)]),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 60,
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/user.PNG"),
            ),
          ),
          Positioned(
            left: 20,
            top: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Hi John",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                // Text(
                //     "Get your laundry washed, folded \nand delivered straight to your door.",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 18,
                //     )),
              ],
            ),
          ),
          Positioned(
            left: 5,
            top: 180,
            right: 5,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _customCard(
                        imageUrl: "wash1.png",
                        item: "Laundry",
                        duration: "1 Day"),
                    _customCard(
                        imageUrl: "iron.png",
                        item: "Steam Iron",
                        duration: "3 Days")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _customCard(
                        imageUrl: "drying.png",
                        item: "Washing",
                        duration: "3 Days"),
                    _customCard(
                        imageUrl: "laundry.png",
                        item: "Dry Cleaning",
                        duration: "3 Days")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: GNav(
            rippleColor:
                Colors.grey.shade100, // tab button ripple color when pressed
            hoverColor: Colors.grey.shade200, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            tabActiveBorder:
                Border.all(color: Colors.black, width: 1), // tab button border
            // tabBorder:
            //     Border.all(color: Colors.grey, width: 1), // tab button border
            tabShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            ], // tab button shadow
            curve: Curves.fastOutSlowIn, // tab animation curves
            duration: Duration(milliseconds: 300), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Colors.black, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                Colors.grey.withOpacity(0.1), // selected tab background color
            padding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 5), // navigation bar padding
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.shoppingCart,
                text: 'Orders',
              ),
              GButton(
                icon: LineIcons.helpingHands,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              )
            ]),
      ),
    );
  }

  _customCard(
      {required String imageUrl,
      required String item,
      required String duration}) {
    return SizedBox(
      height: 170,
      width: 170,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                "assets/" + imageUrl,
                width: 60,
                height: 70,
              ),
              SizedBox(
                height: 10,
              ),
              Text(item,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(duration)
            ],
          ),
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    var controlPoint = Offset(size.width - (size.width / 2), size.height - 120);
    var endPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
