import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app/mahasiswa/mahasiswa_get.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/logo.png")),
                accountName: Text("72200407"),
                accountEmail: Text("Franklin David Hengkengbala")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.home_repair_service),
              title: Text('Test'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_outlined),
              title: Text('Mahasiswa CRUD'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => getMahasiswa()),
                );
              },
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          buildContainer(),
          buildContainer(),
          buildContainer(),
          // buildCard(context)
        ],
      ),
    );
  }

  // Card buildCard(BuildContext context) {
  //   return Card(
  //     elevation: 8,
  //     child: Column(
  //       children: [
  //         ListTile(
  //           leading: Icon(Icons.home),
  //           title: Text('Pertemuan 1'),
  //           subtitle: Text('Pertemuan 1'),
  //           trailing: Icon(Icons.arrow_forward_ios),
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //         Row(
  //           children: [
  //             TextButton(
  //               onPressed: () {},
  //               child: Text('Button 1'),
  //             ),
  //             TextButton(
  //               onPressed: () {},
  //               child: Text('Button 2'),
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  Container buildContainer() {
    return Container(
      child: Text(
          'Aenean vel aliquam arcu, ut varius ante. Morbi pellentesque, eros quis gravida blandit, erat erat fermentum nisi, nec molestie massa est sed justo. Aliquam fermentum mi eu leo laoreet, id ullamcorper metus laoreet. Cras eu lobortis nunc, id placerat mi. Nullam sem lacus, egestas eget suscipit sit amet, molestie eget mi. Nulla id lacus ac sem cursus ornare vel sed urna. Quisque consectetur viverra sem quis imperdiet. Etiam consequat posuere ex nec blandit. Nulla ut tincidunt dolor. Donec in fermentum libero. Proin at purus et diam feugiat condimentum. Integer et varius neque. Vivamus sed libero nunc. Phasellus eu libero hendrerit, sagittis felis id, sollicitudin ipsum.'),
      padding: EdgeInsets.all(0.0),
    );
  }
}
