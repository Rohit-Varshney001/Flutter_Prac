import 'package:flutter/material.dart';

class WorkEdit extends StatefulWidget {
  final String workHeading;
  final String workDescription;

  const WorkEdit({Key? key, required this.workHeading, required this.workDescription}) : super(key: key);

  @override
  State<WorkEdit> createState() => _WorkEditState();
}

class _WorkEditState extends State<WorkEdit> {
  late TextEditingController _headingController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController(text: widget.workDescription);
    _headingController = TextEditingController(text: widget.workHeading);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 5,
        bottomOpacity: 0.5,
        shadowColor: Colors.deepPurple,
        title: TextFormField(

          controller: _headingController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), // Text color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _descriptionController,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can access the edited heading via _headingController.text
          // Perform any actions needed with the edited heading here
          // You can access the edited description via _descriptionController.text
          // Perform any actions needed with the edited description here
          Navigator.pop(context); // Close the edit screen
        },
        child: Icon(Icons.save),
      ),
    );
  }

  @override
  void dispose() {
    _headingController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }
}
