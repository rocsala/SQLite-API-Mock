import 'dart:convert';

List<Character> characterFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String characterToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  int id;
  String name;
  String titan;
  String affiliation;
  String residence;

  Character({
    this.id,
    this.name,
    this.titan,
    this.affiliation,
    this.residence,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        titan: json["titan"],
        affiliation: json["affiliation"],
        residence: json["residence"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "titan": titan,
        "affiliation": affiliation,
        "residence": residence,
      };
}
