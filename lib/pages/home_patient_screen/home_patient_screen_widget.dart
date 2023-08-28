import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../cubit/MainCubit.dart';
import '../../cubit/state.dart';
import '../../orderModel.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_patient_screen_model.dart';
export 'home_patient_screen_model.dart';

class HomePatientScreenWidget extends StatefulWidget {
  const HomePatientScreenWidget({Key? key}) : super(key: key);

  @override
  _HomePatientScreenWidgetState createState() =>
      _HomePatientScreenWidgetState();
}

class _HomePatientScreenWidgetState extends State<HomePatientScreenWidget> {
  late HomePatientScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePatientScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
  return BlocConsumer<MainCubit, MainStates>(
  listener: (context,state){},
  builder: (context,state){
  return ConditionalBuilder(condition:state is! deleteproductLoadingStates , builder:(context)=>  GestureDetector(
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
            'طلباتي',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        actions: [IconButton(onPressed: (){context.pushNamed('search_screen');}, icon: Icon(Icons.search))],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => catList(
                    MainCubit.get(context).MyOrderModel[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: MainCubit.get(context).MyOrderModel.length,
              ),



            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          context.pushNamed(
            'donor_pageCopy',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.scale,
                alignment: Alignment.bottomCenter,
              ),
            },
          );
        },
        backgroundColor: Color(0xFFD71515),
        icon: Icon(
          Icons.add,
          color: Color(0xFFF9F9FF),
          size: 18.0,
        ),
        elevation: 8.0,
        label: Container(),
      ),
    ),
  ), fallback: (context)=>Center(child: CircularProgressIndicator(),));




  },
  );
  }

  Widget catList(orderModel model, context) =>  InkWell(
  onTap: (){},
  child: Padding(
  padding:
  EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
  child: Container(
  width: double.infinity,
  decoration: BoxDecoration(
  color: Color(0x7AD30B0B),
  borderRadius: BorderRadius.circular(20.0),
  ),
  child: Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  '${model.name}:           ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  ' الاسم',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  ),
  ],
  ),
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  '${model.age}:            ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  'السن',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  ),
  ],
  ),
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  '${model.blood}:   ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  'فضيلة الدم',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  ),
  ],
  ),
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  '   ${model.city}:    ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  'المحافظه ',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  ),
  ],
  ),
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  ' ${model.state}:   ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  'حالة الطلب',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  ),
  ],
  ),
  Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
  Text(
  ' ${model.phone} :  ',
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.0,
  ),
  ),
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  0.0, 0.0, 15.0, 0.0),
  child: Text(
  'رقم الهاتف ',
  textAlign: TextAlign.center,
  style: FlutterFlowTheme.of(context)
      .bodyMedium
      .override(
  fontFamily: 'Readex Pro',
  fontSize: 16.5,
  ),
  ),
  ),
  ],
  ),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          ' ${model.place}:  ',
          style: FlutterFlowTheme.of(context)
              .bodyMedium
              .override(
            fontFamily: 'Readex Pro',
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0, 0.0, 15.0, 0.0),
          child: Text(
            'مكان التبرع ',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context)
                .bodyMedium
                .override(
              fontFamily: 'Readex Pro',
              fontSize: 16.5,
            ),
          ),
        ),
      ],
    ),
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'اكياس',
          style: FlutterFlowTheme.of(context)
              .bodyMedium
              .override(
            fontFamily: 'Readex Pro',
            fontSize: 16.0,
          )),
        Text(
          '${model.amount}:',
          style: FlutterFlowTheme.of(context)
              .bodyMedium
              .override(
            fontFamily: 'Readex Pro',
            fontSize: 16.0,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              0.0, 0.0, 15.0, 0.0),
          child: Text(
            ' الكمية المطلوبه',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context)
                .bodyMedium
                .override(
              fontFamily: 'Readex Pro',
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),

  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  5.0, 5.0, 5.0, 5.0),
  child: Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
  Padding(
  padding: EdgeInsetsDirectional.fromSTEB(
  5.0, 5.0, 5.0, 5.0),
  child: Row(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
  FlutterFlowIconButton(
  borderColor: Color(0x00FFFFFF),
  borderRadius: 20.0,
  borderWidth: 1.0,
  buttonSize: 40.0,
  fillColor: Color(0x00FFFFFF),
  icon: FaIcon(
  FontAwesomeIcons.trash,
  color: Color(0xFFD30B0B),
  size: 24.0,
  ),
  onPressed: () {

     MainCubit.get(context).deleteOrder(city: model.city!, blood: model.blood!, );

  },
  ),

  ],
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