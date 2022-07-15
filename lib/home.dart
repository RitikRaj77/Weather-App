import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather/loading_Screen.dart';


class Home extends StatefulWidget {
  final String temp;
  final String humidity;
  final String air_speed;
  final String main;
  final String description;
  final String icons;
  final String city;

  Home(
      {required this.temp,
      required this.humidity,
      required this.air_speed,
      required this.description,
      required this.main,
      required this.icons,
      required this.city
      });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar:PreferredSize(
       preferredSize: Size.fromHeight(0),
       child:AppBar(
        
        backgroundColor: Colors.grey,
               )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration:BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              
                colors: [
                  Colors.blueGrey,
                Colors.deepPurple,
                
                ]
              )
            ),
          
            child: Column(
              children: [
                Container(
                  //search
          
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(30)),
          
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if(searchController.text.isNotEmpty){
                           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoadingScreen(location: searchController.text),),);}
                        },
                        child: Container(child: Icon(Icons.search),margin:EdgeInsets.fromLTRB(3, 0, 8, 0),),
                      ),
                      Expanded(
                        child: TextField(
                          controller:searchController,
      
                          decoration: InputDecoration(
                              hintText: 'Enter City Name',
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                ),
          
               Row(
                 children: [
                   Expanded(
                     child: Container(
                      padding:EdgeInsets.all(25),
                      margin:EdgeInsets.symmetric(horizontal:25),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color:Colors.white.withOpacity(0.4)
                      ),
                      child:Row(
                        children: [
                       Image.network('http://openweathermap.org/img/wn/${widget.icons}@2x.png'),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              Text('${widget.description}',
                              style:TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.bold
                              ),),
                              Text('In ${widget.city}',
                              style:TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.bold
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                     ),
                   ),
                 ],
               ),
               
               Row(
                 children: [
                   Expanded(
                     child: Container(
                            height:250,
                            padding:EdgeInsets.all(25),
                            margin:EdgeInsets.symmetric(horizontal:25,vertical:10),
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color:Colors.white.withOpacity(0.4)
                            ),
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //icon,
      
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    Text('${widget.temp}',style:TextStyle(
                                      fontSize:90,
      
                                    ),),
                                    Text('°C',
                                    style: TextStyle(
                                      fontSize:50
                                    ),)
      
                                  ],
                                )
      
                              ],
                            ),
                           ),
                   ),
                 ],
               ),
          
              Row(
          
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Expanded(
                   child: Container(
                              height:180,
                              padding:EdgeInsets.all(25),
                              margin:EdgeInsets.fromLTRB(25,0,10,0),
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color:Colors.white.withOpacity(0.4)
                              ),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                
                                  //  Row(
                                  //   children: [
                                       // Icon()
                                  //   ],
                                  //  ),
                                  Text('Air Speed'),
                                  Text('${widget.air_speed}',style: TextStyle(
                                    fontSize:40,
                                    fontWeight:FontWeight.bold
                                  ),),
                                  Text('km/h',style: TextStyle(
                                    fontSize:20
                                  ),)
      
      
                                ],
                              ),
                             ),
                 ),
                
                
                  Expanded(
                    child: Container(
                             
                              padding:EdgeInsets.all(25),
                              margin:EdgeInsets.fromLTRB(10,0,25,0),
                              height:180,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color:Colors.white.withOpacity(0.4)
                              ),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                
                                  //  Row(
                                  //   children: [
                                       // Icon()
                                  //   ],
                                  //  ),
                                  Text('Humidity'),
                                  Text('${widget.humidity}',style: TextStyle(
                                    fontSize:40,
                                    fontWeight:FontWeight.bold
                                  ),),
                                  Text('%',style:TextStyle(
                                    fontSize:20
                                  ),)
      
      
                                ],
                              ),
                             ),
                  ),
                ],
               ),
          
              SizedBox(height:30,)
                 
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
