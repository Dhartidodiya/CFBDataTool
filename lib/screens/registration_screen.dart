import 'package:cfddatatool/screens/login_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String name;
  late String email;
  late String password;
  late String number;
  late String nation;
  late String address;
  final List<String> gender = [
    'Female',
    'Male',
    'Other',
  ];
  String? gendervalue;
  String? regionvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/main_background_image.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 700,
                      width: 310,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          SvgPicture.asset(
                            "assets/icon/logo_black.svg",
                            height: 60,
                            width: 60,
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(215, 7, 25, 191),
                                BlendMode.srcIn),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Registration',
                            style: TextStyle(
                                color: Color.fromARGB(215, 7, 25, 191),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Form(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter FullName';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      label: Text('Full name')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 10) {
                                      return 'Please Enter Valid PhoneNumber';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      number = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      label: Text('Mobile number')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (!EmailValidator.validate(value!)) {
                                      return 'Please Enter ValidEmail';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                      label: Text('Email address')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty || value.length < 6) {
                                      return 'Please Enter Valid Password';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
                                    });
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      label: Text('Password')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value != number) {
                                      return 'Please Enter Valid Password';
                                    }
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      label: Text('Confirm password')),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Gender',
                                  ),
                                  isExpanded: true,
                                  items: [
                                    'Female',
                                    'Male',
                                    'Other',
                                  ]
                                      .map((label) => DropdownMenuItem(
                                            child: Text(
                                              label,
                                            ),
                                            value: label,
                                          ))
                                      .toList(),
                                  validator: (value) => value?.isEmpty ?? true
                                      ? 'Select Gender'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => gendervalue = value);
                                  },
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter NationalId';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      nation = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      label: Text('National ID')),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Address';
                                    }
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      address = value;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      label: Text('Address')),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'Region',
                                  ),
                                  isExpanded: true,
                                  items: [
                                    'Region1',
                                    'Region2',
                                    'Region3',
                                  ]
                                      .map((label) => DropdownMenuItem(
                                            child: Text(
                                              label,
                                            ),
                                            value: label,
                                          ))
                                      .toList(),
                                  validator: (value) => value?.isEmpty ?? true
                                      ? 'Select Region'
                                      : null,
                                  onChanged: (value) {
                                    setState(() => regionvalue = value);
                                  },
                                ),
                              ],
                            )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(215, 7, 25, 191),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: 'Already have an account?',
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                TextSpan(
                                    text: ' Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                    style: const TextStyle(
                                      color: Color.fromARGB(215, 7, 25, 191),
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]))
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
