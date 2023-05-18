import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Provider/Auth.dart';
import '../../Provider/driver_list.dart';

class FormWidget extends StatelessWidget {
  FormWidget({
    Key? key,
    required this.type,
    required this.formKey,
  }) : super(key: key);
  final String type;
  final formKey;
  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<AuthProvider>(context);
    final DriverProviders = Provider.of<DriverProvider>(context);
    return Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 42),
              child: TextFormField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: HexColor('#2A2A2A1A'),
                    label: Center(
                        child: Text(
                      type == '!Login' ? 'Enter User Username' : "Enter Name",
                      style: TextStyle(color: HexColor('#707070')),
                    ))),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter username!';
                  }
                  return null;
                },
                onChanged: (value) => type == 'Login'
                    ? formData.setName(value)
                    : DriverProviders.driverName(value),
                onSaved: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextFormField(
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: HexColor('#2A2A2A1A'),
                    label: Center(
                        child: Text(
                      type == 'Login'
                          ? 'Enter User Password'
                          : "Enter License Number",
                      style: TextStyle(color: HexColor('#707070')),
                    ))),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Password !';
                  }
                  return null;
                },
                onChanged: (value) => type == 'Login'
                    ? formData.setPassword(value)
                    : DriverProviders.LicenceN(value),
                onSaved: (value) {},
              ),
            ),
            type == 'addDriver'
                ? Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: HexColor('#2A2A2A1A'),
                          label: Center(
                              child: Text(
                            "Mobile Number",
                            style: TextStyle(color: HexColor('#707070')),
                          ))),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Mobile';
                        }
                        return null;
                      },
                      onChanged: (value) => DriverProviders.mobileN(value),
                      onSaved: (value) {},
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}
