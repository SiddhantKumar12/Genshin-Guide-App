class ArtifactDetailModal {
  String? name;
  int? maxRarity;
  String? s2PieceBonus;
  String? s4PieceBonus;

  ArtifactDetailModal({this.name, this.maxRarity, this.s2PieceBonus, this.s4PieceBonus});

  ArtifactDetailModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    maxRarity = json['max_rarity'];
    s2PieceBonus = json['2-piece_bonus'];
    s4PieceBonus = json['4-piece_bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['max_rarity'] = this.maxRarity;
    data['2-piece_bonus'] = this.s2PieceBonus;
    data['4-piece_bonus'] = this.s4PieceBonus;
    return data;
  }
}
