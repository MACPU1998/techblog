
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/component/myStrings.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(children: [

          //poster
          HomePagePoster(size: size),

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

          HomePageBlogList(size: size),
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

          HomePagePodcastList(size: size),

          //برای اینکه محتوا بالاتر از  منوی پایین بیاد یه فاصله انداختیم
          SizedBox(
            height: size.height / 20,
          )
        ]),
      ),
    );
  }
}

class HomePagePodcastList extends StatelessWidget {
  const HomePagePodcastList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2.7,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)),
                          image: DecorationImage(
                            image: NetworkImage(
                                blogList[index].imageUrl),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Positioned(
                      bottom: 8,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
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
                              blogList[index].views,
                              style:
                              const TextStyle(color: Colors.white),
                            ),
                          ]),
                          Text(blogList[index].writer,
                              style:
                              const TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width / 2.4,
                child: Text(
                  blogList[index].title,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class HomePageBlogList extends StatelessWidget {
  const HomePageBlogList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 2.7,
      child: ListView.builder(
        itemCount: blogList.getRange(0, 5).length,
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
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)),
                          image: DecorationImage(
                            image: NetworkImage(
                                blogList[index].imageUrl),
                            fit: BoxFit.cover,
                          )),
                      foregroundDecoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(16)),
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
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.white,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              blogList[index].views,
                              style:
                              TextStyle(color: Colors.white),
                            ),
                          ]),
                          Text(blogList[index].writer,
                              style:
                              TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: size.width / 2.4,
                child: Text(
                  blogList[index].title,
                  textDirection: TextDirection.rtl,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
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
            padding: EdgeInsets.fromLTRB(
                0, 0, index == 7 ? bodyMargin : 8, 0),
            child: MainTags(index: index,),
          );
        },
      ),
    );
  }
}


class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                  image: AssetImage(
                      HomePagePosterMap["imageAssets"]),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      HomePagePosterMap["view"],
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                  Text(
                      HomePagePosterMap["writer"] +
                          "، " +
                          HomePagePosterMap["date"],
                      style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Text(HomePagePosterMap["title"],
                  style: TextStyle(color: Colors.white))
            ],
          ),
        )
      ],
    );
  }
}
