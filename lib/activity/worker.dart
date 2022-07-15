import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
const apiKey='d8af7ae6de2425ef85b95d8498322ec8';
class Worker{

String location;
Worker({required this.location});


String temp='';
String humidity='';
String air_Speed='';
String description='';
String main='';
String icon='';
String city='';

  Future<void> getData() async{

      try{
       http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiKey&units=metric'));
          
        if(response.statusCode==200)
         {
          var data=jsonDecode(response.body);
          //print(data);
          temp=data['main']['temp'].round().toString();
          main=data['weather'][0]['main'];
          description=data['weather'][0]['description'];

          double air=data['wind']['speed'];
          air=air/0.27777777777778;
          air_Speed=air.round().toString();
          humidity=data['main']['humidity'].toString();
          icon=data['weather'][0]['icon'].toString();
          city=data['name'];
          
          }else{
          temp='NA';
          humidity='NA';
          air_Speed='NA';
          description='Can\'t Find Data';
          main='NA';
          icon='10d';
          city='NA';

          }
      }catch(e){
        print(e);
           temp='NA';
          humidity='NA';
          air_Speed='NA';
          description='Can\'t Find Data';
          main='NA';
          icon='10d';
          city='NA';
      }


          
         
  }




}