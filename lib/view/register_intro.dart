import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/component/myStrings.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.image.tcbot,
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height / 20),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: MyString.welcom,
                    style: textThem.titleMedium,
                  )),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, size);
              },
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const TextStyle(fontSize: 20);
                  }
                  return const TextStyle(fontSize: 15);
                }),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return SolidColors.secondPrimaryColor;
                  }
                  return SolidColors.primaryColor;
                }),
              ),
              child: const Text(
                "بزن بریم",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }


  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size) {
    var isValidate;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: SolidColors.blackColor,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: size.height / 2,
            decoration: BoxDecoration(
              color: SolidColors.lightIcon,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyString.insertYourEmail,
                      style: TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8),
                      child: TextFormField(
                        onChanged: (value) {

                        },
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: MyString.tecEmail,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (() async {

                      }),
                      child:  Text(MyString.continuation),
                    ),
                  ],
                )),
          ),
        );
      }),
    );
  }


// _shoBottomSheet me
 /* Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size) {

    return showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: size.height / 3,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: const Center(
                        child: Column(
                          children: [
                            Text(
                              MyString.insertYourEmail,
                              style: TextStyle(color: Colors.black),
                            ),
                            Padding(
                                padding: EdgeInsets.all(24),
                              child: TextField(

                                style: TextStyle(color: Colors.black),
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  hintText: "example@gmail.com",
                                ),
                              ),
                            ),
                        */


/*    ElevatedButton(onPressed:(() {
                              Navigator.of(context).pushReplacement(MyCart()),
                            }), child:Text("ادامه") ),*//*

                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
  }

*/

}
