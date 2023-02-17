import 'package:curd_operation/fetch_from_database.dart';
import 'package:curd_operation/stream_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

TextEditingController field = TextEditingController();
final databaseRef = FirebaseDatabase.instance.ref('Post');
bool loading = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text('Hello'),
          TextFormField(
            maxLines: 4,
            decoration: InputDecoration(border: OutlineInputBorder()),
            controller: field,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
                height: 40,
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      databaseRef
                          .child(
                              DateTime.now().millisecondsSinceEpoch.toString())
                          .set({
                        'title': field.text.toString(),
                        'id': DateTime.now()
                            .millisecondsSinceEpoch
                            .toString()
                            .trim()
                      }).then((value) {
                        print('Object Upload Sucessfully');
                      });
                    },
                    child: Text('Add'))),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StreamBuilderr()));
            },
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            ),
          )
        ],
      ),
    ));
  }
}
