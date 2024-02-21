class GItemModal {
  final List<dynamic>? name;

  GItemModal({
    this.name,
  });

  factory GItemModal.fromJson(Map<String, dynamic> json) {
    return GItemModal(
      name: json['name'],
    );
  }
}
