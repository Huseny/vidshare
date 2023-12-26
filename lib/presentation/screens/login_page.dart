import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vid_share/route_config/route_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  Country seletedCountry = Country(
    name: "Ethiopia",
    phoneCode: '251',
    countryCode: 'ETH',
    e164Sc: 1,
    geographic: true,
    level: 1,
    example: 'ET +251 91 234 5678',
    displayName: 'Ethiopia',
    displayNameNoCountryCode: 'ETH',
    e164Key: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset(
                    "assets/logo.svg",
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Login with Phone Number",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your phone number to receive verification code",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    hintText: "Enter your phone number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      width: 80,
                      child: InkWell(
                        child: Text(
                          '${seletedCountry.flagEmoji} +${seletedCountry.phoneCode}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            countryListTheme: CountryListThemeData(
                                bottomSheetHeight:
                                    MediaQuery.of(context).size.height * .6),
                            onSelect: (Country country) {
                              setState(() {
                                seletedCountry = country;
                              });
                            },
                          );
                        },
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(RouteConstants.VERIFYOTP,
                            pathParameters: {
                              "verificationId": "verificationId"
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ))),
    );
  }
}
