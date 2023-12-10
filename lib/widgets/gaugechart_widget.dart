import 'package:hack_vt/package.dart';

class GaugeChart extends StatelessWidget {
  final String title;
  final double value;

  const GaugeChart(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text("$title: ${value.toString()}"),
        // const SizedBox(height: 8),
        SizedBox(
          height: 150,
          width: 150,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 100,
                axisLineStyle: const AxisLineStyle(thickness: 15),
                showFirstLabel: true,
                startAngle: 180,
                endAngle: 0,
                canScaleToFit: true,
                showTicks: true,
                showLabels: true,
                pointers: <GaugePointer>[
                  RangePointer(
                    value: value,
                    color: Colors.blue,
                    width: 15,
                  ),
                  NeedlePointer(
                    value: value,
                    needleStartWidth: 2,
                    needleEndWidth: 2,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
