import 'package:hack_vt/package.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<GetDataMqttProvider>().connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          backgroundColor: ConstantColor.colorMain,
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Profile(),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Project Monitoring",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            MonitorPage(),
          ],
        ),
      ),
    );
  }
}
