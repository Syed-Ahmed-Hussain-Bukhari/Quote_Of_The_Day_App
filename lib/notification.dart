import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/homepage.dart';

class notificationPage extends StatefulWidget {
  const notificationPage({super.key});

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.3, 
          iconTheme:const  IconThemeData(
              size: 35,//change size on your need
              color: Colors.black,//change color on your need
            ),
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
            ),
            child:  Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            hintText: "  Search....",
                            hintStyle: TextStyle(fontSize: 22,color: Colors.black),
                            prefixIcon: Icon(Icons.search,color: Colors.black,size: 24,),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                              )
                            )
                          ),
                        ),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Notification",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                    SizedBox(
                          width: MediaQuery.of(context).size.width*0.4
                        ),
                        InkWell(
                          onTap: (){ 
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            child: Icon(Icons.notifications_active,size: 35,),
                          ),
                        )
                    
                    ],
                  )

              ],
            ),
          ),
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 207, 102, 225),
                  Color.fromARGB(255, 97, 164, 219)
                ],
              ),
            ),
            child:StreamBuilder(stream: FirebaseFirestore.instance.collection("Notification").snapshots(),
            builder: (context, snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator(
                        color:Color.fromARGB(255, 207, 102, 225),
                        backgroundColor: Color.fromARGB(255, 97, 164, 219),
                        
                      );
                    } 
                    
                    else if(snapshot.hasData){
                         return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,index){
                         return  Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(right: 12,top: 35,bottom: 35,left: 12),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      // height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(166, 255, 255, 255),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(3, 5), color: Colors.black12)
                          ]),
                        child: ListTile(
                         title: Text("Hello there! 👏 "   ,
                                          style: TextStyle(
                                              fontSize: 22, fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(snapshot.data!.docs[index]["notification"].toString()    ,
                                              style: TextStyle(
                                                color: Colors.black,
                                                  fontSize: 18.5, fontWeight: FontWeight.bold),
                                            ),
                                            Text(snapshot.data!.docs[index]["time"].toString()    ,
                                              style: TextStyle(
                                                color: Colors.black,
                                                  fontSize: 14, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        
                                        leading:CircleAvatar(
                                        
                                          child: Icon(Icons.person_outline,size: 35,),
                                        ) ,
                                        trailing: IconButton(onPressed: ()async{
                                              var id=snapshot.data!.docs[index].id;
                                             await FirebaseFirestore.instance.collection("Notification").doc(id).delete();

                                        
                                        }, icon: Icon(Icons.delete_sweep,size: 30,),),
                        )
                        
                        
                      );

                    });
                    
                    }

                    //   return ListView.builder(
                    // itemCount: snapshot.data!.docs.length,
                    // itemBuilder: (context,index){
                    //      return Center(
                    //  child: Container(
                    //  margin: EdgeInsets.only(bottom: 20),
                    //   width: MediaQuery.of(context).size.width * 0.9,
                    //   height: MediaQuery.of(context).size.height * 0.25,
                    //   decoration: BoxDecoration(
                    //       color: Color.fromARGB(166, 255, 255, 255),
                    //       borderRadius: BorderRadius.circular(25),
                    //       boxShadow: const [
                    //         BoxShadow(
                    //             offset: Offset(3, 5), color: Colors.black12)
                    //       ]),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       SizedBox(
                    //         height: MediaQuery.of(context).size.height * 0.05,
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.only(left: 12, top: 12),
                    //         child: Text(snapshot.data!.docs[index]["quote"].toString()
                    //           ,
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: EdgeInsets.only(left: 12, top: 25),
                    //         child: Text(
                    //           snapshot.data!.docs[index]["author"].toString(),
                    //           style: TextStyle(
                    //               fontSize: 16, fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                          
                    //     ],
                    //   )),
                    //      );
                         

                    // });
                    
                    // }
                    
              return Container();
            },
            )
        )
    );
  }
}