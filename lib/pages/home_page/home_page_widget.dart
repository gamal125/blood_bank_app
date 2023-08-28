import 'package:blood_bank/components/components.dart';
import 'package:blood_bank/cubit/MainCubit.dart';
import 'package:blood_bank/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/cache_helper.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'buttonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 600.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MainCubit,MainStates>(
        builder: ( context,state)=>GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
    child: Scaffold(
    key: scaffoldKey,
    backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    body: SafeArea(
    top: true,
    child: Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
    color: FlutterFlowTheme.of(context).secondaryBackground,
    image: DecorationImage(
    fit: BoxFit.cover,
    image: Image.asset(
    'assets/images/blood_bank.jpg',
    ).image,
    ),
    ),
    child: Align(
    alignment: AlignmentDirectional(0.05, 0.0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Align(
    alignment: AlignmentDirectional(-0.05, 0.0),
    child: Padding(
    padding:
    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
    child: FFButtonWidget(
    onPressed: () async {
      var uId=CacheHelper.getData(key: 'uId');

      if(uId==null){
        if(MainCubit.get(context).cityslIST.isNotEmpty){

          context.pushNamed(
            'donor_page', extra: <String, dynamic>{kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 500),
          ),},);
        }
        else{
          showToast(text: 'تحقق من الانترنت', state: ToastStates.error);
        }}else{

        MainCubit.get(context).OrderModel.clear();
        MainCubit.get(context).HotOrderModel.clear();
        MainCubit.get(context).getDonor();
        MainCubit.get(context).getorders();
        MainCubit.get(context).gethotorders();
        context.pushNamed('hot_orders_screen');
      }
    },
    text: 'مُتبرع',
    options: FFButtonOptions(
    padding: EdgeInsetsDirectional.fromSTEB(
    34.0, 24.0, 34.0, 24.0),
    iconPadding: EdgeInsetsDirectional.fromSTEB(
    0.0, 0.0, 0.0, 0.0),
    color: Color(0xFF2FAEFA),
    textStyle:
    FlutterFlowTheme.of(context).titleSmall.override(
    fontFamily: 'Readex Pro',
    color: Colors.white,
    fontSize: 20.0,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
    color: Colors.transparent,
    width: 1.0,
    ),
    borderRadius: BorderRadius.circular(25.0),
    ),
    ).animateOnPageLoad(
    animationsMap['buttonOnPageLoadAnimation1']!),
    ),
    ),
    Align(
    alignment: AlignmentDirectional(-0.05, 0.0),
    child: FFButtonWidget(
    onPressed: () async {
      var uId = CacheHelper.getData(key: 'uId2');




      if(uId==null){
        if(MainCubit.get(context).cityslIST.isNotEmpty){




          context.pushNamed(
            'register_donor', extra: <String, dynamic>{kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            duration: Duration(milliseconds: 500),
          ),},);
        }
        else{
          showToast(text: 'تحقق من الانترنت', state: ToastStates.error);
        }}else{
        MainCubit.get(context).MyOrderModel.clear();
        MainCubit.get(context).getMyorders();
        MainCubit.get(context).allusersModel.clear();
        MainCubit.get(context).getusers();

        context.pushNamed('home_patient_screen');
      }

    },
    text: 'مُتبرع له',
    options: FFButtonOptions(
    padding: EdgeInsetsDirectional.fromSTEB(
    24.0, 24.0, 24.0, 24.0),
    iconPadding:
    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
    color: Color(0xFF2FAEFA),
    textStyle:
    FlutterFlowTheme.of(context).titleSmall.override(
    fontFamily: 'Readex Pro',
    color: Colors.white,
    fontSize: 20.0,
    ),
    elevation: 3.0,
    borderSide: BorderSide(
    color: Colors.transparent,
    width: 1.0,
    ),
    borderRadius: BorderRadius.circular(25.0),
    ),
    ).animateOnPageLoad(
    animationsMap['buttonOnPageLoadAnimation2']!),
    ),
    ],
    ),
    ),
    ),
    ),
    ),
    ),
        listener: (context,state)=>{});




  }
}
