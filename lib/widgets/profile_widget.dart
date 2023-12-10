import 'package:go_router/go_router.dart';
import 'package:hack_vt/package.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ConstantColor.colorMain,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SizedBox(
                height: 35,
                width: 35,
                child: SvgPicture.asset("assets/icons/woman-head.svg"),
              ),
              const SizedBox(
                width: 20,
              ),
              const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Xailisa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("CHANTHAVONG",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14))
                  ])
            ]),
            IconButton(
                onPressed: () => context.go("/notification"),
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}
