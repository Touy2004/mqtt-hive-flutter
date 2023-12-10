import 'package:hack_vt/package.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: AppBar(
          backgroundColor: ConstantColor.colorMain,
        ),
      ),
      body: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: ConstantColor.colorMain,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: Text("Document",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)))
                ],
              )),
          const Expanded(child: Center(child: Text("Not available")))
        ],
      ),
    );
  }
}
