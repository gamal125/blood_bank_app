class donorModel{

  String? blood;
  String? city;
  String? name;
  String? phone;
  String? age;
  String? disease;
  String? uId;







  donorModel({
    this.name,
    this.blood,
    this.city,
    this.phone,
    this.age,
    this.uId,
    this.disease



  });


  donorModel.fromjson(Map<String,dynamic>json){

    blood=json['blood'];
    name=json['name'];
    city=json['city'];
    phone=json['phone'];
    age=json['age'];
    uId=json['uId'];
    disease=json['disease'];






  }
  Map<String,dynamic>Tomap(){
    return{

      'blood':blood,
      'name':name,
      'city':city,
      'phone':phone,
      'age':age,
      'disease':disease,
      'uId':uId,




    };
  }
}