import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../Provider/auth_user.dart';
import 'common/form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formData = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(30),
          child: InkWell(
            onTap: () async {
              if (_formKey.currentState!.validate() == true) {
                await formData.userlogin(context);
                if (formData.isLoggedIn == true) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                }
              }
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: HexColor('#FC153B'),
                  borderRadius: const BorderRadius.all(Radius.circular(7))),
              child: const Center(
                  child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        body: Column(children: [
          Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3.23,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/img/Polygonl.png')),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome',
                        style: TextStyle(
                            fontFamily: "Axiforma",
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Manage your Bus and Drivers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          FormWidget(type: "Login", formKey: _formKey),
          Consumer<AuthProvider>(builder: (context, loadingProvider, child) {
            return loadingProvider.isLoading
                ? Container(
                    height: 100,
                    width: 100,
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink();
          })
        ]),
      ),
    );
  }
}
