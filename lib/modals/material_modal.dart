class MaterialModal {
  Freedom? freedom;
  Freedom? resistance;
  Freedom? ballad;
  Freedom? prosperity;
  Freedom? diligence;
  Freedom? gold;
  Freedom? transience;
  Freedom? elegance;
  Freedom? light;
  Freedom? admonition;
  Freedom? ingenuity;
  Freedom? praxis;
  Freedom? equity;
  Freedom? justice;
  Freedom? order;

  MaterialModal(
      {this.freedom,
      this.resistance,
      this.ballad,
      this.prosperity,
      this.diligence,
      this.gold,
      this.transience,
      this.elegance,
      this.light,
      this.admonition,
      this.ingenuity,
      this.praxis,
      this.equity,
      this.justice,
      this.order});

  MaterialModal.fromJson(Map<String, dynamic> json) {
    freedom = json['freedom'] != null ? new Freedom.fromJson(json['freedom']) : null;
    resistance = json['resistance'] != null ? new Freedom.fromJson(json['resistance']) : null;
    ballad = json['ballad'] != null ? new Freedom.fromJson(json['ballad']) : null;
    prosperity = json['prosperity'] != null ? new Freedom.fromJson(json['prosperity']) : null;
    diligence = json['diligence'] != null ? new Freedom.fromJson(json['diligence']) : null;
    gold = json['gold'] != null ? new Freedom.fromJson(json['gold']) : null;
    transience = json['transience'] != null ? new Freedom.fromJson(json['transience']) : null;
    elegance = json['elegance'] != null ? new Freedom.fromJson(json['elegance']) : null;
    light = json['light'] != null ? new Freedom.fromJson(json['light']) : null;
    admonition = json['admonition'] != null ? new Freedom.fromJson(json['admonition']) : null;
    ingenuity = json['ingenuity'] != null ? new Freedom.fromJson(json['ingenuity']) : null;
    praxis = json['praxis'] != null ? new Freedom.fromJson(json['praxis']) : null;
    equity = json['equity'] != null ? new Freedom.fromJson(json['equity']) : null;
    justice = json['justice'] != null ? new Freedom.fromJson(json['justice']) : null;
    order = json['order'] != null ? new Freedom.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.freedom != null) {
      data['freedom'] = this.freedom!.toJson();
    }
    if (this.resistance != null) {
      data['resistance'] = this.resistance!.toJson();
    }
    if (this.ballad != null) {
      data['ballad'] = this.ballad!.toJson();
    }
    if (this.prosperity != null) {
      data['prosperity'] = this.prosperity!.toJson();
    }
    if (this.diligence != null) {
      data['diligence'] = this.diligence!.toJson();
    }
    if (this.gold != null) {
      data['gold'] = this.gold!.toJson();
    }
    if (this.transience != null) {
      data['transience'] = this.transience!.toJson();
    }
    if (this.elegance != null) {
      data['elegance'] = this.elegance!.toJson();
    }
    if (this.light != null) {
      data['light'] = this.light!.toJson();
    }
    if (this.admonition != null) {
      data['admonition'] = this.admonition!.toJson();
    }
    if (this.ingenuity != null) {
      data['ingenuity'] = this.ingenuity!.toJson();
    }
    if (this.praxis != null) {
      data['praxis'] = this.praxis!.toJson();
    }
    if (this.equity != null) {
      data['equity'] = this.equity!.toJson();
    }
    if (this.justice != null) {
      data['justice'] = this.justice!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Freedom {
  List<String>? characters;
  List<String>? availability;
  String? source;
  List<Items>? items;

  Freedom({this.characters, this.availability, this.source, this.items});

  Freedom.fromJson(Map<String, dynamic> json) {
    characters = json['characters'].cast<String>();
    availability = json['availability'].cast<String>();
    source = json['source'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['characters'] = this.characters;
    data['availability'] = this.availability;
    data['source'] = this.source;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? name;
  int? rarity;

  Items({this.id, this.name, this.rarity});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rarity = json['rarity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rarity'] = this.rarity;
    return data;
  }
}
