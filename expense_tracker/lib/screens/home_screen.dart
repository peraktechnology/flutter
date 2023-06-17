import 'package:flutter/material.dart';
import '../Classes/accounts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_ticker/screens/entry_screen.dart';
import 'package:pie_chart/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Accounts>> getAccounts() async {
    final firestore = FirebaseFirestore.instance;
    final qn = await firestore.collection("Accounts").get();
    return qn.docs.map((e) => Accounts.fromJson(e.data())).toList();
  }

  final chartMap = <String, double>{
    "Expense": 0,
    "Income": 0,
    "Saving": 0,
  };
  Future<Map<String, double>> getChartData() async {
    final List<Accounts> accounts = await getAccounts();
    for (var item in accounts) {
      if (item.type == 'Expense') {
        if (chartMap[item.type] == null) {
          chartMap[item.type] = item.amount;
        } else {
          chartMap.update(item.type, (value) => value + item.amount);
        }
      } else {
        if (chartMap[item.type] == null) {
          chartMap[item.type] = item.amount;
        } else {
          chartMap.update(item.type, (value) => value + item.amount);
        }
      }
    }
    final saving = chartMap['Income']! - chartMap['Expense']!;
    if (saving > 0) {
      chartMap['Saving'] = saving;
    } else {
      chartMap['Saving'] = 0;
    }
    setState(() {});

    return chartMap;
  }

  @override
  void initState() {
    getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 18.0, top: 10.0, bottom: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EntryScreen()),
                );
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    size: 16,
                  ),
                  Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.only(left: 30),
            child: PieChart(
              dataMap: chartMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 35,
              chartRadius: MediaQuery.of(context).size.width / 1.2,
              colorList: const [
                Colors.red,
                Colors.green,
                Colors.grey,
              ],
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 11,
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: false,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: FutureBuilder<List<Accounts>>(
              future: getAccounts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 8),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 3, right: 3),
                              child: ListTile(
                                leading: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey.shade300,
                                    child:
                                        snapshot.data![index].type == 'Expense'
                                            ? const Icon(
                                                Icons.arrow_back,
                                                color: Colors.redAccent,
                                                size: 35,
                                              )
                                            : const Icon(
                                                Icons.arrow_forward,
                                                color: Colors.green,
                                                size: 35,
                                              ),
                                  ),
                                ),

                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].title,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    Text(
                                      snapshot.data![index].description,
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    ),
                                    Text(
                                      '${snapshot.data![index].date} at ${snapshot.data![index].time}',
                                      style: const TextStyle(
                                          fontSize: 8.0, color: Colors.grey),
                                    ),
                                  ],
                                ),

                                // subtitle: Text(account.description),
                                trailing: Text(
                                  snapshot.data![index].amount.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          index == snapshot.data!.length - 1
                              ? const SizedBox(
                                  height: 20,
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
