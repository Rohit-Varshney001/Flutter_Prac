import 'package:covid_tracker_app/Modal/world_stats_model.dart';
import 'package:covid_tracker_app/Services/stats_services.dart';
import 'package:covid_tracker_app/Views/countries_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>with TickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final coloursList = <Color>[
    const Color(0xff5992ef),
    const Color(0xffe3415d),
    const Color(0xff63c226)
  ];
  

  @override
  Widget build(BuildContext context) {

    StatsServices statsServices = StatsServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
               FutureBuilder(
                   future: statsServices.fetchWorldStatsRecords(),
                   builder: (context,AsyncSnapshot<WorldStatsModel> snapshot){
                     if(!snapshot.hasData){
                       return Expanded(flex: 1,
                           child: SpinKitFadingCircle(
                            color: Colors.white,
                             controller: _controller,
                             size: 50.0,
                       ));
                     }else{
                        return Column(
                          children: [
                            PieChart(
                              chartValuesOptions: const ChartValuesOptions(showChartValuesInPercentage: true),
                              dataMap:  {
                                "Total":double.parse(snapshot.data!.cases.toString()),
                                "Recovered": double.parse(snapshot.data!.recovered.toString()),
                                "Deaths": double.parse(snapshot.data!.deaths.toString()),
                              },
                              animationDuration: Duration(milliseconds: 1200),
                              chartType: ChartType.ring,
                              colorList: coloursList,
                              chartRadius: MediaQuery.of(context).size.height * 0.4,
                              legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.08),
                              child: Card(child: Column(
                                children: [
                                  ReusableRow(value: snapshot.data!.cases.toString(), title: "Total Cases"),
                                  ReusableRow(value: snapshot.data!.deaths.toString(), title: "Total Deaths"),
                                  ReusableRow(value: snapshot.data!.critical.toString(), title: "Critical"),
                                  ReusableRow(value: snapshot.data!.todayCases.toString(), title: "Today's Cases"),
                                  ReusableRow(value: snapshot.data!.todayDeaths.toString(), title: "Today's Deaths"),
                                  ReusableRow(value: snapshot.data!.recovered.toString(), title: "Recovered"),


                                ],
                              ),),
                            ),
                            GestureDetector(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xff14e144),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                      'Track Countries'
                                  ),
                                ),
                              ),
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesListScreen()));
                              },
                            )
                          ],
                        );
                     }
                   }),

            ],
          ),
        ),
      ),
    );
  }
}
class ReusableRow extends StatelessWidget{
  final String title, value;
  const ReusableRow({super.key, required this.value, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          )
        ],
      ),
    );
  }

}