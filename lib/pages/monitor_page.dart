// monitor_page.dart
import 'package:hack_vt/package.dart';

class MonitorPage extends StatelessWidget {
  const MonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GetDataMqttProvider>(
      builder: (context, dataprovider, index) {
        if (dataprovider.data.isEmpty) {
          return const CircularProgressIndicator();
        } else {
          final data = dataprovider.data.last;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: [
                SectionWidget(
                  title: "Temperature",
                  iconPath: "assets/icons/summer.svg",
                  value: "${data.temperature.toString()} ˚C",
                  chart: GaugeChart("Humidity", data.temperature),
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: "Humidity",
                  iconPath: "assets/icons/dewpoint.svg",
                  value: "${data.humidity.toString()} %",
                  chart: GaugeChart("Humidity", data.humidity),
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: "Soil Moisture",
                  iconPath: "assets/icons/raindrops.svg",
                  value: "${data.soilmoisture.toString()} %",
                  chart: BarChart(value: data.soilmoisture),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
