import 'dart:convert';

class OptionModel {
  String displayName;
  String nextPageName;
  OptionModel({
    required this.displayName,
    required this.nextPageName,
  });

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'nextPageName': nextPageName,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      displayName: map['displayName'],
      nextPageName: map['nextPageName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) => OptionModel.fromMap(json.decode(source));
}
