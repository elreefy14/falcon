

import 'package:dio/dio.dart';

class appApi{

  void getData()async{
    try{
      final response = await Dio().post(
          "https://optima-software-solutions.com/falcon/editstudent.php",
          //ApiConstants.registerUrl,
          data: {
            "id": "16",
            "name": "mohamed",
            "phone": "01234567899",
            "email": "m@t.com",
            "univercity": "11",
            "faculty": "11",
            "level": "11"
          }
      );

      print("response : $response");
    }on DioException catch(e){
      print(e.message);
      if (e.response!.statusCode==401){
      }
    }
  }
}

void main (){
   appApi().getData();
}