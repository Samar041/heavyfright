import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String otpCode = '';
  int _seconds = 90;
  Timer? _timer;

  void startTimer() {
    _seconds = 90;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resendOtp() {
    print("Resending OTP...");
    startTimer();
  }

  void verifyOtp() {
    if (otpCode == '1234') {
      Navigator.pushNamed(context, '/form');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
     
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
            ),
          ),

     
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

        
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'assets/image.png',
                height: 420,
              ),
            ),
          ),

          
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check, color:const Color.fromARGB(255, 255, 102, 0), size: 30),
                  SizedBox(height: 16),
                  Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Please write the OTP code that we send to your registered Email to complete your verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) => otpCode = value,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      activeColor: const Color.fromARGB(255, 255, 102, 0),
                      selectedColor: const Color.fromARGB(255, 255, 102, 0),
                      inactiveColor: const Color.fromARGB(255, 255, 102, 0),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: "Remaining Time : ",
                      style: TextStyle( color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16 , fontWeight: FontWeight.bold, ) ,
                      children: [
                        TextSpan(
                          text: formatTime(_seconds),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: verifyOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 102, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size.fromHeight(50),
                    ),
                    child: Text("Verify",  style: TextStyle(color: const Color.fromARGB(255, 250, 248, 248), fontSize: 16),),
                  ),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: "Didn't receive a code ? ",
                      style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold,), 
                      
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: resendOtp,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 102, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
