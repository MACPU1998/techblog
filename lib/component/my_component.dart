import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/component/myColors.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      height: 1,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
  MainTags({
    required this.index,
    super.key,
  });

  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: GradientColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(
                Icons.numbers,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                hashTagList[index].title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          )),
    );
  }
}

launcherMyUrl(String url) async {
  var uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("could not launch url" as num);
  }
}


class loadingSpinKit extends StatelessWidget {
  const loadingSpinKit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitChasingDots(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}
