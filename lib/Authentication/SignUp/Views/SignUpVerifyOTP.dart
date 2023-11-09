import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Views/SignUpForm.dart';
import 'package:helpy_moto_custms/HomeScreen/Views/HomeScreen.dart';

class SignUpVerifyOTP extends StatefulWidget {
  const SignUpVerifyOTP({super.key});

  @override
  State<SignUpVerifyOTP> createState() => _SignUpVerifyOTPState();
}

class _SignUpVerifyOTPState extends State<SignUpVerifyOTP> {
  bool butttonenabled = false;

  final _SignUpVerify = GlobalKey<FormState>();
  OtpTimerButtonController OTPcontroller = OtpTimerButtonController();

  verifyOtp() {
    if (_SignUpVerify.currentState!.validate()) {
      setState(() {});
      ;
    }
    Get.offAll(const HomeScreen(),
        duration: const Duration(seconds: 1), transition: Transition.zoom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _SignUpVerify,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 90,
                            ),
                            Image.asset(
                              'assets/images/main-logo.png',
                              width: 80,
                              color: Colors.green[300],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Verify Your Mobile',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Enter OTP reiceived on :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '+91 7045652365',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Wrong Number Entered?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(const SignUpForm(),
                                        transition: Transition.noTransition);
                                  },
                                  child: const Text(
                                    'Edit Number',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 35, 224, 44)),
                                  ),
                                )
                              ],
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 15, height: 1),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'OTP',
                                // label: const Text('Your Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              maxLength: 6,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'OTP should be 6 digit';
                                }
                                return null;
                              },
                              onSaved: (newValue) {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Didn\'t received OTP?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                OtpTimerButton(
                                  controller: OTPcontroller,
                                  buttonType: ButtonType.text_button,
                                  onPressed: () {
                                    OTPcontroller.startTimer();
                                  },
                                  text: const Text(
                                    'Resend',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 35, 224, 44)),
                                  ),
                                  duration: 60,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        verifyOtp();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        //side: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(),
                        //elevation: 10,
                        //shadowColor: Colors.green,
                        minimumSize: const Size(200, 50),
                      ),
                      child: const Text(
                        'Verify OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
