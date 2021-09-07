import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../userModel.dart';

Future<UserModel> createUser(String usn, String password) async {
  // TODO: CHANGE URL IN PRODUCTION
  final String loginAPIurl = "http://localhost:8090/login";
  
  final loginResponse = await http.post(Uri.parse(loginAPIurl),body:{
    "usn":usn,
    "password": password
  });

  if(loginResponse.statusCode == 202){
    final String loginResponseString = loginResponse.body;
    return userModelFromJson(loginResponseString);
  }else{
    return null;
  }
}

class AuthenticationPage extends StatelessWidget {

  final TextEditingController usnController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var loginFailed = "f".obs;

  //const AuthenticationPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome.",
                    color: lightGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller:usnController,
                decoration: InputDecoration(
                    labelText: "Usn",
                    hintText: "4SF18CS001",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              Obx (() => TextField(
                controller:passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Abc123@",
                    errorText: loginStatus()?null:"Invalid USN or Password!",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              )),
               SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      CustomText(text: "Remeber Me",),
                    ],
                  ),

                  CustomText(
                    text: "Forgot password?",
                    color: active
                  )
                ],
              ),
                SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  final String usn = usnController.text;
                  final String password = passwordController.text;

                  final UserModel user = await createUser(usn, password);
                  if(user != null){
                    Get.offAllNamed(rootRoute);
                  }else{
                    loginFailed.value = "t";
                  }
                },
                child: Container(
                  decoration: BoxDecoration(color: active, 
                  borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: Colors.white,
                  ),
                ),
              ),

               SizedBox(
                height: 15,
              ),

              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Do not have admin credentials? "),
                  TextSpan(text: "Request Credentials! ", style: TextStyle(color: active))
                ]
              ))

            ],
          ),
        ),
      ),
    );
  }
  bool loginStatus(){
  if(loginFailed!="f"){
    return false;
  }
  else{
    return true;
  }
  }
}
