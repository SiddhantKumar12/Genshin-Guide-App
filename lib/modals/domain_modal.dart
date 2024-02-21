import 'material_modal.dart';

class DomainModal {
  String? name;
  String? type;
  String? description;
  String? location;
  String? nation;
  List<Requirements>? requirements;
  List<String>? recommendedElements;
  List<Rewards>? rewards;

  DomainModal({this.name, this.type, this.description, this.location, this.nation, this.requirements, this.recommendedElements, this.rewards});

  DomainModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    description = json['description'];
    location = json['location'];
    nation = json['nation'];
    if (json['requirements'] != null) {
      requirements = <Requirements>[];
      json['requirements'].forEach((v) {
        requirements!.add(new Requirements.fromJson(v));
      });
    }
    recommendedElements = json['recommendedElements'].cast<String>();
    if (json['rewards'] != null) {
      rewards = <Rewards>[];
      json['rewards'].forEach((v) {
        rewards!.add(new Rewards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['description'] = this.description;
    data['location'] = this.location;
    data['nation'] = this.nation;
    if (this.requirements != null) {
      data['requirements'] = this.requirements!.map((v) => v.toJson()).toList();
    }
    data['recommendedElements'] = this.recommendedElements;
    if (this.rewards != null) {
      data['rewards'] = this.rewards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requirements {
  int? level;
  int? adventureRank;
  int? recommendedLevel;
  List<String>? leyLineDisorder;

  Requirements({this.level, this.adventureRank, this.recommendedLevel, this.leyLineDisorder});

  Requirements.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    adventureRank = json['adventureRank'];
    recommendedLevel = json['recommendedLevel'];
    leyLineDisorder = json['leyLineDisorder'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['adventureRank'] = this.adventureRank;
    data['recommendedLevel'] = this.recommendedLevel;
    data['leyLineDisorder'] = this.leyLineDisorder;
    return data;
  }
}

class Rewards {
  String? day;
  List<Details>? details;

  Rewards({this.day, this.details});

  Rewards.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? level;
  int? adventureExperience;
  int? companionshipExperience;
  int? mora;
  List<Drops>? drops;
  List<Items>? items;

  Details({this.level, this.adventureExperience, this.companionshipExperience, this.mora, this.drops, this.items});

  Details.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    adventureExperience = json['adventureExperience'];
    companionshipExperience = json['companionshipExperience'];
    mora = json['mora'];
    if (json['drops'] != null) {
      drops = <Drops>[];
      json['drops'].forEach((v) {
        drops!.add(new Drops.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['adventureExperience'] = this.adventureExperience;
    data['companionshipExperience'] = this.companionshipExperience;
    data['mora'] = this.mora;
    if (this.drops != null) {
      data['drops'] = this.drops!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drops {
  String? name;
  int? dropMin;
  int? dropMax;

  Drops({this.name, this.dropMin, this.dropMax});

  Drops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dropMin = json['drop_min'];
    dropMax = json['drop_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['drop_min'] = this.dropMin;
    data['drop_max'] = this.dropMax;
    return data;
  }
}
