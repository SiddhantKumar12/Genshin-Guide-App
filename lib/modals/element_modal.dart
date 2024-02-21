class ElementModal {
  String? name;
  String? key;
  List<Reactions>? reactions;

  ElementModal({this.name, this.key, this.reactions});

  ElementModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions!.add(new Reactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['key'] = this.key;
    if (this.reactions != null) {
      data['reactions'] = this.reactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reactions {
  String? name;
  List<String>? elements;
  String? description;

  Reactions({this.name, this.elements, this.description});

  Reactions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    elements = json['elements'].cast<String>();
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['elements'] = this.elements;
    data['description'] = this.description;
    return data;
  }
}
