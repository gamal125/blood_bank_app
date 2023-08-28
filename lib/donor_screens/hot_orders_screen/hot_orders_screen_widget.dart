import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../../components/components.dart';
import '../../cubit/MainCubit.dart';
import '../../cubit/state.dart';
import '../../orderModel.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'hot_orders_screen_model.dart';
export 'hot_orders_screen_model.dart';

class HotOrdersScreenWidget extends StatefulWidget {
  const HotOrdersScreenWidget({Key? key}) : super(key: key);

  @override
  _HotOrdersScreenWidgetState createState() => _HotOrdersScreenWidgetState();
}

class _HotOrdersScreenWidgetState extends State<HotOrdersScreenWidget> {
  late HotOrdersScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotOrdersScreenModel());
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
              'طلبات عاجلة',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => catList(
                      MainCubit.get(context).HotOrderModel[index], context),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: MainCubit.get(context).HotOrderModel.length,
                ),



              ],
            ),

          ),
        ),
      ),
    );
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
                  '${model.name}:          ',
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
                  '${model.age}:           ',
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
                  '${model.blood} :  ',
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
                  '   ${model.city}:   ',
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
                  ' ${model.state}:  ',
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
                  ' ${model.phone}: ',
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
                  ' ${model.place}: ',
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
                        0.0, 0.0, 15.0, 5.0),
                    child: FlutterFlowIconButton(
                      borderColor: Color(0x00D30B0B),
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: Color(0x00D30B0B),
                      icon: Icon(
                        Icons.phone,
                        color: Color(0xFF472FFA),
                        size: 30.0,
                      ),
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(model.phone!);                      },
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
