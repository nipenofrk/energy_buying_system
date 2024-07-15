import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartOne extends StatefulWidget {
  const LineChartOne({super.key});

  @override
  State<LineChartOne> createState() => _LineChartOneState();
}

class _LineChartOneState extends State<LineChartOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LineChartSample2(),
      ),
    );
  }
}

class LineChartSample2 extends StatelessWidget {
  LineChartSample2({super.key});

  final List<Color> gradientColors = [
    Colors.blue,
    Colors.red,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 2000,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(
              right: 18.0, left: 12.0, top: 24, bottom: 12),
          child: LineChart(
            mainData(),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text = const Text('', style: style);

    final step = data.length ~/ 4;
    if (value.toInt() % step == 0) {
      final index = value.toInt() ~/ step;
      text = Text('0:${(index * 5).toString().padLeft(2, '0')}', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = const {
          1: '10K',
          3: '30K',
          5: '50K',
          7: '70K',
          9: '90K',
        }[value.toInt()] ??
        '';
    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: data.length - 1,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            for (final entry in data.entries)
              FlSpot(entry.key.toDouble(), entry.value.toDouble())
          ],
          color: Colors.white,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

final data = [
  3.45,
  2.14,
  1.88,
  2.02,
  2.25,
  2.20,
  2.18,
  2.49,
  2.87,
  3.06,
  3.00,
  2.35,
  2.08,
  2.22,
  2.24,
  2.43,
  2.14,
  2.16,
  2.16,
  1.85,
  2.02,
  1.90,
  2.12,
  1.71,
  1.85,
  1.77,
  1.79,
  2.14,
  2.25,
  2.29,
  2.31,
  2.79,
  2.54,
  2.72,
  2.37,
  2.35,
  2.41,
  2.66,
  2.79,
  3.04,
  3.58,
  4.29,
  3.99,
  4.42,
  5.05,
  5.01,
  5.51,
  8.90,
  8.16,
  5.61,
  5.23,
  5.19,
  4.19,
  3.72,
  3.10,
  2.97,
  2.18,
  2.45,
  2.33,
  2.29,
  2.31,
  2.31,
  3.02,
  3.43,
  3.50,
  3.25,
  2.99,
  3.08,
  3.54,
  4.12,
  4.04,
  4.74,
  5.42,
  7.70,
  5.92,
  5.25,
  5.80,
  5.82,
  5.03,
  4.99,
  4.62,
  4.62,
  4.46,
  6.12,
  6.13,
  5.37,
  5.38,
  5.70,
  6.33,
  6.26,
  5.92,
  5.41,
  5.15,
  6.34,
  6.16,
  6.58,
  6.15,
  6.13,
  6.95,
  7.16,
  6.46,
  7.17,
  7.62,
  9.52,
  1.75,
  3.41,
  0.30,
  3.05,
  8.68,
  7.54,
  6.88,
  7.16,
  6.25,
  6.20,
  6.16,
  7.13,
  4.90,
  5.84,
  7.41,
  6.73,
  6.54,
  8,
  7.11,
  7.59,
  7.63,
  7.34,
  6.21,
  6.21,
  6.08,
  6.74,
  7.09,
  7.11,
  7.99,
  8.53,
  9.41,
  0.17,
  1.26,
  2.68,
  1.08,
  8.25,
  7.66,
  6.74,
  6.67,
  5.82,
  5.24,
  4.51,
  3.95,
  3.5,
  3.83,
  3.79,
  3.37,
  3.14,
  2.99,
  4.00,
  3.66,
  5.34,
  5.83,
  5.32,
  4.29,
  4.03,
  4.13,
  4.79,
  4.62,
  4.32,
  3.89,
  3.43,
  3.70,
  4.25,
  4.49,
  4.08,
  3.97,
  4.24,
  4.30,
  4.54,
  4.41,
  4.05,
  3.89,
  3.56,
  3.24,
  3.16,
  2.66,
  2.50,
  2.16,
  1.94,
  2.43,
  2.45,
  2.95,
  2.83,
  2.85,
  3.31,
  3.54,
  3.33,
  3.33,
  3.33,
  3.81,
  4.16,
  4.04,
  3.83,
  3.62,
  3.43,
  3.62,
  3.68,
  3.64,
  4.24,
  4.70,
  6,
  4.90,
  4.66,
  4.58,
  4.58,
  4.04,
  3.91,
  3.91,
  3.77,
  4.12,
  3.47,
  2.99,
  2.87,
  2.83,
  2.60,
  2.85,
  2.77,
  2.83,
  2.77,
  2.66,
  2.33,
  2.08,
  1.92,
  2.27,
  1.98,
  1.72,
  1.91,
  1.91,
  2.58,
  2.81,
  2.81,
  2.99,
  2.97,
  2.54,
  3.58,
  3.29,
  2.85,
  2.87,
  3.10,
  3.14,
  2.97,
  2.97,
  2.89,
  2.97,
  2.87,
  3.00,
  2.81,
  3.87,
  2.66,
  2.68,
  2.79,
  2.79,
  2.97,
  2.83,
  2.95,
  3,
  3.27,
  4.08,
  4.04,
  3.10,
  2.68,
  2.95,
  2.64,
  2.64,
  2.39,
  2.37,
  2.22,
  2.56,
  2.33,
  2.64,
  2.22,
  2.02,
  1.90,
  1.79,
  1.73,
  1.75,
  1.62,
  1.77,
  2.29,
].asMap();


//
// SizedBox(
//         height: 200,
//         width: 200,
//         child: LineChartOne(),
//       ),