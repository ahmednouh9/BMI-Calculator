import 'package:bmi_1_app/rusalt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  double _weight = 0.0;
  int _age = 0;
  double _height = 0.0;
  final double _minHeight = 140.0;
  final double _maxHeight = 200.0;
  bool _isIncrementing = false;
  bool _isDecrementing = false;

  void _startIncrementing(VoidCallback onIncrement) {
    _isIncrementing = true;
    _incrementOrDecrement(onIncrement, 20);
  }

  void _startDecrementing(VoidCallback onDecrement) {
    _isDecrementing = true;
    _incrementOrDecrement(onDecrement, 20);
  }

  void _incrementOrDecrement(VoidCallback callback, int delay) async {
    int currentDelay = delay;
    while (_isIncrementing || _isDecrementing) {
      setState(callback);
      await Future.delayed(Duration(milliseconds: currentDelay));
      currentDelay = (currentDelay * 0.9).toInt();
      if (currentDelay < 10) currentDelay = 10;
    }
  }

  void _stopIncrementing() {
    _isIncrementing = false;
  }

  void _stopDecrementing() {
    _isDecrementing = false;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(width * 0.04),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              _buildTitle(),
              SizedBox(height: height * 0.02),
              _buildWeightAndAgeInputs(width, height),
              SizedBox(height: height * 0.03),
              _buildHeightInput(width),
              SizedBox(height: height * 0.05),
              _buildCalculateButton(width, height),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    final double height = MediaQuery.of(context).size.height;
    return AppBar(
      toolbarHeight: 50,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
        child: Text(
          'BMI Calculator',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: height * 0.04,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.2,
            height: 1,
            color: Color(0xFF78B060),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF78B060),
      ),
    );
  }

  Widget _buildTitle() {
    final double height = MediaQuery.of(context).size.height;
    return Center(
      child: Text(
        'Please Modify the values',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          fontSize: height * 0.03,
          height: 1,
          color: Color(0xFF0A1207),
        ),
      ),
    );
  }

  Widget _buildWeightAndAgeInputs(double width, double height) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(width * 0.03, height * 0.015, 0, height * 0.015),
      child: Row(
        children: [
          Expanded(
            child: _buildInputContainer(
              width: width,
              label: 'Weight (kg)',
              value: _weight.toStringAsFixed(1),
              onDecrement: () {
                setState(() {
                  if (_weight > 0) _weight -= 0.1;
                });
              },
              onIncrement: () {
                setState(() {
                  _weight += 0.1;
                });
              },
              onLongPressDecrement: () {
                _startDecrementing(() {
                  if (_weight > 0) _weight -= 0.1;
                });
              },
              onLongPressIncrement: () {
                _startIncrementing(() {
                  _weight += 0.1;
                });
              },
              onLongPressEnd: () {
                _stopIncrementing();
                _stopDecrementing();
              },
              iconPathMinus: 'assets/vectors/211863_minus_round_icon.svg',
              iconPathPlus: 'assets/vectors/211877_plus_round_icon.svg',
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: _buildInputContainer(
              width: width,
              label: 'Age',
              value: _age.toString(),
              onDecrement: () {
                setState(() {
                  if (_age > 0) _age--;
                });
              },
              onIncrement: () {
                setState(() {
                  _age++;
                });
              },
              onLongPressDecrement: () {
                _startDecrementing(() {
                  if (_age > 0) _age--;
                });
              },
              onLongPressIncrement: () {
                _startIncrementing(() {
                  _age++;
                });
              },
              onLongPressEnd: () {
                _stopIncrementing();
                _stopDecrementing();
              },
              iconPathMinus: 'assets/vectors/211863_minus_round_icon.svg',
              iconPathPlus: 'assets/vectors/211877_plus_round_icon.svg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeightInput(double width) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFFBF6EE),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Height (cm)',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFFACACAC),
            ),
          ),
          SizedBox(height: width * 0.04),
          Text(
            _height.toStringAsFixed(1),
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: width * 0.12,
              color: const Color(0xFFCE922A),
            ),
          ),
          SizedBox(height: width * 0.04),
          _buildHeightSlider(width),
          Center(
            child: SvgPicture.asset('assets/vectors/polygon_1_x2.svg'),
          ),
        ],
      ),
    );
  }

  Widget _buildHeightSlider(double width) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          double newHeight = _height +
              (details.primaryDelta! / width) * (_maxHeight - _minHeight);
          _height = newHeight.clamp(_minHeight, _maxHeight);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: width * 0.2,
            width: double.infinity,
            child: RulerWidget(
              minHeight: _minHeight,
              maxHeight: _maxHeight,
              currentHeight: _height,
            ),
          ),
          Positioned(
            child: Container(
              width: 2,
              height: width * 0.12,
              color: const Color(0xFFCE922A),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton(double width, double height) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: height * 0.10,
        width: width * 0.9,
        child: ElevatedButton(
          onPressed: () {
            double bmi = _calculateBMI();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultPage(
                  bmi: bmi,
                  height: _height,
                  age: _age,
                  weight: _weight,
                ),
              ),
            );
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
            padding: EdgeInsets.all(height * 0.02),
            child: Center(
              child: Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  fontSize: height * 0.045,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateBMI() {
    return _weight / ((_height / 100) * (_height / 100));
  }

  Widget _buildInputContainer({
    required double width,
    required String label,
    required String value,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
    required VoidCallback onLongPressDecrement,
    required VoidCallback onLongPressIncrement,
    required VoidCallback onLongPressEnd,
    required String iconPathMinus,
    required String iconPathPlus,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: width * 0.05),
      decoration: BoxDecoration(
        color: const Color(0xFFFBF6EE),
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFFACACAC),
            ),
          ),
          SizedBox(height: width * 0.04),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: width * 0.12,
              color: const Color(0xFFCE922A),
            ),
          ),
          SizedBox(height: width * 0.04),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: onDecrement,
                onLongPress: onLongPressDecrement,
                onLongPressEnd: (_) => onLongPressEnd(),
                child: SvgPicture.asset(
                  iconPathMinus,
                  height: width * 0.08,
                  width: width * 0.08,
                ),
              ),
              GestureDetector(
                onTap: onIncrement,
                onLongPress: onLongPressIncrement,
                onLongPressEnd: (_) => onLongPressEnd(),
                child: SvgPicture.asset(
                  iconPathPlus,
                  height: width * 0.08,
                  width: width * 0.08,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final double minHeight;
  final double maxHeight;
  final double currentHeight;

  RulerPainter({
    required this.minHeight,
    required this.maxHeight,
    required this.currentHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFACACAC)
      ..strokeWidth = 2;

    double totalHeight = maxHeight - minHeight;
    double pixelsPerUnit = size.width / totalHeight;

    for (double i = minHeight; i <= maxHeight; i++) {
      double x = (i - minHeight) * pixelsPerUnit;
      double lineLength = (i % 10 == 0) ? 20 : 10;

      canvas.drawLine(
        Offset(x, size.height / 2 - lineLength / 2),
        Offset(x, size.height / 2 + lineLength / 2),
        paint,
      );
    }

    paint.color = const Color(0xFFCE922A);
    double markerX = (currentHeight - minHeight) * pixelsPerUnit;
    canvas.drawLine(
      Offset(markerX, size.height / 2 - 30),
      Offset(markerX, size.height / 2 + 30),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RulerWidget extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final double currentHeight;

  RulerWidget({
    required this.minHeight,
    required this.maxHeight,
    required this.currentHeight,
  });

  @override
  Widget build(BuildContext context) {
    final safeAreaPadding = MediaQuery.of(context).padding;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.symmetric(
            horizontal: safeAreaPadding.left + safeAreaPadding.right),
        child: CustomPaint(
          size: Size(screenWidth, 200),
          painter: RulerPainter(
            minHeight: minHeight,
            maxHeight: maxHeight,
            currentHeight: currentHeight,
          ),
        ),
      ),
    );
  }
}
