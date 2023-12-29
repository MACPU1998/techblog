import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/component/myStrings.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height:20,
                  ),
                  SvgPicture.asset(
                    Assets.image.tcbot,
                    height: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    MyString.successfulRegistration,
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: MyString.nameAndFamilyName,

                    ),
                  ),
                  const SizedBox(
                    height:  20,
                  ),
                  Text(
                    MyString.chooseCats,

                  ),

                  //taglist
                  Padding(
                    padding:  EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: GridView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: hashTagList.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              crossAxisCount: 2,
                              childAspectRatio: 0.3),
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: (() {
                                setState(() {
                                  if (!selectedTags.contains(hashTagList[index])) {
                                    selectedTags.add(hashTagList[index]);
                                  } else {
                                    debugPrint("${hashTagList[index].title} exist");
                                  }
                                });
                              }),
                              child:
                              MainTags( index: index),
                            );
                          })),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    Assets.icons.write.path,
                    scale: 3,
                  ),

                  //selected Tags
                  Padding(
                    padding:  EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 0.3,
                        ),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 100,
                            decoration:  BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              color: SolidColors.surface,
                            ),
                            child: Padding(
                              padding:  EdgeInsets.fromLTRB(8,8,8,8),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    selectedTags[index].title,

                                  ),
                                  InkWell(
                                    onTap: (() {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    }),
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: SolidColors.greyColor,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}