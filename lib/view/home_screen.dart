import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/component/myStrings.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    // homeScreenController.getHomeItems();
    return SingleChildScrollView(
        child: Obx(() => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: homeScreenController.loading.value == false
                ? Column(children: [
              //poster
              poster(),

              const SizedBox(
                height: 20,
              ),
              // List
              HomePageTagList(bodyMargin: bodyMargin),
              const SizedBox(
                height: 16,
              ),
              // see more text
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      MyString.viewHotestBlog,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(
                      Icons.pentagon_sharp,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),

              topVisited(),
              //see more podcast
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      MyString.viewHotestPodCasts,
                      style: TextStyle(color: Colors.blue),
                    ),
                    Icon(
                      Icons.pentagon_sharp,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),

              topPodcast(),

              //برای اینکه محتوا بالاتر از  منوی پایین بیاد یه فاصله انداختیم
              SizedBox(
                height: size.height / 20,
              )
            ]):Center(child: loadingSpinKit(),))
    ));
  }

  Widget topVisited() {
    return Obx(
      () => SizedBox(
        height: size.height / 2.7,
        child: ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: size.height / 4.1,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(homeScreenController
                                  .topVisitedList[index].image!),
                              fit: BoxFit.cover,
                            )),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.center)),
                      ),
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                homeScreenController
                                    .topVisitedList[index].view!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ]),
                            Text(
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    homeScreenController.topVisitedList[index].title!,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 2.7,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcastList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: size.height / 4.1,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                            image: DecorationImage(
                              image: NetworkImage(homeScreenController
                                  .topPodcastList[index].poster!),
                              fit: BoxFit.cover,
                            )),
                        foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            gradient: LinearGradient(
                                colors: GradientColors.blogPost,
                                begin: Alignment.bottomCenter,
                                end: Alignment.center)),
                      ),
/*
                       CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          );
                        },
                         placeholder: (context, url) => loadingSpinKit(),
                      ),*/
                      /*  Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(homeScreenController
                                    .topPodcastList[index].poster!),
                                fit: BoxFit.cover)),
                      ),*/
                      Positioned(
                        bottom: 8,
                        left: 8,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                homeScreenController
                                    .topPodcastList[index].view!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ]),
                            Text(
                                homeScreenController
                                    .topPodcastList[index].publisher!,
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width / 2.4,
                  child: Text(
                    homeScreenController.topPodcastList[index].title!,
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(homeScreenController.poster.value.image!),
                  fit: BoxFit.fill)),
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              gradient: LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    /* Text(
                      HomePagePosterMap["view"],
                      style: TextStyle(color: Colors.white),
                    ),*/
                  ]),
                  /* Text(
                      HomePagePosterMap["writer"] +
                          "، " +
                          HomePagePosterMap["date"],
                      style: TextStyle(color: Colors.white))*/
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(homeScreenController.poster.value.title!,
                  style: TextStyle(color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}

class HomePageTagList extends StatelessWidget {
  const HomePageTagList({
    super.key,
    required this.bodyMargin,
  });

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hashTagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 0, index == 7 ? bodyMargin : 8, 0),
            child: MainTags(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
