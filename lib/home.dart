import 'package:flutter/material.dart';
import 'package:mobprogproject1/backend.dart';
import 'package:mobprogproject1/dataPage.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
      ),

      body: Column(
        children: [
          TextField( //TextField Customization =================
            controller: nameController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Name',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),

          TextField( //TextField Customization =================
            controller: ageController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Age',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment. center,
              children: <Widget>[
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    elevation: 0,
                  ),

                  onPressed: ()  async {

                    String getName = nameController.text;
                    String getAge = ageController.text;

                   await BaseClient().post('/AddData.php', getName, getAge);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },

                  child: Text("Add Data"),
                ),

                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  elevation: 0,
                  ), onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayDataPage()),
                  );
                  },
                  child: Text("Get"),
                ),
                  ],
            ),
          )
        ],
      )
    );
  }
}
