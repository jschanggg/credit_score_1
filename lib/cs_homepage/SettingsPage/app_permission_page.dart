import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({Key? key}) : super(key: key);

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5c6bc0),
        title: Text(
          "App Permissions",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Image.asset(
                  'assets/images/permission.png',
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                'Showing permissions of this app',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 5),
              child: Container(
                  child: Text(
                'This app has access to:',
                style: TextStyle(fontSize: 18),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Storage',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.storage,
                ),
                subtitle: Text(
                    '- modify or delete the contents of your USB storage \n- read the contents of your USB storage'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Photos/Media/Files',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.perm_media,
                ),
                subtitle: Text(
                    '- read the contents of your USB storage \n- modify or delete the contents of your USB storage'),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: ListTile(
            //     title: Text(
            //       'Phone',
            //       style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     leading: Icon(
            //       Icons.phone,
            //     ),
            //     subtitle: Text('- read phone status and identity'),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Wi-Fi connection information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.wifi,
                ),
                subtitle: Text('- view Wi-Fi connections'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.location_on,
                ),
                subtitle: Text('- precise location'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  'Other',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.info,
                ),
                subtitle: Text(
                    '- receive data from Internet \n- download files without notification \n- view network connections \n- full network access'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
