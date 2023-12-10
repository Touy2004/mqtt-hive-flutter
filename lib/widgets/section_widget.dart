import 'package:hack_vt/package.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final String value;
  final Widget chart;

  const SectionWidget({
    required this.title,
    required this.iconPath,
    required this.value,
    required this.chart,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ConstantColor.colorBackground,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 35,
                        width: 35,
                        child: SvgPicture.asset(iconPath),
                      ),
                      const SizedBox(width: 10),
                      Text(title, style: ConstantText.styleSensorName),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Text(value, style: ConstantText.styleSensorValue),
                  ),
                ],
              ),
            ),
            Expanded(child: chart),
          ],
        ),
      ),
    );
  }
}
