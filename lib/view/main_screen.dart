import 'package:flutter/material.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey<ScaffoldState> _key=GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 15;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    Assets.image.logo.path,
                    scale: 2.5,
                  ),
                )),
                ListTile(
                  title: Text("پروفایل کاربری"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("درباره تک بلاگ"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("اشتراک"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("تک بلاگ در گیت هاب"),
                  onTap: () {},
                ),
                const Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: SolidColors.scaffoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => _key.currentState!.openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              Image(
                image: const AssetImage("assets/image/logo.png"),
                height: size.height / 13.6,
              ),

              const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: IndexedStack(
              index: selectedPageIndex,
              children: [
                HomeScreen(size: size, bodyMargin: bodyMargin),
                // index 0
                Center(
                    child: ProfileScreen(size: size, bodyMargin: bodyMargin)),
                // index 1
              ],
            )),

            //bottom Navigation
            BottomNavigation(
                size: size,
                bodyMargin: bodyMargin,
                changeIndexScreen: (int value) {
                  setState(() {
                    selectedPageIndex = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeIndexScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeIndexScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 11,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(colors: GradientColors.bottomNav)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeIndexScreen(1)),
                    icon: const ImageIcon(
                      AssetImage("assets/icons/user.png"),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() => changeIndexScreen),
                    icon: const ImageIcon(AssetImage("assets/icons/write.png"),
                        color: Colors.white)),
                IconButton(
                    onPressed: (() => changeIndexScreen(0)),
                    icon: const ImageIcon(AssetImage("assets/icons/home.png"),
                        color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
