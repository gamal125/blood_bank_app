import 'package:blood_bank/flutter_flow/nav/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/cache_helper.dart';
import '../../components/components.dart';
import '../../cubit/MainCubit.dart';
import 'home_page_widget.dart';
import '../../register/cubit/cubit.dart';

class otp2Screen extends StatefulWidget {
   otp2Screen( {

     Key? key}) : super(key: key);



  @override
  State<otp2Screen> createState() => _otp2ScreenState();
}

class _otp2ScreenState extends State<otp2Screen> {
  var formKey = GlobalKey<FormState>();

final FirebaseAuth auth=FirebaseAuth.instance;

  var emailController = TextEditingController();

bool showloading=true;

  @override
  Widget build(BuildContext context) {
    var c=RegisterCubit.get(context);
    return  Scaffold(
      body: showloading? Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              defaultTextFormField(
                onTap: (){

                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefix: Icons.email,
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter code';
                  }
                  return null;
                },
                label: 'كود التفعيل',
                hint: 'Enter your code',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: ()async{
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "+2${c.phone}",
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {

                        // navigateTo(context,otpScreen( id: verificationId, name: widget.name.text, phone: widget.phone,));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  }, child: Text('اعادة ارسال الكود')),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: defaultMaterialButton(

                  function: () async{
                    if (formKey.currentState!.validate()) {
                      setState(() {
                 showloading=false;

                      });

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: c.id,
        smsCode: emailController.text);

    // Sign the user in (or link) with the credential
              await auth.signInWithCredential(credential);
                  if(auth.currentUser!=null){
                    RegisterCubit.get(context).createDonorUser(
                        uId:auth.currentUser!.uid ,
                        name: c.name,
                        phone:c.phone,
                        city: c.city,
                        blood: c.blood,
                        age: c.age);
                    CacheHelper.saveData(key: 'uId2', value:auth.currentUser!.uid);
                    MainCubit.get(context).getDonor();

                    context.pushNamed('home_patient_screen');
                  }
                    }
                  },
                  text: 'تاكيد',
                  radius: 20,
                ),
              ),
            ],
          ),
        ),
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
