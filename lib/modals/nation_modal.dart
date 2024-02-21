class NationModal {
  String? name;
  String? element;
  String? archon;
  String? controllingEntity;

  NationModal({this.name, this.element, this.archon, this.controllingEntity});

  NationModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    element = json['element'];
    archon = json['archon'];
    controllingEntity = json['controllingEntity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['element'] = this.element;
    data['archon'] = this.archon;
    data['controllingEntity'] = this.controllingEntity;
    return data;
  }
}
