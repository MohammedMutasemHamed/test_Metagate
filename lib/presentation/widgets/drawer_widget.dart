import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
            drawerItem(
              Icons.home,
              'Home',
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text(
                          'Home',
                        ),
                      ),
                      body: const Center(
                        child: Text(
                          'Home Page...',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    );
                  }));
                }
              },
            ),
            drawerItem(
              Icons.perm_device_information,
              'My Devices',
              onTap: () => Navigator.pop(context),
            ),
            drawerItem(
              Icons.settings,
              'Settings',
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: const Text(
                            'Settings',
                          ),
                        ),
                        body: const Center(
                          child: Text(
                            'Settings Page...',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      );
                    }),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(final IconData icon, String title,
      {GestureTapCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      isThreeLine: false,
      leading: Icon(icon),
      title: Text(
        title,
      ),
    );
  }
}
