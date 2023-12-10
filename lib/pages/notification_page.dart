import 'package:hack_vt/package.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
        backgroundColor: ConstantColor.colorMain,
      ),
    );
  }
}
