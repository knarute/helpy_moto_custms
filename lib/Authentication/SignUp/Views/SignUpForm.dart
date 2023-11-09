import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Authentication/SignIn/Views/SignInForm.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Controller/SingUpController.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Views/SignUpVerifyOTP.dart';
import 'package:helpy_moto_custms/HomeScreen/Views/HomeScreen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool butttonenabled = false;
  String firstName = '';
  String phoneNumber = '';
  final _SIgnUpformKey = GlobalKey<FormState>();
  final SingUpController sUController = Get.put(SingUpController());
  GetOtp({
    required String firstName,
    required String phoneNumber,
  }) {
    if (_SIgnUpformKey.currentState!.validate()) {
      setState(() {});
      sUController.firstName = firstName;
      sUController.phoneNumber = phoneNumber;
      Get.to(const SignUpVerifyOTP(), transition: Transition.noTransition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
                        key: _SIgnUpformKey,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/main-logo.png',
                              width: 80,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Sign Up for an Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.offAll(const SignInForm(),
                                        transition: Transition.noTransition);
                                  },
                                  child: const Text(
                                    'Sign In',
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
                            TextFormField(
                              style: const TextStyle(fontSize: 15, height: 1),
                              decoration: InputDecoration(
                                filled: true,
                                hintText: 'Name',
                                // label: const Text('Your Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {},
                              onSaved: (newValue) {
                                firstName = newValue!;
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 15, height: 1),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                filled: true,
                                //prefix: const Text('+91 '),
                                prefixIcon: Icon(Icons.phone),
                                hintText: 'Phone No.',
                                // label: const Text('Phone Number*'),
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
                        GetOtp(firstName: firstName, phoneNumber: phoneNumber);
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
