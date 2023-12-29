import 'package:flutter/material.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/component/myStrings.dart';
import 'package:techblog/component/my_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/image/profileAvatar.png"),
          height: 100,
        ),
         SizedBox(
          height: size.height/20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            ImageIcon(
              AssetImage("assets/icons/blue_pen.png"),
              color: Colors.blue,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              MyString.imageProfileEdit,
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        SizedBox(
          height: size.height/20,
        ),

        Text(
          "مهدیه رهبر",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          "gfgyt@email.com",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height/20,
        ),
        TechDivider(size: size),
        //text
        Padding(
          padding: EdgeInsets.only(top: size.height/50,bottom: size.height/50,),
          child: InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: const Text(MyString.myFavBlog),
          ),
        ),
        TechDivider(size: size),
        Padding(
          padding: EdgeInsets.only(top: size.height/50,bottom: size.height/50,),
          child: InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: const Text(MyString.myFavPodcast),
          ),
        ),
        TechDivider(size: size),
        Padding(
          padding: EdgeInsets.only(top: size.height/50,bottom: size.height/50,),
          child: InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: const Text(MyString.logOut),
          ),
        ),
        SizedBox(height: size.height/10,)
      ],
    ));
  }
}
