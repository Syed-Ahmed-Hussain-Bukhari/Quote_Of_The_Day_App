import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quote_app/homepage.dart';

class QuoteCreator extends StatefulWidget {
  const QuoteCreator({super.key});

  @override
  State<QuoteCreator> createState() => _QuoteCreatorState();
}

class _QuoteCreatorState extends State<QuoteCreator> {
    var time=DateTime.now();
  TextEditingController quoteController=TextEditingController();
  TextEditingController authorController=TextEditingController();
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1, 
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
            )
          )
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
            child: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Create your own quote",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                 Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    controller: authorController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            hintText: "  Enter the author's name....",
                            hintStyle: TextStyle(fontSize: 16,color: Colors.black),
                            prefixIcon: Icon(Icons.person,color: Colors.black,size: 24,),
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

                Container(
                  margin: EdgeInsets.all(12),
                  child: TextField(
                    // maxLength: 5,
                    maxLines: 5,
                    controller: quoteController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  Enter your quote here...",
                            hintStyle: TextStyle(fontSize: 16,color: Colors.black),
                            // prefixIcon: Icon(Icons.brush_outlined,color: Colors.black,size: 24,),
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
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                GestureDetector(
                  onTap: ()async{
                    
                    await FirebaseFirestore.instance.collection("QuoteCreator").doc().set({
                      "quote":quoteController.text.toString(),
                      "author":authorController.text.toString(),
                      "time":DateFormat("HH:mm a").format(time).toString()
                      
                    }).then((value) async => await FirebaseFirestore.instance.collection("Notification").doc().set({
                      "notification":"Your quote has been successfully inserted!",
                        "time":DateFormat("HH:mm a").format(time).toString()
                      
                      
                    })
                    
                    ).then((value) => showDialog(
                      
                      context: context,
                      builder: (context)=>AlertDialog(
                        backgroundColor: Color.fromARGB(255, 111, 157, 195),
                        content: SingleChildScrollView(
                          child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 207, 102, 225),
                      Color.fromARGB(255, 97, 164, 219)
                              ],
                        ),
                      ),
                      child: Column(
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.cancel_outlined,color: Colors.black,size: 30,))
                                  ],
                                ),
                                Title(color: Colors.black, child: Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Your quote has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      )));
                      quoteController.text="";
                      authorController.text="";
                      setState(() {
                        
                      });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 19,right: 26),
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                     boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 3),
                        color: Colors.black12
                      )
                     ]
                    ),
                    child: Center(child: Text("Save Quote",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),),
                  ),
                )
              ],
            ),
        ),

        
    );
  }
}