import 'package:blood_bank/cubit/MainCubit.dart';

import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

import 'donor_setting_screen_model.dart';
export 'donor_setting_screen_model.dart';

class DonorSettingScreenWidget extends StatefulWidget {
  const DonorSettingScreenWidget({Key? key}) : super(key: key);

  @override
  _DonorSettingScreenWidgetState createState() =>
      _DonorSettingScreenWidgetState();
}

class _DonorSettingScreenWidgetState extends State<DonorSettingScreenWidget> {
  late DonorSettingScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DonorSettingScreenModel());

    _model.textController1 ??= TextEditingController(text: MainCubit.get(context).donermodel!.name!);
    _model.textController2 ??= TextEditingController(text:MainCubit.get(context).donermodel!.phone! );
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
          backgroundColor: Color(0xFFD71515),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'الصفحه الشخصية',
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
          elevation: 0.0,
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
                        'اسم المُتبرع',
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
                              color: Colors.black,
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
                              color: Colors.black,
                            ),
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.name,
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
                          FormFieldController<String>(
                        _model.dropDownValue1 ??=MainCubit.get(context).donermodel!.city!,
                      ),
                      options:MainCubit.get(context).cityslIST,
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
                          FormFieldController<String>(
                        _model.dropDownValue2 ??= MainCubit.get(context).donermodel!.blood!,
                      ),
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
                        'هل تعاني من امراض مزمنة',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ),
                    FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController3 ??=
                          FormFieldController<String>(
                        _model.dropDownValue3 ??= MainCubit.get(context).donermodel!.disease!,
                      ),
                      options: [
                        'القلب',
                        'السكر',
                        'الضغط',
                        'حساسيه',
                        'الكبد',
                        'الفشل الكلوي',
                        'لا اعاني من اي امراض مزمنه',
                        '...اخري'
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
                      controller: _model.dropDownValueController4 ??=
                          FormFieldController<String>(
                        _model.dropDownValue4 ??= MainCubit.get(context).donermodel!.age!,
                      ),
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
                          setState(() => _model.dropDownValue4 = val),
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
                        child: FFButtonWidget(
                          onPressed: () async {
                            MainCubit.get(context).updateDonor(
                                phone: _model.textController2.text,
                                name:_model.textController1.text ,
                                age: _model.dropDownValue4!,
                                city: _model.dropDownValue1!,
                                blood: _model.dropDownValue2!,
                                disease:_model.dropDownValue3!
                            );

                            context.pushNamed('HomePage');
                          },
                          text: 'حفظ البيانات',
                          options: FFButtonOptions(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 15.0, 15.0, 15.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFD71515),
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
