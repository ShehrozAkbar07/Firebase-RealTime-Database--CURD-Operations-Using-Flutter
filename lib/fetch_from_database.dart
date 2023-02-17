import 'package:curd_operation/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// With Animated List

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  final ref = FirebaseDatabase.instance.ref('Post');
  TextEditingController searchFilter = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => Home())));
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(children: [
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: searchFilter,
          onChanged: (String value) {
            setState(() {});
          },
          decoration:
              InputDecoration(hintText: 'hello', border: OutlineInputBorder()),
        ),
        Expanded(
          child: FirebaseAnimatedList(
              physics: BouncingScrollPhysics(),
              query: ref,
              itemBuilder: ((context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();
                if (searchFilter.text.isEmpty) {
                  return ListTile(
                    focusColor: Colors.blue,
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                  );
                } else if (title
                    .toLowerCase()
                    .contains(searchFilter.text.toLowerCase())) {
                  return ListTile(
                    focusColor: Colors.blue,
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                  );
                } else {
                  Container();
                }
                return Container();
              })),
        )
      ]),
    );
  }
}
