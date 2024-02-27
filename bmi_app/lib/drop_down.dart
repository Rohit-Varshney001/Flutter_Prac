import 'package:flutter/material.dart';


class DropdownButtonExample extends StatefulWidget {
  final Function(String) onChanged;
  final List<String> list; // Define a parameter for the list of options

  const DropdownButtonExample({Key? key, required this.list, required this.onChanged}) : super(key: key);



  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String dropdownValue;

  void initState() {
    super.initState();
    dropdownValue = widget.list.first; // Set initial dropdown value
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_outlined),
      elevation: 10,
      style: const TextStyle(color : Colors.indigo),
      underline: Container(
        color: Colors.blue,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.onChanged(value!);

        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
          ),),
        );
      }).toList(),
    );
  }
}
