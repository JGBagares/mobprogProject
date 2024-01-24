import 'package:flutter/material.dart';
import 'package:mobprogproject1/backend.dart';

import 'package:mobprogproject1/dataPage.dart';



class EditPage extends StatefulWidget {

  final String iName;
  final String iAge;

  EditPage(this.iName, this.iAge, {super.key});



  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Page'),
        ),

        body: Column(
          children: [
            Text('Name: '),

            TextField( //TextField Customization =================
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: widget.iName,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),

            Text('Age: '),
            TextField( //TextField Customization =================
              controller: ageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: widget.iAge,
                hintStyle: const TextStyle(
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

                      String editName = nameController.text;
                      String editAge = ageController.text;

                      if(editName==""){
                        editName = widget.iName;
                      }

                      if(editAge==""){
                        editAge = widget.iAge;
                      }
                      
                      await BaseClient().put('/UpdateData.php', widget.iName, widget.iAge, editName, editAge);

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DisplayDataPage()),
                      );
                    },

                    child: Text("Edit"),
                  ),


                ],
              ),
            )
          ],
        )
    );
  }
}
