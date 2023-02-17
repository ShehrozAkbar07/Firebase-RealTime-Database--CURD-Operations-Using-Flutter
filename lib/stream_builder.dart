import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StreamBuilderr extends StatefulWidget {
  const StreamBuilderr({super.key});

  @override
  State<StreamBuilderr> createState() => _StreamBuilderrState();
}

class _StreamBuilderrState extends State<StreamBuilderr> {
  final ref = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    CircularProgressIndicator();
                  } else {
                    Map<dynamic, dynamic> map =
                        snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();

                    return ListView.builder(
                        itemCount: snapshot.data!.snapshot.children.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(list[index]['title']),
                            subtitle: Text(list[index]['id']),
                          );
                        });
                  }
                  throw standardEasing;
                }),
          )
        ],
      ),
    );
  }
}
