import 'package:hive/hive.dart';

part 'sensor_data.g.dart';

@HiveType(typeId: 0)
class SensorData {
  @HiveField(0)
  final double humidity;

  @HiveField(1)
  final double temperature;

  @HiveField(2)
  final double soilmoisture;

  SensorData({
    required this.humidity,
    required this.temperature,
    required this.soilmoisture,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      humidity: json['humidity'].toDouble(),
      temperature: json['temperature'].toDouble(),
      soilmoisture: json['soilmoisture'].toDouble(),
    );
  }
}