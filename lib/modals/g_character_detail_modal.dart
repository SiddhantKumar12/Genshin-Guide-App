class GCharacterDetailModal {
  String? name;
  String? title;
  String? vision;
  String? weapon;
  String? gender;
  String? nation;
  String? affiliation;
  int? rarity;
  String? release;
  String? constellation;
  String? birthday;
  String? description;
  List<SkillTalents>? skillTalents;
  List<PassiveTalents>? passiveTalents;
  List<Constellations>? constellations;
  String? visionKey;
  String? weaponType;

  GCharacterDetailModal(
      {this.name,
      this.title,
      this.vision,
      this.weapon,
      this.gender,
      this.nation,
      this.affiliation,
      this.rarity,
      this.release,
      this.constellation,
      this.birthday,
      this.description,
      this.skillTalents,
      this.passiveTalents,
      this.constellations,
      this.visionKey,
      this.weaponType});

  GCharacterDetailModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    vision = json['vision'];
    weapon = json['weapon'];
    gender = json['gender'];
    nation = json['nation'];
    affiliation = json['affiliation'];
    rarity = json['rarity'];
    release = json['release'];
    constellation = json['constellation'];
    birthday = json['birthday'];
    description = json['description'];
    if (json['skillTalents'] != null) {
      skillTalents = <SkillTalents>[];
      json['skillTalents'].forEach((v) {
        skillTalents!.add(new SkillTalents.fromJson(v));
      });
    }
    if (json['passiveTalents'] != null) {
      passiveTalents = <PassiveTalents>[];
      json['passiveTalents'].forEach((v) {
        passiveTalents!.add(new PassiveTalents.fromJson(v));
      });
    }
    if (json['constellations'] != null) {
      constellations = <Constellations>[];
      json['constellations'].forEach((v) {
        constellations!.add(new Constellations.fromJson(v));
      });
    }
    visionKey = json['vision_key'];
    weaponType = json['weapon_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['vision'] = this.vision;
    data['weapon'] = this.weapon;
    data['gender'] = this.gender;
    data['nation'] = this.nation;
    data['affiliation'] = this.affiliation;
    data['rarity'] = this.rarity;
    data['release'] = this.release;
    data['constellation'] = this.constellation;
    data['birthday'] = this.birthday;
    data['description'] = this.description;
    if (this.skillTalents != null) {
      data['skillTalents'] = this.skillTalents!.map((v) => v.toJson()).toList();
    }
    if (this.passiveTalents != null) {
      data['passiveTalents'] = this.passiveTalents!.map((v) => v.toJson()).toList();
    }
    // if (this.constellations != null) {
    //   data['constellations'] = this.constellations!.map((v) => v.toJson()).toList();
    // }
    data['vision_key'] = this.visionKey;
    data['weapon_type'] = this.weaponType;
    return data;
  }
}

class SkillTalents {
  String? name;
  String? unlock;
  String? description;
  List<Upgrades>? upgrades;
  String? type;

  SkillTalents({this.name, this.unlock, this.description, this.upgrades, this.type});

  SkillTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unlock = json['unlock'];
    description = json['description'];
    if (json['upgrades'] != null) {
      upgrades = <Upgrades>[];
      json['upgrades'].forEach((v) {
        upgrades!.add(new Upgrades.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['unlock'] = this.unlock;
    data['description'] = this.description;
    if (this.upgrades != null) {
      data['upgrades'] = this.upgrades!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class Upgrades {
  String? name;
  String? value;

  Upgrades({this.name, this.value});

  Upgrades.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class PassiveTalents {
  String? name;
  String? unlock;
  String? description;
  int? level;

  PassiveTalents({this.name, this.unlock, this.description, this.level});

  PassiveTalents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unlock = json['unlock'];
    description = json['description'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['unlock'] = this.unlock;
    data['description'] = this.description;
    data['level'] = this.level;
    return data;
  }
}

class Constellations {
  String? name;
  String? unlock;
  String? description;
  int? level;

  Constellations({
    this.name,
    this.unlock,
    this.description,
    this.level,
  });

  Constellations.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unlock = json['unlock'];
    description = json['description'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['unlock'] = this.unlock;
    data['description'] = this.description;
    data['level'] = this.level;
    return data;
  }
}
