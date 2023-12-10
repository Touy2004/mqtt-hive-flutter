// get_data_mqtt_provider.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:hive/hive.dart';
import '../models/sensor_data.dart';

late MqttServerClient client;

class GetDataMqttProvider with ChangeNotifier {
  final Box<SensorData> _dataBox;

  GetDataMqttProvider() : _dataBox = Hive.box<SensorData>('sensorData');

  List<SensorData> get data => _dataBox.values.toList();

  String generateClientId() {
    final random = Random();
    return "mqttClientId_${random.nextInt(1000)}";
  }

  Future<void> connect() async {
    final clientId = generateClientId();
    client = MqttServerClient.withPort("broker.hivemq.com", clientId, 1883);
    client.keepAlivePeriod = 30;
    client.autoReconnect = true;

    await client.connect().onError((error, stackTrace) {
      developer.log("error -> $error");
      return null;
    });

    client.onConnected = () {
      developer.log('MQTT connected');
    };

    client.onDisconnected = () {
      developer.log('MQTT disconnected');
    };

    client.onSubscribed = (String topic) {
      developer.log('MQTT subscribed to $topic');
    };

    developer.log("Connected with client ID: $clientId");

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      client.subscribe("ceitiot/hackVT", MqttQos.atMostOnce);
      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final jsonString =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        final data = SensorData.fromJson(jsonDecode(jsonString));
        _dataBox.add(data); // Store data in Hive
        notifyListeners();
      });
    }
  }
}
