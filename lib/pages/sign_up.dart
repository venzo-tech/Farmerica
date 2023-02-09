import 'package:farmerica/model/customer.dart';
import 'package:farmerica/service/api_service.dart';
import 'package:farmerica/utils/ProgressHUD.dart';
import 'package:farmerica/utils/form_helper.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  APIService? apiService;
  CustomerModel? model;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    apiService = APIService();
    model = CustomerModel(email: '', mobileNumber: '', password: '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: true,
        title: const Text('Farmerica'),
      ),
      body: ProgressHUD(
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: globalKey,
        child: Form(
          key: globalKey,
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI(){
    return SingleChildScrollView(
      child: Container(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(children: [
            FormHelper.fieldLabel('Email'),
            FormHelper.textInput(context, onChanged, model.email)
          ],),
        ),
      ),
    );
  }

  // Widget formUI() {
  //   return SingleChildScrollView(
  //     child: Form(
  //       key: globalKey,
  //       child: loginUI(context),
  //     ),
  //   );
  // }
  //
  // Widget loginUI(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Container(
  //           width: MediaQuery.of(context).size.width,
  //           height: MediaQuery.of(context).size.height / 3.5,
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: Alignment.topCenter,
  //               end: Alignment.bottomCenter,
  //               colors: [HexColor("#3f517e"), HexColor("#182545")],
  //             ),
  //             borderRadius: const BorderRadius.only(
  //               // topLeft: Radius.circular(500),
  //               //topRight: Radius.circular(150),
  //               bottomRight: Radius.circular(150),
  //               //bottomLeft: Radius.circular(150),
  //             ),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               const Spacer(),
  //               Align(
  //                 alignment: Alignment.center,
  //                 child: Image.network(
  //                   "https://avatars.githubusercontent.com/u/64971583?s=460&u=ccc349dd8eaafbfa73533c3316d7d729ec223e9b&v=4",
  //                   fit: BoxFit.contain,
  //                   width: 140,
  //                 ),
  //               ),
  //               const Spacer(),
  //             ],
  //           ),
  //         ),
  //         const Center(
  //           child: Padding(
  //             padding: EdgeInsets.only(bottom: 20, top: 40),
  //             child: Text(
  //               "User Signup",
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //             ),
  //           ),
  //         ),
  //         // FormHelper.inputFieldWidget(
  //         //   context,
  //         //   // Icon(Icons.verified_user),
  //         //   "email",
  //         //   "email",
  //         //   (onValidateVal) {
  //         //     if (onValidateVal.isEmpty) {
  //         //       return 'Username can\'t be empty.';
  //         //     }
  //         //
  //         //     return null;
  //         //   },
  //         //   (onSavedVal) => {
  //         //     model!.email = onSavedVal.toString().trim(),
  //         //   },
  //         //   initialValue: "",
  //         //   paddingBottom: 20,
  //         //   onChange: (val) {},
  //         // ),
  //         FormHelper.inputFieldWidget(
  //           context,
  //           // Icon(Icons.email),
  //           "email",
  //           "E-mail",
  //           (onValidateVal) {
  //             if (onValidateVal.isEmpty) {
  //               return 'Email can\'t be empty.';
  //             }
  //
  //             bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(onValidateVal);
  //
  //             if (!emailValid) {
  //               return 'Email Invalid!';
  //             }
  //
  //             return null;
  //           },
  //           (onSavedVal) => {
  //             model!.email = onSavedVal.toString().trim(),
  //           },
  //           initialValue: "",
  //           paddingBottom: 20,
  //         ),
  //         FormHelper.inputFieldWidget(
  //           context,
  //           // Icon(Icons.lock),
  //           "password",
  //           "Password",
  //           (onValidateVal) {
  //             if (onValidateVal.isEmpty) {
  //               return 'Password can\'t be empty.';
  //             }
  //
  //             return null;
  //           },
  //           (onSavedVal) => {
  //             model!.password = onSavedVal.toString().trim(),
  //           },
  //           initialValue: "",
  //           obscureText: hidePassword,
  //           suffixIcon: IconButton(
  //             onPressed: () {
  //               setState(() {
  //                 hidePassword = !hidePassword;
  //               });
  //             },
  //             color: Colors.redAccent.withOpacity(0.4),
  //             icon: Icon(
  //               hidePassword ? Icons.visibility_off : Icons.visibility,
  //             ),
  //           ),
  //           paddingBottom: 20,
  //           onChange: (val) {
  //             model!.password = val;
  //           },
  //         ),
  //         // Padding(
  //         //   padding: EdgeInsets.only(bottom: 20),
  //         //   child: FormHelper.inputFieldWidget(
  //         //     context,
  //         //     // Icon(Icons.lock),
  //         //     "confirmpassword",
  //         //     "Confirm Password",
  //         //     (onValidateVal) {
  //         //       if (onValidateVal.isEmpty) {
  //         //         return 'Confirm Password can\'t be empty.';
  //         //       }
  //         //
  //         //       if (model!.password != onValidateVal) {
  //         //         return 'Password Mismatched!';
  //         //       }
  //         //
  //         //       return null;
  //         //     },
  //         //     (onSavedVal) => {
  //         //       // model.confirmPassword = onSavedVal.toString().trim(),
  //         //     },
  //         //     initialValue: "",
  //         //     obscureText: hideConfirmPassword,
  //         //     suffixIcon: IconButton(
  //         //       onPressed: () {
  //         //         setState(() {
  //         //           hideConfirmPassword = !hideConfirmPassword;
  //         //         });
  //         //       },
  //         //       color: Colors.redAccent.withOpacity(0.4),
  //         //       icon: Icon(
  //         //         hideConfirmPassword ? Icons.visibility_off : Icons.visibility,
  //         //       ),
  //         //     ),
  //         //     onChange: (val) {
  //         //       this.userModel.confirmPassword = val;
  //         //     },
  //         //   ),
  //         // ),
  //
  //         const SizedBox(
  //           height: 20,
  //         ),
  //
  //         Center(
  //           child: FormHelper.submitButton(
  //             "Register",
  //             () {
  //               if (validateAndSave()) {
  //                 setState(() {
  //                   this.isApiCallProcess = true;
  //                 });
  //
  //                 APIService.createCustomer(model!).then((UserResponseModel response) {
  //                   setState(() {
  //                     this.isApiCallProcess = false;
  //                   });
  //                   if (response.code == 200) {
  //                     FormHelper.showSimpleAlertDialog(
  //                       context,
  //                       "Wordpress Register",
  //                       response.message,
  //                       "Ok",
  //                       () {
  //                         Navigator.of(context).pop();
  //                       },
  //                     );
  //                   } else {
  //                     FormHelper.showSimpleAlertDialog(
  //                       context,
  //                       "Wordpress Register",
  //                       response.message,
  //                       "Ok",
  //                       () {
  //                         Navigator.of(context).pop();
  //                       },
  //                     );
  //                   }
  //                 });
  //               }
  //             },
  //           ),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // bool validateAndSave() {
  //   final form = globalKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }
}
