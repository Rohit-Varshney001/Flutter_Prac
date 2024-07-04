import 'package:covid_tracker_app/Services/stats_services.dart';
import 'package:covid_tracker_app/Views/selected_country_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search with Country name",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statsServices.CountryListApi(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    List<dynamic> filteredList = snapshot.data!
                        .where((country) => country['country']
                            .toLowerCase()
                            .contains(_searchText.toLowerCase()))
                        .toList();
                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        var countryInfo = filteredList[index]['countryInfo'];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectedCountryScreen(
                                              countryName: filteredList[index]['country'] ?? 'N/A',
                                            )));
                              },
                              child: ListTile(
                                title: Text(
                                    filteredList[index]['country'] ?? 'N/A'),
                                subtitle: Text(countryInfo['iso3'] ?? 'N/A'),
                                leading: countryInfo['flag'] != null
                                    ? Image.network(
                                        countryInfo['flag'],
                                        height: 50,
                                        width: 50,
                                      )
                                    : Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.grey,
                                      ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
