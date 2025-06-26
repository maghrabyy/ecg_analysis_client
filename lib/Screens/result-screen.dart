import 'package:ecg_analysis2/Layout/root-layout.dart';
import 'package:ecg_analysis2/Widgets/ecg-line-chart.dart';
import 'package:ecg_analysis2/Widgets/info-card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const String path = '/result';
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> response =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(response);
    String classification = response['predicted_class'];
    List<dynamic> rawECG = response['ecg_waveform'];
    double heartRate = response['BPM'];
    String recordId = response['name'];

    List<FlSpot> flSpots = rawECG
        .map((point) => FlSpot(point[0].toDouble(), point[1].toDouble()))
        .toList();

    FlSpot maxYSpot = flSpots.reduce((a, b) => a.y > b.y ? a : b);
    double peak = maxYSpot.y;

    final Map<String, MaterialColor> conditionColorMap = {
      "Normal Beat": Colors.green,
      "Atrial premature beat (APB)": Colors.orange,
      "Aberrated atrial premature beat": Colors.deepOrange,
      "Nodal (junctional) premature beat": Colors.amber,
      "Supraventricular premature beat": Colors.orange,
      "Premature ventricular contraction (PVC)": Colors.red,
      "Ventricular escape beat": Colors.red,
      "Fusion of ventricular and normal beat": Colors.purple,
      "Left bundle branch block beat (LBBB)": Colors.indigo,
      "Right bundle branch block beat (RBBB)": Colors.indigo,
      "Atrial escape beat": Colors.blue,
      "Paced beat": Colors.teal,
      "Signal artifact / noise": Colors.grey,
      "Unknown beat / Unclassified": Colors.blueGrey,
    };

    final MaterialColor conditionColor =
        conditionColorMap[classification] ?? Colors.blueGrey;

    return RootLayout(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            IntrinsicHeight(
              child: Row(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: InfoCard(
                      icon: Icons.medical_information,
                      title: "Record ID",
                      value: 'CASE-$recordId',
                      iconColor: Colors.blue,
                      backgroundColor: Colors.blue[200],
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.favorite,
                      title: "Heart Rate",
                      value: '$heartRate BPM',
                      iconColor: Colors.red,
                      backgroundColor: Colors.red[200],
                    ),
                  ),
                  Expanded(
                    child: InfoCard(
                      icon: Icons.analytics,
                      title: "Condition",
                      value: classification,
                      iconColor: conditionColor,
                      backgroundColor: conditionColor[200],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ECG Waveform',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: ECGLineChart(flSpots: flSpots, peak: peak),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
