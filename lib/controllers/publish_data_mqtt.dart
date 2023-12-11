import 'package:hack_vt/package.dart';

Future<void> mqttPublish({required bool message, required String topic}) async {
  final jsonString = jsonEncode(message);
  final builder = MqttClientPayloadBuilder();
  builder.addString(jsonString);
  if (client.connectionStatus?.state == MqttConnectionState.connected) {
    client.publishMessage(
      topic.toString(),
      MqttQos.exactlyOnce,
      builder.payload!,
      retain: true,
    );
    log(topic);
    log('Published data: $jsonString');
  }
}