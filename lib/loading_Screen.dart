import 'package:flutter/material.dart';
import 'package:weather/activity/worker.dart';
import 'package:weather/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  final String location;
  LoadingScreen({ required this.location});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String temp='';
  String humidity='';
  String air_speed='';
  String des='';
  String main='';
  String icon='';
  String City='Patiala';
 

 void startApp(String cityName) async{
 Worker instance=Worker(location: cityName);
 await instance.getData();
  temp=instance.temp;
  humidity=instance.humidity;
  air_speed=instance.air_Speed;
  des=instance.description;
  main=instance.main;
   icon=instance.icon;
   City=instance.city;
  

  
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
      return Home(temp: temp, humidity: humidity, air_speed: air_speed, description: des, main: main,icons: icon,city:City);
    }));

 }

 @override
  void initState() {
   
    super.initState();
    startApp(widget.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180,),
              Image.asset("images/logo.png",height: 240,width: 240,),

              Text("Weather App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
           
              SizedBox(height: 30,),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple,

    );
  }
}