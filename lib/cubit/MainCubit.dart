









import 'package:bloc/bloc.dart';
import 'package:blood_bank/components/constants.dart';
import 'package:blood_bank/cubit/state.dart';
import 'package:blood_bank/orderModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../categoriesModel.dart';
import '../components/cache_helper.dart';
import '../donorToHimModel.dart';
import '../donormodel.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialStates());

  static MainCubit get(context) => BlocProvider.of(context);
  List<String> cityslIST=[];



  List<cityModel> cityname = [];
  List<donorToHimModel> DonorToHimModel = [];
  List<orderModel> HotOrderModel = [];
  List<orderModel> OrderModel = [];
  List<orderModel> MyOrderModel = [];
  List<donorModel> allusersModel = [];
  List<donorModel> selectedusersModel = [];
  void getselectedusers({required String city,required String blood})
  {
   allusersModel.forEach((element) {

     if(element.city==city&&element.blood==blood){
       selectedusersModel.add(element);


     }

     else{}
   });
   emit(CreateOrderSuccessState());
  }

  void getusers(){
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        allusersModel.add(donorModel.fromjson(element.data()));
      });

    });
  }

  void getMyorders() {

    FirebaseFirestore.instance.collection("users2")
        .doc(CacheHelper.getData(key: 'uId2'))
        .collection('hotorders').get().then((value) {
      value.docs.forEach((element) {
        MyOrderModel.add(orderModel.fromjson(element.data()));
      });});
    FirebaseFirestore.instance.collection("users2")
        .doc(CacheHelper.getData(key: 'uId2'))
        .collection('orders').get().then((value) {
      value.docs.forEach((element) {
        MyOrderModel.add(orderModel.fromjson(element.data()));
      });


      emit(CreateCategorySuccessState());
    }).catchError((error) {
      emit(CreateCategoryErrorStates(error.toString()));
    });
  }


  void getorders(){
    FirebaseFirestore.instance.collection('city').doc(donermodel!.city).collection(donermodel!.city!).
    doc(donermodel!.blood).collection('متبرع له').get().then((value) {
      value.docs.forEach((element) {
        OrderModel.add(orderModel.fromjson(element.data()));
      });

    });
  }
  void gethotorders(){
    FirebaseFirestore.instance.collection('hots').get().then((value) {
      value.docs.forEach((element) {
        HotOrderModel.add(orderModel.fromjson(element.data()));
      });

    });
  }

  void getCity() {


    FirebaseFirestore.instance.collection("city").get().then((value) {
      value.docs.forEach((element) {
        cityname.add(cityModel.fromjson(element.data()));
      });
      cityname.forEach((element) {
      cityslIST.add(element.name!);
      });
      emit(CreateCategorySuccessState());
    }).catchError((error) {
      emit(CreateCategoryErrorStates(error.toString()));
    });
  }
  donorModel? donermodel;
  void getDonor() {


    FirebaseFirestore.instance.collection("users").doc(CacheHelper.getData(key: 'uId')).get().then((value) {
    donermodel=  donorModel.fromjson(value.data()!);

      emit(CreateCategorySuccessState());
    }).catchError((error) {
      emit(CreateCategoryErrorStates(error.toString()));
    });
  }
  void createDonor({
    required String phone,
    required String name,
    required String age,
    required String city,
    required String blood,
    required String disease,

  }) {
    donorModel model = donorModel(
      name: name,
      blood:blood ,
      city: city,
      phone: phone,
      age: age,
      disease: disease


    );
    FirebaseFirestore.instance.collection("city").doc(city).collection(city)
        .doc(blood).collection("متبرع").doc("${name+phone}").set(model.Tomap())
        .then((value) {
      CacheHelper.saveData(key: 'uId', value: "${name+phone}");
      CacheHelper.saveData(key: 'name', value: "$name");
      CacheHelper.saveData(key: 'city', value: "$city");
      CacheHelper.saveData(key: 'phone', value: "$phone");
      CacheHelper.saveData(key: 'age', value: "$age");
      CacheHelper.saveData(key: 'disease', value: "$disease");
      CacheHelper.saveData(key: 'blood', value: "$blood");


      emit(CreateOrderSuccessState());
    }).catchError((error) {
      emit(CreateOrderErrorStates(error.toString()));
    });
  }



  void createDonorToHim({
    required String phone,
    required String name,
    required String place,
    required String age,
    required String city,
    required String blood,
    required String amount,
    required String state

  }) {
    orderModel model = orderModel(
        name: name,
        blood:blood ,
        city: city,
        phone: phone,
        place: place,
        age: age,
      amount: amount,
      state: state,



    );
    MyOrderModel.forEach((element) {
      if(element.state=='تبرع'){
        FirebaseFirestore.instance.collection("city").doc(element.city).collection(element.city!)
            .doc(element.blood).collection("متبرع له").doc(CacheHelper.getData(key: 'uId2')).delete();
      }
    });



    if(state!='تبرع'){
      FirebaseFirestore.instance.collection('users2').doc(CacheHelper.getData(key: 'uId2')).collection('hotorders').doc(CacheHelper.getData(key: 'uId2')).set(model.Tomap()).then((value) {
      });
      FirebaseFirestore.instance.collection("hots").doc(CacheHelper.getData(key: 'uId2')).set(
          model.Tomap())
          .then((value) {
        emit(CreateOrderSuccessState());
      }).catchError((error) {
        emit(CreateOrderErrorStates(error.toString()));
      });

    }
    else {
      FirebaseFirestore.instance.collection('users2').doc(CacheHelper.getData(key: 'uId2')).collection('orders').doc(CacheHelper.getData(key: 'uId2')).set(model.Tomap()).then((value) {
      });
      FirebaseFirestore.instance.collection("city").doc(city).collection(city)
          .doc(blood).collection("متبرع له").doc(CacheHelper.getData(key: 'uId2')).set(
          model.Tomap())
          .then((value) {
        emit(CreateOrderSuccessState());
      }).catchError((error) {
        emit(CreateOrderErrorStates(error.toString()));
      });
    }
  }


  void deleteOrder(
  {
    required String city,
    required String blood,

}
      ){
    emit(deleteproductLoadingStates());
    FirebaseFirestore.instance.collection('users2').
    doc(CacheHelper.getData(key: 'uId2')).
    collection('orders').
    doc(CacheHelper.getData(key: 'uId2')).delete();
    if(state=='تبرع'){
      FirebaseFirestore.instance.collection("city").doc(city).collection(city)
          .doc(blood).collection("متبرع له").doc(CacheHelper.getData(key: 'uId2')).delete().then((value) {
            MyOrderModel.clear();
            getMyorders();
            emit(deleteProductsSuccessStates());

      });

    }else{
      MyOrderModel.clear();
      getMyorders();
      FirebaseFirestore.instance.collection("hots").doc(CacheHelper.getData(key: 'uId2')).delete().then((value) {
        emit(deleteProductsSuccessStates());

      });    }
  }

  void updateDonor({
    required String phone,
    required String name,
    required String age,
    required String city,
    required String blood,
    required String disease,

  }) {
    donorModel donermodel = donorModel(
        name: name,
        blood:blood ,
        city: city,
        phone: phone,
        age: age,
        disease: disease,
        uId:CacheHelper.getData(key: 'uId')


    );
    FirebaseFirestore.instance.collection('users').doc(CacheHelper.getData(key: 'uId')).update(donermodel.Tomap()).then((value) {

      getDonor();
    });




  }



}







