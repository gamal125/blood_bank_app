import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import '../../cubit/MainCubit.dart';
import '../../cubit/state.dart';
import '../../orderModel.dart';
import '../donormodel.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/form_field_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'search_screen_model.dart';
export 'search_screen_model.dart';

class SearchScreenWidget extends StatefulWidget {
  const SearchScreenWidget({Key? key}) : super(key: key);

  @override
  _SearchScreenWidgetState createState() =>
      _SearchScreenWidgetState();
}

class _SearchScreenWidgetState extends State<SearchScreenWidget> {
  late SearchScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchScreenModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {

    List<donorModel> users=[];

  return BlocConsumer<MainCubit, MainStates>(
  listener: (context,state){},
  builder: (context,state){
  return ConditionalBuilder(condition:  MainCubit.get(context).cityslIST.isNotEmpty , builder:(context)=>  GestureDetector(
    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
    child: Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(

       leading: FlutterFlowIconButton(
          borderColor: Color(0xFFD71515),
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 40.0,
          fillColor: Color(0xFFD71515),
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: FlutterFlowTheme.of(context).secondaryBackground,
            size: 24.0,

          ),
          onPressed: () async {
            context.safePop();
          },
        ),
        backgroundColor: Color(0xFFD71515),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            'ايجاد متبرع',
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
              FlutterFlowDropDown<String>(
                controller: _model.dropDownValueController1 ??=
                    FormFieldController<String>(null),
                options: MainCubit.get(context).cityslIST,
                onChanged: (val) {
                  setState(() => _model.dropDownValue1 = val);

                  if(_model.dropDownValue2!=null) {
                    MainCubit.get(context).selectedusersModel.clear();
                    MainCubit.get(context).getselectedusers(
                        city: _model.dropDownValue1!, blood: _model.dropDownValue2!);

                    setState(() {
                      users=MainCubit.get(context).selectedusersModel;

                    });
                  }

                  else{

                    showToast(text: 'اختر فصيلة الدم ', state: ToastStates.error);
                  }
                },
                width: 300.0,
                height: 50.0,
                searchHintTextStyle:
                FlutterFlowTheme.of(context).labelMedium,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                hintText: 'اختر المحافظه',
                searchHintText: 'ابحث',
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
                onChanged: (val) {
                  setState(() => _model.dropDownValue2 = val);

                  if(_model.dropDownValue1!=null) {
                    MainCubit.get(context).selectedusersModel.clear();
                    MainCubit.get(context).getselectedusers(
                        city: _model.dropDownValue1!, blood: _model.dropDownValue2!);

                    setState(() {
                      users=MainCubit.get(context).selectedusersModel;

                    });
                  }

                  else{

                    showToast(text: 'اختر المحافظه ', state: ToastStates.error);
                  }

                },


                width: 300.0,
                height: 50.0,
                searchHintTextStyle:
                FlutterFlowTheme.of(context).labelMedium,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                hintText: 'فصيلة الدم'
                ,
                searchHintText: 'ابحث',
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




             ConditionalBuilder(
               builder:(context)=>  GridView.count(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 crossAxisCount: 2,
                 crossAxisSpacing: 10.0,
                 mainAxisSpacing: 10,
                 childAspectRatio: 1 / 1.5,
                 children: List.generate(

                   MainCubit.get(context).allusersModel.length,(index) => GridProducts(MainCubit.get(context).allusersModel[index], context),
                 ),
               ),


               condition: state is! CreateOrderSuccessState,

               fallback: (context)=>  GridView.count(
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 crossAxisCount: 2,
                 crossAxisSpacing: 8.0,
                 mainAxisSpacing: 10,
                 childAspectRatio: 1 / 1.5,
                 children: List.generate(

                   MainCubit.get(context).selectedusersModel.length,(index) => GridProducts(MainCubit.get(context).selectedusersModel[index], context,),
                 ),
               ),
             )





            ],
          ),

        ),
      ),

    ),
  ), fallback: (context)=>Center(child: CircularProgressIndicator(),));




  },
  );
  }
  Widget GridProducts(donorModel model, context,) => InkWell(
    onTap: () {


      // MainCubit.get(context)
      //     .getProductData(model.id)
      //     .then((value) => navigateTo(context, ProductDetailsScreen()));
    },
    child: Stack(
      children: [

        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.none,
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 1,
            ),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(

                  height: 100.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset(
                    'assets/images/1.JPG',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(
                          "  سنه",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          " ${model.age}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),     Text(
                      model.disease!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      '${model.phone!}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),


        Positioned.fill(
          child: Align(
            alignment: Alignment(0, -1),
            child: ClipRect(
              child: Banner(
                message: '${model.blood!}',
                textStyle: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
                location: BannerLocation.topStart,
                color: Colors.green,
                child: Container(
                  height: 100.0,
                ),
              ),
            ),
          ),
        ),

      ],
    ),
  );


}