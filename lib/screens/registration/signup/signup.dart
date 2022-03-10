import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:student_id/all_export.dart';
import 'package:student_id/components/alert_dialog_c.dart';
import 'package:student_id/components/components_c.dart';
import 'package:student_id/core/backend.dart';
import 'package:student_id/core/config/app_config.dart';
import 'package:student_id/models/sign_up_m.dart';
import 'package:student_id/provider/api_provider.dart';
import 'package:student_id/screens/registration/login/login_page_body.dart';
import 'package:student_id/screens/registration/signup/body_signup.dart';
import 'package:student_id/screens/registration/verfiyAcc/verifyAcc.dart';
import 'package:student_id/services/storage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  SignUpModel _signUpModel = SignUpModel();
  bool? isChecked = false;
  
  final formKey = GlobalKey<FormState>();

  void handleRememberMe(bool? value) async {
    setState(() {
      isChecked = value;
    });
  }

  void validator() {
    final form = formKey.currentState!;

    if (form.validate()) {
      Navigator.pushReplacementNamed(context, verifyRoute);
    }
  }

  Future<void> submitSignUp() async {

    MyDialog().dialogLoading(context);
    try {

      await Provider.of<ApiProvider>(context, listen: false).registerSELNetwork(email: "condaveat@gmail.com", password: "12345").then((value) async {
        
        // Close Dialog
        Navigator.pop(context);
        
        if (value == true){
          await MyDialog().customDialog(context, "Message", "Successfully register");
          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyPage()));
        } else {
          await MyDialog().customDialog(context, "Oops", "Account already registered");

        }
      });
      // await Backend().register(_signUpModel).then((value) async {
      //   print("value ${value.body} ");
      //   dynamic decode = json.decode(value.body);
      //   Navigator.pop(context);
      //   if (value.statusCode == 200){
      //     await MyDialog().customDialog(context, "Message", "${decode['message']}");
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyAcc(signUpModel: _signUpModel)));
      //   } else {
      //     await MyDialog().customDialog(context, "Oops", "${decode['message']}");

      //   }

      // });

    } catch (e) {
      print("Error submitSignUp $e");
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    _signUpModel.userNameController.text = "Daveat";
    _signUpModel.emailInputController.text = "dibit51207@toudrum.com";
    _signUpModel.passwordInputController.text = "123456";
    _signUpModel.conPasController.text = "123456";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignUpPageBody(
      signUpModel: _signUpModel,
      handleRememberMe: handleRememberMe,
      isChecked: isChecked,
      formKey: formKey,
      validator: validator,
      submitSignUp: submitSignUp
    );
  }
}
