class Character {
  Character({
    required this.characterName,
    required this.characterNameRomeji,
    required this.shozoku,
    required this.seiryoku,
    required this.offenseScore,
    required this.defenseScore,
    required this.agilityScore,
    required this.secretArtsName,
    required this.secretArtsDescription,
  });

  final String characterName;
  final String characterNameRomeji;
  final String shozoku;
  final String seiryoku;
  final int offenseScore;
  final int defenseScore;
  final int agilityScore;
  final String secretArtsName;
  final String secretArtsDescription;

  // JSONからCharacterを生成するファクトリコンストラクタ
  factory Character.fromJson(dynamic json) {
    return Character(
      characterName: json['characterName'] as String,
      characterNameRomeji: json['characterNameRomeji'] as String,
      shozoku: json['shozoku'] as String,
      seiryoku: json['seiryoku'] as String,
      offenseScore: json['offenseScore'] as int,
      defenseScore: json['defenseScore'] as int,
      agilityScore: json['agilityScore'] as int,
      secretArtsName: json['secretArtsName'] as String,
      secretArtsDescription: json['secretArtsDescription'] as String,
    );
  }
}
