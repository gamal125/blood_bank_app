class donorToHimModel{

  String? blood;
  String? city;
  String? name;
  String? phone;
  String? age;
   String? uId;







  donorToHimModel({
    this.name,
    this.blood,
    this.city,
    this.phone,
    this.age,
     this.uId,
    // this.amount



  });


  donorToHimModel.fromjson(Map<String,dynamic>json){

    blood=json['blood'];
    name=json['name'];
    city=json['city'];
    phone=json['phone'];
    age=json['age'];
    uId=json['uId'];
    // amount=json['amount'];






  }
  Map<String,dynamic>Tomap(){
    return{

      'blood':blood,
      'name':name,
      'city':city,
      'phone':phone,
      'age':age,
       'uId':uId,
      // 'amount':amount,




    };
  }
}