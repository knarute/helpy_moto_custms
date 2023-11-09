import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Authentication/SignIn/Controller/SingInController.dart';
import 'package:helpy_moto_custms/Authentication/SignIn/Views/SignInVerifyOTP.dart';
//import 'package:helpy_moto_custms/Authentication/SignIn/Views/SignInForm.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Controller/SingUpController.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Views/SignUpForm.dart';
import 'package:helpy_moto_custms/HomeScreen/Views/HomeScreen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool butttonenabled = false;
  bool isSignininprogress = false;
  //String firstName = '';
  String phoneNumber = '';
  final _SignInformKey = GlobalKey<FormState>();
  final SingInController sInController = Get.put(SingInController());
  GetOtp({
    required String phoneNumber,
  }) {
    if (_SignInformKey.currentState!.validate()) {
      setState(() {});

      sInController.phoneNumber = phoneNumber;
      Get.to(const SignInVerifyOTP(), transition: Transition.noTransition);
    }
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.offAll(const HomeScreen(),
                                  duration: const Duration(seconds: 1),
                                  transition: Transition.zoom);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                side: BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder()),
                            //icon: const Icon(Icons.skip_next_sharp),
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                  /* decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  decorationStyle: TextDecorationStyle.solid,*/
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _SignInformKey,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/main-logo.png',
                              width: 80,
                              color: Colors.green[300],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Login to your account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Don\'t  have an account?',
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
                                    'Sign Up',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 35, 224, 44)),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // const Text('Enter your Registered Mobile Number'),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 15, height: 1),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                filled: true,
                                prefixIcon: const Icon(Icons.phone),
                                hintText: 'Phone No.',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              /* onChanged: (value) {
                                if (value.trim().length >= 10) {
                                  setState(() {
                                    butttonenabled = true;
                                  });
                                }
                                if (value.isEmpty || value.trim().length < 10) {
                                  setState(() {
                                    butttonenabled = false;
                                  });
                                }
                              },*/
                              validator: (value) {
                                if (value!.length < 10) {
                                  return 'Please Enter Valid Mobile Number';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                phoneNumber = newValue!;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        GetOtp(phoneNumber: phoneNumber);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        shadowColor: Colors.green,
                        minimumSize: Size(200, 50),
                      ),
                      child: const Text(
                        'Get OTP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    /*    const Divider(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Use Email',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 35, 224, 44)),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),*/
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
