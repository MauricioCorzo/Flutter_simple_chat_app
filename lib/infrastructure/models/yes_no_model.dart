import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  YesNoModel.fromJsonMap(Map<String, dynamic> json)
      : this.answer = json["answer"],
        this.forced = json["forced"],
        this.image = json["image"];

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
        text: this.answer == "yes" ? "Si" : "No",
        fromWho: FromWho.her,
        imageUrl: this.image,
      );
}
