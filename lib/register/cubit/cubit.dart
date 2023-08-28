
import 'package:blood_bank/donorToHimModel.dart';
import 'package:blood_bank/donormodel.dart';
import 'package:blood_bank/register/cubit/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../UserModel.dart';



class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
var id;
var name;
var phone;
var city;
var blood;
var disease;
var age;


  void createUser({
    required String uId,
    required String name,
    required String phone,
    required String city,
    required String blood,
    required String disease,
    required String age,

  }) {
    donorModel model=donorModel(

      name: name,
      phone: phone,
      city:city ,
      blood: blood,
      age:age ,
      disease: disease,
      uId: uId,



    );

    FirebaseFirestore.instance.collection("users").doc(uId).set(model.Tomap()).then((value) {

      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
  void createDonorUser({
    required String uId,
    required String name,
    required String phone,
    required String city,
    required String blood,

    required String age,

  }) {
    donorToHimModel model=donorToHimModel(

      name: name,
      phone: phone,
      city:city ,
      blood: blood,
      age:age ,
      uId: uId,



    );

    FirebaseFirestore.instance.collection("users2").doc(uId).set(model.Tomap()).then((value) {

      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordRegisterState());
  }
}
