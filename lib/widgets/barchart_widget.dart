import 'package:hack_vt/package.dart';

class BarChart extends StatelessWidget {
  final double value;

  const BarChart({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(double value) {
      double normalizedValue = (value - 0) / (100 - 0);
      return Color.lerp(Colors.red, Colors.green, normalizedValue)!;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
      child: SizedBox(
        height: 160,
        width: 70,
        child: SfLinearGauge(
          minimum: 0,
          maximum: 100,
          barPointers: [
            LinearBarPointer(
              position: LinearElementPosition.outside,
              thickness: 50,
              value: value,
              color: getColor(value),
            ),
          ],
          orientation: LinearGaugeOrientation.vertical,
        ),
      ),
    );
  }
}
