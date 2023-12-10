// main.dart
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hack_vt/package.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SensorDataAdapter());
  await Hive.openBox<SensorData>('sensorData');
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const Myapp());
  
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GetDataMqttProvider())],
      child: MaterialApp.router(
        title: "Mqtt App",
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
