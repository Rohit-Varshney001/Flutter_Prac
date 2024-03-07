import 'package:flutter/material.dart';

import 'database helper/show_data.dart';

class CompleteDocument extends StatefulWidget {
  final String heading;

  const CompleteDocument({Key? key, required this.heading}) : super(key: key);

  @override
  State<CompleteDocument> createState() => _CompleteDocumentState();
}

class _CompleteDocumentState extends State<CompleteDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.heading), // Accessing the heading passed to the widget
      ),
        body: ShowData(heading: widget.heading,),
        floatingActionButton:  Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepOrange],
            ),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            child: const Icon(Icons.logout),
            onPressed: (){},
          ),
        )

    );
  }
}
