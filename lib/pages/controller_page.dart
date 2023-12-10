import 'package:hack_vt/package.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _NaviPageState();
}

class _NaviPageState extends State<ControllerPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    DocumentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Material(
        elevation: 2,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.3)),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/house-chimney.svg',
                  ),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/document.svg',
                  ),
                  label: "document",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
