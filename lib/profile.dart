import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/homepage.dart';
import 'package:quote_app/settings.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1, 
          iconTheme:const  IconThemeData(
              size: 35,//change size on your need
              color: Colors.black,//change color on your need
            ),
           actions: [
                    InkWell(
                   onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SettingPage()));
                    },
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(Icons.settings)),
                ),
            ],
          leading: Container(
            width: MediaQuery.of(context).size.width ,
            child: Column(
              children: [
                 SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                InkWell(
                   onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyHomePage()));
                    },
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.arrow_back)),
                ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
              ],
            ),
          ),
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromARGB(255, 207, 102, 225),
                Color.fromARGB(255, 97, 164, 219)
              ]),
            )
          )
        ),
        body: Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height ,
                width: MediaQuery.of(context).size.width ,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 207, 102, 225),
                      Color.fromARGB(255, 97, 164, 219)
                              ],
                        ),
                      ),
                      child:StreamBuilder(
                        stream: FirebaseFirestore.instance.collection("ProfileSettings").snapshots(),
                        builder: (context, snapshot){
                          if(snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator(
                        color:Color.fromARGB(255, 207, 102, 225),
                        backgroundColor: Color.fromARGB(255, 97, 164, 219),
                        
                      );
                    } 
                    else if(snapshot.hasData){
                         
                         return ListView(
                          children: [
                              SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.02,
                                        ),
                                        CircleAvatar(
                                          radius: 50,
                                          child: Icon(Icons.person_outline,size: 50,)
                                          
                                        ),
                                        SizedBox(
                            height: MediaQuery.of(context).size.height*0.02
                          ),
                                        Container(
                          
                          child: Center(child: Text(snapshot.data!.docs[00]["name"],style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),))),
                           Container(
                          
                          child: Center(child: Text(snapshot.data!.docs[01]["location"],style:  TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),))),
                                           
                           
                           SizedBox(
                            height: MediaQuery.of(context).size.height*0.04
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 22),
                              
                              child: Text("About",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          
                          Container(
                                       margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 30,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   About",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                              subtitle: Text("    ${snapshot.data!.docs[02]["About"]}",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              leading: Icon(Icons.person,size: 35,color: Colors.black,),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.01
                          ),
                          Container(
                                       margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 30,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Region",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                              subtitle: Text("    ${snapshot.data!.docs[03]["Region"]}",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              leading: Icon(Icons.settings_outlined,size: 35,color: Colors.black,),
                            ),
                          ),
                           SizedBox(
                            height: MediaQuery.of(context).size.height*0.01
                          ),
                          Container(
                                       margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 30,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   language",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                              subtitle: Text("    ${snapshot.data!.docs[04]["language"]}",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              leading: Icon(Icons.language_outlined,size: 35,color: Colors.black,),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.03
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                              
                              child: Text("Other",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                          
                          Container(
                             
                             margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 30,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Your Favorite Quote",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                              subtitle: Text("    09",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              leading: Icon(Icons.favorite,size: 30,color: Colors.red,),
                            ),
                          ),
                      
                          Container(
                             
                             margin: EdgeInsets.all(20),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 30,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Your own Quote",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                              subtitle: Text("    05",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              leading:Image.network("https://th.bing.com/th/id/R.8cd5230dae45e046638270be53f1339a?rik=G%2b9ms3f4Ao2LaA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_532719.png&ehk=2TkunpSDjDF%2fLd9Yp8u1KkWWvavG6Y8Xq3EI1tdvlkg%3d&risl=&pid=ImgRaw&r=0",scale: 45,)
                                 
                            ),
                          ),
                          ]
                         );
                    
                    }
                     
                  
                    return Container();
                        }
                      )
                      )
                      );
  }}
                          
                        
  