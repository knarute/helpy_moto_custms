import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Authentication/SignIn/Views/SignInForm.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Controller/SingUpController.dart';
import 'package:helpy_moto_custms/HomeScreen/Views/HomeScreen.dart';

class SignUpForm_old extends StatefulWidget {
  const SignUpForm_old({super.key});

  @override
  State<SignUpForm_old> createState() => _SignUpForm_oldState();
}

class _SignUpForm_oldState extends State<SignUpForm_old> {
  bool butttonenabled = false;
  bool isSignupinprogress = false;
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  final _formKey = GlobalKey<FormState>();
  final SingUpController sUController = Get.put(SingUpController());
  GetOtp({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSignupinprogress = !isSignupinprogress;
      });
      sUController.firstName = firstName;
      sUController.lastName = lastName;
      sUController.email = email;
      sUController.phoneNumber = phoneNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.size.height - 40,
                    child: Card(
                      child: Column(
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
                                    Get.offAll(const HomeScreen());
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green[400]),
                                  //icon: const Icon(Icons.skip_next_sharp),
                                  child: const Text(
                                    'Skip SignUp',
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
                              key: _formKey,
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
                                    'Create a new account',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Already have an account?'),
                                      TextButton(
                                        onPressed: () {
                                          Get.offAll(const SignInForm(),
                                              transition:
                                                  Transition.noTransition);
                                        },
                                        child: const Text(
                                          'Sign In',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 35, 224, 44)),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('First Name'),
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
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('Last Name'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {},
                                    onSaved: (newValue) {
                                      lastName = newValue!;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('Email*'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      final bool isValid =
                                          EmailValidator.validate(value!);
                                      if (isValid) {
                                        return null;
                                      }

                                      return 'Please Enter Valid Email';
                                    },
                                    onSaved: (newValue) {
                                      email = newValue!;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: const Text('Phone Number*'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    maxLength: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        butttonenabled = true;
                                      });
                                    },
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
                          ElevatedButton.icon(
                            onPressed: butttonenabled
                                ? () {
                                    GetOtp(
                                        firstName: firstName,
                                        lastName: lastName,
                                        email: email,
                                        phoneNumber: phoneNumber);
                                  }
                                : null,
                            icon: const Icon(
                              Icons.car_repair_outlined,
                              color: Colors.white,
                            ),
                            label: !isSignupinprogress
                                ? const Text(
                                    'Get OTP',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Sending OTP..   ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[400],
                              elevation: 10,
                              shadowColor: Colors.green,
                              minimumSize: Size(200, 50),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
