import 'package:bmi_1_app/second_Screen.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  bool? isMaleSelected;

  void _toggleGenderSelection(bool isMale) {
    setState(() {
      isMaleSelected = isMale;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                    color: const Color(0xFF78B060),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: screenHeight * 0.03),
                child: Text(
                  'Please choose your gender',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: screenHeight * 0.03,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _toggleGenderSelection(true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMaleSelected == true
                            ? Color.fromARGB(255, 222, 251, 207)
                                .withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.all(screenWidth * 0.02),
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.07),
                            child: Text(
                              'Male',
                              style: TextStyle(
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF78B060),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.05),
                            child: Image.asset(
                              'assets/vectors/avatar_boy_male_man_people_icon.png',
                              width: screenWidth * 0.35,
                              height: screenHeight * 0.18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GestureDetector(
                    onTap: () => _toggleGenderSelection(false),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMaleSelected == false
                            ? Color.fromARGB(255, 253, 231, 191)
                                .withOpacity(0.3)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.all(screenWidth * 0.02),
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.06),
                            child: Text(
                              'Female',
                              style: TextStyle(
                                fontSize: screenHeight * 0.04,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFCD9026),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.05),
                            child: Image.asset(
                              'assets/vectors/avatar_female_girl_people_profile_icon.png',
                              width: screenWidth * 0.35,
                              height: screenHeight * 0.18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ));
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
                  elevation: MaterialStateProperty.all(3),
                  shadowColor: MaterialStateProperty.all(
                    const Color(0x1F000000),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: screenHeight * 0.045,
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
