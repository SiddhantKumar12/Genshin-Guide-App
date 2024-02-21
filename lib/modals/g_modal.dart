class GModal {
  List<String>? types;

  GModal({this.types});

  GModal.fromJson(Map<String, dynamic> json) {
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['types'] = this.types;
    return data;
  }
}
