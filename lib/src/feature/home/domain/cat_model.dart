import 'dart:convert';

import 'package:app/src/feature/home/domain/cat_weight_model.dart';

List<CatModel> catModelFromJson(String str) => List<CatModel>.from(
  (json.decode(str) as List<dynamic>).map(
    (x) => CatModel.fromJson(x as Map<String, dynamic>),
  ),
);

String catModelToJson(List<CatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatModel {
  CatModel({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.catFriendly,
    this.bidability,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) => CatModel(
    weight: json['weight'] == null
        ? null
        : CarWeightModel.fromJson(
            json['weight'] as Map<String, dynamic>,
          ),
    id: json['id']?.toString(),
    name: json['name']?.toString(),
    cfaUrl: json['cfa_url']?.toString(),
    vetstreetUrl: json['vetstreet_url']?.toString(),
    vcahospitalsUrl: json['vcahospitals_url']?.toString(),
    temperament: json['temperament']?.toString(),
    origin: json['origin']?.toString(),
    countryCodes: json['country_codes']?.toString(),
    countryCode: json['country_code']?.toString(),
    description: json['description']?.toString(),
    lifeSpan: json['life_span']?.toString(),
    indoor: json['indoor'] == null
        ? null
        : int.tryParse(json['indoor']!.toString()),
    lap: json['lap'] == null ? null : int.tryParse(json['lap']!.toString()),
    altNames: json['alt_names']?.toString(),
    adaptability: json['adaptability'] == null
        ? null
        : int.tryParse(json['adaptability']!.toString()),
    affectionLevel: json['affection_level'] == null
        ? null
        : int.tryParse(json['affection_level']!.toString()),
    childFriendly: json['child_friendly'] == null
        ? null
        : int.tryParse(json['child_friendly']!.toString()),
    dogFriendly: json['dog_friendly'] == null
        ? null
        : int.tryParse(json['dog_friendly']!.toString()),
    energyLevel: json['energy_level'] == null
        ? null
        : int.tryParse(json['energy_level']!.toString()),
    grooming: json['grooming'] == null
        ? null
        : int.tryParse(json['grooming']!.toString()),
    healthIssues: json['health_issues'] == null
        ? null
        : int.tryParse(json['health_issues']!.toString()),
    intelligence: json['intelligence'] == null
        ? null
        : int.tryParse(json['intelligence']!.toString()),
    sheddingLevel: json['shedding_level'] == null
        ? null
        : int.tryParse(json['shedding_level']!.toString()),
    socialNeeds: json['social_needs'] == null
        ? null
        : int.tryParse(json['social_needs']!.toString()),
    strangerFriendly: json['stranger_friendly'] == null
        ? null
        : int.tryParse(json['stranger_friendly']!.toString()),
    vocalisation: json['vocalisation'] == null
        ? null
        : int.tryParse(json['vocalisation']!.toString()),
    experimental: json['experimental'] == null
        ? null
        : int.tryParse(json['experimental']!.toString()),
    hairless: json['hairless'] == null
        ? null
        : int.tryParse(json['hairless']!.toString()),
    natural: json['natural'] == null
        ? null
        : int.tryParse(json['natural']!.toString()),
    rare: json['rare'] == null ? null : int.tryParse(json['rare']!.toString()),
    rex: json['rex'] == null ? null : int.tryParse(json['rex']!.toString()),
    suppressedTail: json['suppressed_tail'] == null
        ? null
        : int.tryParse(json['suppressed_tail']!.toString()),
    shortLegs: json['short_legs'] == null
        ? null
        : int.tryParse(json['short_legs']!.toString()),
    wikipediaUrl: json['wikipedia_url']?.toString(),
    hypoallergenic: json['hypoallergenic'] == null
        ? null
        : int.tryParse(json['hypoallergenic']!.toString()),
    referenceImageId: json['reference_image_id']?.toString(),
    catFriendly: json['cat_friendly'] == null
        ? null
        : int.tryParse(json['cat_friendly']!.toString()),
    bidability: json['bidability'] == null
        ? null
        : int.tryParse(json['bidability']!.toString()),
  );
  CarWeightModel? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;
  int? catFriendly;
  int? bidability;

  CatModel copyWith({
    CarWeightModel? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
    int? catFriendly,
    int? bidability,
  }) => CatModel(
    weight: weight ?? this.weight,
    id: id ?? this.id,
    name: name ?? this.name,
    cfaUrl: cfaUrl ?? this.cfaUrl,
    vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
    vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
    temperament: temperament ?? this.temperament,
    origin: origin ?? this.origin,
    countryCodes: countryCodes ?? this.countryCodes,
    countryCode: countryCode ?? this.countryCode,
    description: description ?? this.description,
    lifeSpan: lifeSpan ?? this.lifeSpan,
    indoor: indoor ?? this.indoor,
    lap: lap ?? this.lap,
    altNames: altNames ?? this.altNames,
    adaptability: adaptability ?? this.adaptability,
    affectionLevel: affectionLevel ?? this.affectionLevel,
    childFriendly: childFriendly ?? this.childFriendly,
    dogFriendly: dogFriendly ?? this.dogFriendly,
    energyLevel: energyLevel ?? this.energyLevel,
    grooming: grooming ?? this.grooming,
    healthIssues: healthIssues ?? this.healthIssues,
    intelligence: intelligence ?? this.intelligence,
    sheddingLevel: sheddingLevel ?? this.sheddingLevel,
    socialNeeds: socialNeeds ?? this.socialNeeds,
    strangerFriendly: strangerFriendly ?? this.strangerFriendly,
    vocalisation: vocalisation ?? this.vocalisation,
    experimental: experimental ?? this.experimental,
    hairless: hairless ?? this.hairless,
    natural: natural ?? this.natural,
    rare: rare ?? this.rare,
    rex: rex ?? this.rex,
    suppressedTail: suppressedTail ?? this.suppressedTail,
    shortLegs: shortLegs ?? this.shortLegs,
    wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
    hypoallergenic: hypoallergenic ?? this.hypoallergenic,
    referenceImageId: referenceImageId ?? this.referenceImageId,
    catFriendly: catFriendly ?? this.catFriendly,
    bidability: bidability ?? this.bidability,
  );

  Map<String, dynamic> toJson() => {
    'weight': weight?.toJson(),
    'id': id,
    'name': name,
    'cfa_url': cfaUrl,
    'vetstreet_url': vetstreetUrl,
    'vcahospitals_url': vcahospitalsUrl,
    'temperament': temperament,
    'origin': origin,
    'country_codes': countryCodes,
    'country_code': countryCode,
    'description': description,
    'life_span': lifeSpan,
    'indoor': indoor,
    'lap': lap,
    'alt_names': altNames,
    'adaptability': adaptability,
    'affection_level': affectionLevel,
    'child_friendly': childFriendly,
    'dog_friendly': dogFriendly,
    'energy_level': energyLevel,
    'grooming': grooming,
    'health_issues': healthIssues,
    'intelligence': intelligence,
    'shedding_level': sheddingLevel,
    'social_needs': socialNeeds,
    'stranger_friendly': strangerFriendly,
    'vocalisation': vocalisation,
    'experimental': experimental,
    'hairless': hairless,
    'natural': natural,
    'rare': rare,
    'rex': rex,
    'suppressed_tail': suppressedTail,
    'short_legs': shortLegs,
    'wikipedia_url': wikipediaUrl,
    'hypoallergenic': hypoallergenic,
    'reference_image_id': referenceImageId,
    'cat_friendly': catFriendly,
    'bidability': bidability,
  };
}
