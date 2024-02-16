import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:series_1/homepage.dart';
import 'package:series_1/uiHelper/ui_helper.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({super.key});

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  bool isOtpSent = false;
  String otpVerificationId = '';


  sendOtp(String number) async {
    if (number == "") {
      MotionToast.warning(
              title: Text("Number is Empty"),
              description: Text("Type valid Number"))
          .show(context);
    } else {
      FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException ex) {},
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              otpVerificationId = verificationId;
              isOtpSent =
                  true; // Set to true when sendOtp function completes execution
            });
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
          phoneNumber: number);
    }
  }



  checkOtp(String otpText) async {
    try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: otpVerificationId, smsCode: otpText);
      FirebaseAuth.instance.signInWithCredential(credential).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    } catch (ex) {
      MotionToast.info(
        title:  const Text(
          "Error login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        position: MotionToastPosition.center,
        description:  Text(ex.toString()),
      ).show(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image(
                  height: 200,
                  width: 200,
                  image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                ),
              ),

              SizedBox(
                height: 30,
              ),
              UiHelper.customTextField(
                  phoneController, "+91 Number", Icons.phone, false),


      Visibility(
                visible: isOtpSent,
                child: Row(
                  children: [
                    Expanded(
                      child: UiHelper.customTextField(
                          otpController, "OTP", Icons.numbers_rounded, false),
                    ),
                    Container(
                      width: 150,
                      child: ElevatedButton.icon(
                        // onPressed: checkOtp(otpController.text.toString()),
                        onPressed: (){
                          checkOtp(otpController.text.toString());

                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.orange.shade200), // Change color here
                        ),
                        icon: Icon(
                          Icons.check_circle,
                          size: 25,
                          color: Colors.black87,
                        ),
                        label: Text(
                          'Check',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // SizedBox(height: 20,),
              UiHelper.customButton(()  {
                sendOtp(phoneController.text.toString());
                // await sendOtp(otpController.text.toString());
              }, "Send OTP"),
            ],
          ),
        ),
      ),
    );
  }
}
