import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widget_logo_box.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
//import 'package:pinput/pinput.dart';
//import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'constants.dart';

class scr00_phone_authentification extends StatefulWidget {
  const scr00_phone_authentification({super.key});

  // final String title;

  @override
  State<scr00_phone_authentification> createState() =>
      _scr00_phone_authentificationState();
}

class _scr00_phone_authentificationState
    extends State<scr00_phone_authentification> {
  String _newPhone = "";
  // String _new_email = "";
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    // const pinBorderColor = Colors.red;
    // const pinErrorColor = Color.fromRGBO(255, 234, 238, 1);
    // const pinFillColor = Color.fromRGBO(222, 231, 240, .57);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        //backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          /*     actions: [
            TextButton(
              onPressed: () {
                print('Back button pressed');
                Navigator.pushNamed(context, '/t01s02_verify_SMS_screen');
              },
              child: Text(
                'Back',
                style: GoogleFonts.arimo(
                  fontSize: 16.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
         ],*/
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  logoBox(context),
                  SizedBox(
                    height: deviceHeight * 0.1,
                  ),
                  const Text(
                    'Please pick your country code and enter phone number',
                    textAlign: TextAlign.center,
                    //'fff',
                    style: header1,
                  ),
                  SizedBox(
                    height: deviceHeight * .02,
                  ),
                  Form(
                    key: _formKey,
                    child: IntlPhoneField(
                      //inputFormatters: [LengthLimitingTextInputFormatter(4)],
                      dropdownTextStyle: TextStyle(fontSize: 20),
                      // remove it
                      initialValue: '1234567890',
                      //remove it
                      decoration: InputDecoration(
                        labelText: '', //'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      style: TextStyle(fontSize: 25, letterSpacing: 1.5),
                      invalidNumberMessage: '',
                      pickerDialogStyle: PickerDialogStyle(
                        searchFieldInputDecoration:
                            //InputDecoration(labelText: 'Country / Χώρα'),
                            InputDecoration(labelText: 'Country'),
                      ),
                      initialCountryCode: 'GR',
                      //searchText: 'gimme land',
                      onChanged: (phone) {
                        // print(phone.completeNumber);
                        _newPhone = phone.completeNumber;
                      },
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  TextButton(
                      onPressed: () {
                        final bool a = _formKey.currentState!.validate();
                        if (a) {
                          //                      print('valid');
                          Navigator.pushNamed(context, '/home_screen');

                          //final snackBar = SnackBar(
                          //    content: Text('phone number is $_newPhone'));
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                              content:
                                  Text('Please, enter valid phone number'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          //  print('invalid');
                        }
                        ;
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
