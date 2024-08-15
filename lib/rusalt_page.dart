import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final double height;
  final int age;
  final double weight;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.height,
    required this.age,
    required this.weight,
  });

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  Color getBMICategoryColor(double bmi) {
    if (bmi < 18.5) {
      return Color(0xFF84CDEE);
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return Color(0xFF78B060);
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return Color(0xFFE3C94B);
    } else {
      return Color(0xFFDB5A58);
    }
  }

  double getMinHealthyWeight(double height) {
    return 18.5 * (height / 100) * (height / 100);
  }

  double getMaxHealthyWeight(double height) {
    return 24.9 * (height / 100) * (height / 100);
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategory = getBMICategory(bmi);
    Color bmiCategoryColor = getBMICategoryColor(bmi);
    double minHealthyWeight = getMinHealthyWeight(height);
    double maxHealthyWeight = getMaxHealthyWeight(height);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF6EE),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your BMI:',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: MediaQuery.of(context).size.width * 0.13,
                      fontWeight: FontWeight.bold,
                      color: bmiCategoryColor,
                    ),
                  ),
                  Text(
                    bmiCategory,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.w600,
                      color: bmiCategoryColor,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0,
                              MediaQuery.of(context).size.width * 0.25, 2),
                          child: SvgPicture.asset(
                            'assets/vectors/polygon_11_x2.svg',
                            width: MediaQuery.of(context).size.width * 0.015,
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var color in [
                              Color(0xFF84CDEE),
                              Color(0xFF84CDEE),
                              Color(0xFF84CDEE),
                              Color(0xFF84CDEE),
                              Color(0xFF84CDEE),
                              Color(0xFF84CDEE),
                              Color(0xFF78B060),
                              Color(0xFF78B060),
                              Color(0xFF78B060),
                              Color(0xFF78B060),
                              Color(0xFF78B060),
                              Color(0xFF78B060),
                              Color(0xFFE3C94B),
                              Color(0xFFE3C94B),
                              Color(0xFFE3C94B),
                              Color(0xFFE3C94B),
                              Color(0xFFE3C94B),
                              Color(0xFFE3C94B),
                              Color(0xFFDB5A58),
                              Color(0xFFDB5A58),
                              Color(0xFFDB5A58),
                              Color(0xFFDB5A58),
                              Color(0xFFDB5A58),
                            ])
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryLabel(
                          context, "Underweight", Color(0xFF84CDEE)),
                      _buildCategoryLabel(context, "Normal", Color(0xFF78B060)),
                      _buildCategoryLabel(
                          context, "Overweight", Color(0xFFE3C94B)),
                      _buildCategoryLabel(context, "Obese", Color(0xFFDB5A58)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInfoColumn(
                          context, 'Weight', '${weight.toStringAsFixed(1)} kg'),
                      _buildInfoColumn(
                          context, 'Height', '${height.toStringAsFixed(1)} cm'),
                      _buildInfoColumn(context, 'Age', '$age'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    'Healthy weight for the height:',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color(0xFFACACAC),
                    ),
                  ),
                  Text(
                    '${minHealthyWeight.toInt()} kg - ${maxHealthyWeight.toInt()} kg',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Color(0xFF78B060),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xFF78B060),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                        horizontal: MediaQuery.of(context).size.width * 0.15,
                      ),
                      child: Text(
                        'Close',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryLabel(BuildContext context, String label, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.005,
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: MediaQuery.of(context).size.width * 0.03,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoColumn(BuildContext context, String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: const Color(0xFF78B060),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            fontSize: MediaQuery.of(context).size.width * 0.035,
            color: const Color(0xFFACACAC),
          ),
        ),
      ],
    );
  }
}
