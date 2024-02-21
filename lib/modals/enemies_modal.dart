class EnemiesModal {
  String? id;
  String? name;
  String? region;
  String? description;
  String? type;
  String? family;
  List<String>? elements;
  // String? drops;
  List<ElementalDescriptions>? elementalDescriptions;

  EnemiesModal({this.id, this.name, this.region, this.description, this.type, this.family, this.elements, this.elementalDescriptions});

  EnemiesModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
    description = json['description'];
    type = json['type'];
    family = json['family'];
    elements = json['elements'].cast<String>();
    // drops = json['drops'];
    if (json['elemental-descriptions'] != null) {
      elementalDescriptions = <ElementalDescriptions>[];
      json['elemental-descriptions'].forEach((v) {
        elementalDescriptions!.add(new ElementalDescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['region'] = this.region;
    data['description'] = this.description;
    data['type'] = this.type;
    data['family'] = this.family;
    data['elements'] = this.elements;
    // data['drops'] = this.drops;
    if (this.elementalDescriptions != null) {
      data['elemental-descriptions'] = this.elementalDescriptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ElementalDescriptions {
  String? element;
  String? description;

  ElementalDescriptions({this.element, this.description});

  ElementalDescriptions.fromJson(Map<String, dynamic> json) {
    element = json['element'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['element'] = this.element;
    data['description'] = this.description;
    return data;
  }
}
