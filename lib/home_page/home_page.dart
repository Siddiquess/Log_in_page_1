import 'package:flutter/material.dart';
import 'package:my_snap/home_page/chat_contents.dart';
import 'package:my_snap/login_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

List newsnap = List.filled(14, 'New Snap');
List delivered = List.filled(
  14,
  'Delivered',
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // =================== Drawer ==================== //
        endDrawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/sn8.webp'),
                    backgroundColor: Colors.blue,
                  ),
                  accountName: Text('siddique'),
                  accountEmail: Text('siddiquekp@gmail.com')),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out'),
                onTap: () async {
                  final sharedprfrnc = await SharedPreferences.getInstance();
                  await sharedprfrnc.clear();

                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: ((context) => LoginPage())),
                      (route) => false);
                },
              )
            ],
          ),
        ),

        // ================= App Bar ==================== //
        appBar: AppBar(
          backgroundColor: Colors.white,

          // ============ Leading ============ //

          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 220, 217, 217),
                backgroundImage: AssetImage(
                  'images/sn8.webp',
                ),
                maxRadius: 20,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                maxRadius: 20,
                child: const Icon(
                  Icons.search_rounded,
                  color: Colors.black54,
                ),
              )
            ],
          ),

          // ============ Title ============== //

          title: const Text(
            'Chat',
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          centerTitle: true,
          leadingWidth: 90,
          // ============ action ============= //
          actions: [
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(
                Icons.person_add,
                color: Colors.black54,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.grey,
                );
              }),
            )
          ],
          elevation: 0,
        ),

        // ================== Body ====================== //

        body: const ChatContents());
  }
}
