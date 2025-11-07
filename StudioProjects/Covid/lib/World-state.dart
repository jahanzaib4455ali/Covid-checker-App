import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'View/countrylist.dart';
import 'Services/uitilities/states_services.dart';

class Worldstate extends StatefulWidget {
  const Worldstate({Key? key}) : super(key: key);

  @override
  State<Worldstate> createState() => _WorldstateState();
}

class _WorldstateState extends State<Worldstate> {
  final colorList = const <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  StateServices stateServices = StateServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: stateServices.fetchWorldStats(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              var data = snapshot.data;
              double confirmed = double.parse(data['cases'].toString());
              double recovered = double.parse(data['recovered'].toString());
              double deaths = double.parse(data['deaths'].toString());

              Map<String, double> dataMap = {
                "Confirmed": confirmed,
                "Recovered": recovered,
                "Deaths": deaths,
              };

              return Column(
                children: [
                  const SizedBox(height: 20),
                  PieChart(
                    dataMap: dataMap,
                    colorList: colorList,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 20,
                    chartRadius: MediaQuery.of(context).size.height * 0.18,
                    chartValuesOptions: const ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValues: true,
                      showChartValuesOutside: true,
                    ),
                    legendOptions: const LegendOptions(
                      showLegends: true,
                      legendPosition: LegendPosition.left,
                      legendTextStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ReusableRow(title: "Total Cases", value: data['cases'].toString()),
                                    ReusableRow(title: "Today Cases", value: data['todayCases'].toString()),
                                    ReusableRow(title: "Deaths", value: data['deaths'].toString()),
                                    ReusableRow(title: "Today Deaths", value: data['todayDeaths'].toString()),
                                    ReusableRow(title: "Recovered", value: data['recovered'].toString()),
                                    ReusableRow(title: "Today Recovered", value: data['todayRecovered'].toString()),
                                    ReusableRow(title: "Active", value: data['active'].toString()),
                                    ReusableRow(title: "Critical", value: data['critical'].toString()),
                                    ReusableRow(title: "Cases Per Million", value: data['casesPerOneMillion'].toString()),
                                    ReusableRow(title: "Deaths Per Million", value: data['deathsPerOneMillion'].toString()),
                                    ReusableRow(title: "Tests", value: data['tests'].toString()),
                                    ReusableRow(title: "Tests Per Million", value: data['testsPerOneMillion'].toString()),
                                    ReusableRow(title: "Population", value: data['population'].toString()),
                                    ReusableRow(title: "Affected Countries", value: data['affectedCountries'].toString()),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to CountryListScreen on button press
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CountryListScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Track Countries",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title;
  final String value;

  const ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
