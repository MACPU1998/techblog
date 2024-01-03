import 'package:techblog/component/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createdAt,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) {
    return PodcastModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      poster:  ApiUrlConstant.hostDlUrl + (json['poster'] ?? ''),
      publisher: json['publisher'] ?? '',
      view: json['view'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
