import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:vtb_hackathon/pages/story/models/option_model.dart';

class StoryPageModel {
  DocumentReference<Map<String, dynamic>>? ref;
  String text;
  List<OptionModel>? options;
  String? type;
  String? speakerName;
  String image;

  StoryPageModel({
    required this.ref,
    required this.text,
    this.options,
    this.type,
    this.speakerName,
    required this.image,
  });

  StoryPageModel.empty()
      : text = "Загрузка...",
        image = "";

  factory StoryPageModel.fromMap(
      Map<String, dynamic> map, DocumentReference<Map<String, dynamic>> ref) {
    return StoryPageModel(
      ref: ref,
      text: map['text'],
      options: map['options'] == null
          ? null
          : List<OptionModel>.from(
              map['options']!.map((x) => OptionModel.fromMap(x))),
      type: map['type'],
      speakerName: map['speakerName'],
      image: map['image'],
    );
  }

  factory StoryPageModel.fromJson(
          String source, DocumentReference<Map<String, dynamic>> ref) =>
      StoryPageModel.fromMap(json.decode(source), ref);
}
