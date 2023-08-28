class cityModel{


  String? name;




  cityModel({


    this.name,


  });


  cityModel.fromjson(Map<String,dynamic>json){


    name=json['name'];





  }
  Map<String,dynamic>Tomap(){
    return{


      'name':name,



    };
  }
}