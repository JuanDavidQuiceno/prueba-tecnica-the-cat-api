class CarWeightModel {
  CarWeightModel({
    this.imperial,
    this.metric,
  });
  factory CarWeightModel.fromJson(Map<String, dynamic> json) => CarWeightModel(
    imperial: json['imperial']?.toString(),
    metric: json['metric']?.toString(),
  );
  String? imperial;
  String? metric;

  CarWeightModel copyWith({
    String? imperial,
    String? metric,
  }) => CarWeightModel(
    imperial: imperial ?? this.imperial,
    metric: metric ?? this.metric,
  );

  Map<String, dynamic> toJson() => {
    'imperial': imperial,
    'metric': metric,
  };
}
