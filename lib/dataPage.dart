import 'package:flutter/material.dart';
import 'package:mobprogproject1/editDataPage.dart';
import 'backend.dart';


class DisplayDataPage extends StatefulWidget {
  const DisplayDataPage({super.key});

  @override
  State<DisplayDataPage> createState() => _DisplayDataPageState();
}

class _DisplayDataPageState extends State<DisplayDataPage> {

  List<dynamic> dataList = [];
  //
  @override
  void initState() {
    getDataList();
    super.initState();
  }

  getDataList() async {
      var dataGet = await BaseClient().get('/GetData.php');

    setState(() {
      dataList = dataGet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View with API"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: GestureDetector(
              child: Icon(Icons.edit),
              onTap: (){

                final gName = dataList[index]["name"];
                final gAge = dataList[index]["age"];

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditPage(gName, gAge)),
                );
              },
            ),
            title: Text(dataList[index]["name"]),
            subtitle: Text(dataList[index]["age"]),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                final dName = dataList[index]["name"];
                final dAge = dataList[index]["age"];

                await BaseClient().delete("/DeleteData.php", dName,dAge);

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DisplayDataPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}