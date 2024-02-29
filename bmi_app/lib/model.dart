import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchRandomQuote extends StatelessWidget {
  const FetchRandomQuote({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchRandomQuote(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent), // Change the color
              strokeWidth: 2, // Adjust the thickness of the indicator
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            snapshot.data ?? 'No quote available',
            style: TextStyle(
              color: Colors.yellow.shade800,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          );
        }
      },
    );
  }

  Future<String> fetchRandomQuote() async {
    final String url = "https://random-quote-generator2.p.rapidapi.com/randomQuote";

    final Map<String, String> headers = {
      "X-RapidAPI-Key": "8eebd94f04mshb9a9c83a28cb426p1cc0c9jsn86f6c1394094",
      "X-RapidAPI-Host": "random-quote-generator2.p.rapidapi.com"
    };

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final dynamic jsonData = json.decode(response.body);
      if (jsonData.isNotEmpty) {
        final Map<String, dynamic> jsonDatas = jsonData.first;
        final String quote = jsonDatas["Quote"];
        return quote;
      }
    }
    return "Error loading Quote";
  }
}
