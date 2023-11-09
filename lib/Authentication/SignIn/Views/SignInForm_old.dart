import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpy_moto_custms/Authentication/SignIn/Controller/SingInController.dart';
import 'package:helpy_moto_custms/Authentication/SignUp/Views/SignUpForm.dart';
import 'package:helpy_moto_custms/HomeScreen/Views/HomeScreen.dart';

class SignInFormOld extends StatefulWidget {
  const SignInFormOld({super.key});

  @override
  State<SignInFormOld> createState() => _SignInFormOldState();
}

class _SignInFormOldState extends State<SignInFormOld> {
  bool isSignIninprogress = false;
  bool butttonenabled = false;
  final SingInController sInController = Get.put(SingInController());
  GetOtp({
    required String phoneNumber,
  }) {
    setState(() {
      isSignIninprogress = !isSignIninprogress;
    });

    sInController.phoneNumber = phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      //  appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.size.height - 40,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          //  const SizedBox(height: 50),
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
                                    'Skip SignIn',
                                    style: TextStyle(
                                        /*decoration: TextDecoration.underline,
                                        decorationThickness: 2,
                                        decorationStyle:
                                            TextDecorationStyle.solid,*/
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 100),
                          const CircleAvatar(
                            backgroundColor: Color.fromARGB(156, 83, 156, 85),
                            radius: 50,
                          ),
                          const Text(
                            'Login to your account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              TextButton(
                                  onPressed: () {
                                    Get.offAll(const SignUpForm(),
                                        transition: Transition.noTransition);
                                  },
                                  child: const Text('Sign Up',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 35, 224, 44))))
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text('Enter your Registered Mobile Number'),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            onChanged: (value) {
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
                            },
                            maxLength: 10,
                            inputFormatters: [],
                            decoration: InputDecoration(
                              label: const Text('Phone Number*'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: butttonenabled ? () {} : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400],
                                elevation: 10,
                                shadowColor: Colors.green,
                                minimumSize: const Size(200, 50)),
                            child: !isSignIninprogress
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
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
