import 'package:flutter/material.dart';

class WorkEdit extends StatefulWidget {
  final String workHeading;
  final Map<String, dynamic> workData;

  const WorkEdit({Key? key, required this.workHeading, required this.workData}) : super(key: key);

  @override
  State<WorkEdit> createState() => _WorkEditState();
}

class _WorkEditState extends State<WorkEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workHeading),
      ),

      body: Center(
        child:Column(
          children: [
            Text(
              'Title: ${widget.workData['title'] ?? 'Title'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            Text(
              'Description: ${widget.workData['desc'] ?? 'Description'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        )

      ),

    );
  }
}
