import 'package:covid_tracker_app/Views/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Modal/country_stats_model.dart';
import '../Services/stats_services.dart';

class SelectedCountryScreen extends StatefulWidget {
  final String countryName;
  const SelectedCountryScreen({Key? key, required this.countryName}) : super(key: key);

  @override
  State<SelectedCountryScreen> createState() => _SelectedCountryScreenState();
}

class _SelectedCountryScreenState extends State<SelectedCountryScreen>
    with TickerProviderStateMixin {
  StatsServices statsServices = StatsServices();
  String? _selectedCountry;
  late Future<CountryStatsModel> _countryStatsFuture;
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _countryList = [];
  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();

  @override
  void initState() {
    _selectedCountry = widget.countryName;
    _countryStatsFuture = statsServices.fetchCountryStatsRecord(_selectedCountry!);
    super.initState();
    _loadCountryList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadCountryList() async {
    var countryList = await statsServices.CountryListApi();
    setState(() {
      _countryList = countryList;
    });
  }

  void _onCountrySelected(String? newCountry) {
    setState(() {
      _selectedCountry = newCountry;
      _countryStatsFuture = statsServices.fetchCountryStatsRecord(_selectedCountry!);
    });
  }

  List<dynamic> _filteredCountries(String searchText) {
    return _countryList.where((country) {
      String countryName = country['country'];
      return countryName.toLowerCase().contains(searchText.toLowerCase());
    }).toList();
  }

  void _showCountryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              content: Container(
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black45,
                          hintText: 'Search country',
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: MediaQuery.of(context).size.height *0.7,
                        child: ListView(
                          shrinkWrap: true,
                          children: _filteredCountries(_searchController.text).map<Widget>((country) {
                            return ListTile(
                              title: Text(country['countryInfo']['iso3'] ?? country['country']),
                              leading: Image(
                                image: NetworkImage(country['countryInfo']['flag']),
                                height: 24,
                                width: 24,
                              ),
                              onTap: () {
                                _onCountrySelected(country['country']);
                                Navigator.of(context).pop();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedCountry!,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _countryStatsFuture,
            builder: (context, AsyncSnapshot<CountryStatsModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  flex: 1,
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    controller: _controller,
                    size: 50.0,
                  ),
                );
              } else {
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.067,
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.067,
                            ),
                            ReusableRow(
                              value: snapshot.data!.cases.toString(),
                              title: "Total Cases",
                            ),
                            ReusableRow(
                              value: snapshot.data!.deaths.toString(),
                              title: "Total Deaths",
                            ),
                            ReusableRow(
                              value: snapshot.data!.critical.toString(),
                              title: "Critical",
                            ),
                            ReusableRow(
                              value: snapshot.data!.todayCases.toString(),
                              title: "Today's Cases",
                            ),
                            ReusableRow(
                              value: snapshot.data!.todayDeaths.toString(),
                              title: "Today's Deaths",
                            ),
                            ReusableRow(
                              value: snapshot.data!.recovered.toString(),
                              title: "Recovered",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data!.countryInfo!.flag.toString()),
                            radius: 50,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                _showCountryDialog(context);
                              },
                              child: Icon(
                                Icons.arrow_drop_down_outlined, size: 25, color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
