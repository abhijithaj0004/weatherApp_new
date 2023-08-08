import 'package:json_annotation/json_annotation.dart';

part 'main.g.dart';

@JsonSerializable()
class Main {
  @JsonKey(name: 'temp')
  double? temp;
  @JsonKey(name: 'pressure')
  int? pressure;
  @JsonKey(name: 'humidity')
  int? humidity;

  Main({this.temp, this.pressure, this.humidity});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
