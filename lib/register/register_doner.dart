import 'package:blood_bank/cubit/MainCubit.dart';
import 'package:blood_bank/register/cubit/cubit.dart';
import 'package:blood_bank/register/register_donor_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/components.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';


class RegisterDonorWidget extends StatefulWidget {
  const RegisterDonorWidget({Key? key}) : super(key: key);

  @override
  _RegisterDonorWidgetState createState() => _RegisterDonorWidgetState();
}

class _RegisterDonorWidgetState extends State<RegisterDonorWidget> {
  late RegisterDonorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool showloading=true;
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterDonorModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFE91D21),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Color(0xFFE91D21),
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            fillColor: Color(0xFFE91D21),
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(-0.25, 0.0),
            child: Text(
              'تسجيل البيانات',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 20.0),
                      child: Text(
                        'الاسم',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController1,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                          hintText: 'من فضلك ادخل الاسم',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFADADBE),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',
                            ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.name,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 20.0),
                      child: Text(
                        'رقم الهاتف',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: TextFormField(
                        controller: _model.textController2,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                          hintText: 'من فضلك ادخل رقم الهاتف',
                          hintStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 16.0,
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFADADBE),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 15.0, 15.0, 15.0),
                        ),
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                              fontFamily: 'Readex Pro',

                            ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.phone,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 20.0),
                      child: Text(
                        'إختر المحافظة',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(null),
                      options: MainCubit.get(context).cityslIST,
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue1 = val),
                      width: 300.0,
                      height: 50.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      hintText: 'Please select...',
                      searchHintText: 'Search for an item...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 20.0),
                      child: Text(
                        'إختر فصيلة الدم',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController2 ??=
                          FormFieldController<String>(null),
                      options: [
                        'O+',
                        'O-',
                        'A+',
                        'A-',
                        'B+',
                        'B-',
                        'AB+',
                        'AB-'
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue2 = val),
                      width: 300.0,
                      height: 50.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      hintText: 'Please select...',
                      searchHintText: 'Search for an item...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 15.0, 20.0),
                      child: Text(
                        'السن',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController3 ??=
                          FormFieldController<String>(null),
                      options: [
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24',
                        '25',
                        '26',
                        '27',
                        '28',
                        '29',
                        '30',
                        '31',
                        '32',
                        '33',
                        '34',
                        '35',
                        '36',
                        '37',
                        '38',
                        '39',
                        '40'
                      ],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue3 = val),
                      width: 300.0,
                      height: 50.0,
                      searchHintTextStyle:
                          FlutterFlowTheme.of(context).labelMedium,
                      textStyle: FlutterFlowTheme.of(context).bodyLarge,
                      hintText: 'Please select...',
                      searchHintText: 'Search for an item...',
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 8.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isSearchable: false,
                    ),

                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: ConditionalBuilder(
                        condition: showloading,
                        builder: ( context)=>
                            FFButtonWidget(
                              onPressed: () async {
                                // context.pushNamed('home_patient_screen', extra: <String, dynamic>{
                                //     kTransitionInfoKey: TransitionInfo(
                                //       hasTransition: true,
                                //       transitionType:
                                //           PageTransitionType.rightToLeft,
                                //       duration: Duration(milliseconds: 100),
                                //     ),
                                //   },
                                // );
                                if (_model.dropDownValue1!=null
                                    &&_model.dropDownValue2!=null
                                    &&_model.dropDownValue3!=null

                                    &&_model.textController1!=null
                                    &&_model.textController2!=null

                                ){

                                  if(_model.textController2.text.length!=11)
                                  {
                                    showToast(text: 'رقم الهاتف غير صحيح', state: ToastStates.warning);
                                  }else{



                                    showToast(text: 'برجاء الانتظار قليلا', state: ToastStates.success);
                                    setState(() {
                                      showloading=false;

                                    });
                                    await FirebaseAuth.instance.verifyPhoneNumber(
                                      phoneNumber: "+2${ _model.textController2.text}",
                                      verificationCompleted: (PhoneAuthCredential credential) {},
                                      verificationFailed: (FirebaseAuthException e) {},
                                      codeSent: (String verificationId, int? resendToken) {
                                        var c=RegisterCubit.get(context);
                                        c.id= verificationId;
                                        c.name= _model.textController1.text;
                                        c.phone= _model.textController2.text;
                                        c.age= _model.dropDownValue3!;
                                        c.city= _model.dropDownValue1!;
                                        c.blood= _model.dropDownValue2!;
                                        context.pushNamed('otp2_screen');

                                      },
                                      codeAutoRetrievalTimeout: (String verificationId) {},
                                    );
                                  }

                                }
                                else{
                                  showToast(text: 'ادخل كل الحقول', state: ToastStates.error);
                                }
                              },
                              text: 'حفظ البيانات',
                              options: FFButtonOptions(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 15.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 22.0,
                                ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ), fallback:  (context) =>
                          Center(child: CircularProgressIndicator()) ,
                      ),



                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
