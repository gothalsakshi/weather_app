// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NewWeatherDataModel extends Equatable {
  double? minTemp;
  double? maxTemp;
  String? country;
  NewWeatherDataModel({
    this.minTemp,
    this.maxTemp,
    this.country,
  });
  

  @override
  List<Object?> get props => [minTemp,maxTemp,country];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'country': country,
    };
  }

  factory NewWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return NewWeatherDataModel(
      minTemp: map['minTemp'] != null ? map['minTemp'] as double : null,
      maxTemp: map['maxTemp'] != null ? map['maxTemp'] as double : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewWeatherDataModel.fromJson(String source) => NewWeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  NewWeatherDataModel copyWith({
    double? minTemp,
    double? maxTemp,
    String? country,
  }) {
    return NewWeatherDataModel(
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      country: country ?? this.country,
    );
  }

  @override
  String toString(){
    return 'NewWeatherDataModel(country: $country,maxTemp: $maxTemp,minTemp: $minTemp)';
  }
}
