import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/profile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  TextEditingController nameController=TextEditingController();
  TextEditingController LocationController=TextEditingController();
  TextEditingController aboutController=TextEditingController();
  TextEditingController RegionController=TextEditingController();
  TextEditingController LanguageController=TextEditingController();
  
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ProfilePage()));
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
                      child: Column(
                        children: [
                          SizedBox(
                          height: MediaQuery.of(context).size.height*0.0
                        ),
                  Row(
                    children: [
                      Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text("Settings",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  SizedBox(
                          height: MediaQuery.of(context).size.height*0.04
                        ),
                         Row(
                           children: [
                             Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text("Account",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
                           ],
                         ),
                    
       
                   InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        contentPadding: EdgeInsets.all(12),
                             content: SingleChildScrollView(
                              child: Container(
                                 decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 5), color: Colors.black12)
                              ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Account name",style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.00,
                  ),

                Container(
                  margin: EdgeInsets.all(12),

                  child: TextField(
  
                    
                    controller: nameController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  Account name",
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  GestureDetector(
                     onTap: ()async{
                      
                    var index=0;
                    await FirebaseFirestore.instance.collection("ProfileSettings").doc("${index}${index}".toString()).set({
                      "name":nameController.text.toString(),
                      "index":index.toString(),
                      
                    }).then((value) => showDialog(
                      
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
                        child: Text("Your name has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      ))).then((value) => Navigator.pop(context));
                    
                  },
                    child: Container(
                      margin: EdgeInsets.only(left: 19,right: 26),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                       boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 3),
                          color: Colors.black12
                        )
                       ]
                      ),
                      child: Center(child: Text("Save",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                                  ],
                                ),
                              ),
                             ),
                      ));
                    },
                     child: Container(
                                    margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Account name",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                    leading: Icon(Icons.person_outline,size: 35,color: Colors.black,),
                            ),
                          ),
                   ),



                         InkWell(
                          
                           child: Container(
                                               margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                                               padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Account Image",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                    leading: Icon(Icons.image,size: 35,color: Colors.black,),
                            ),
                                                 ),
                         ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01
                        ),


                   InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        contentPadding: EdgeInsets.all(12),
                             content: SingleChildScrollView(
                              child: Container(
                                 decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 5), color: Colors.black12)
                              ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Location",style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.00,
                  ),

                Container(
                  margin: EdgeInsets.all(12),

                  child: TextField(
  
                    
                    controller: LocationController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  Country,City",
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 19,right: 26),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                     boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 3),
                        color: Colors.black12
                      )
                     ]
                    ),
                    child: GestureDetector(
                      onTap: ()async{
                      
                    var index=0;
                    await FirebaseFirestore.instance.collection("ProfileSettings").doc("${index}${index+1}".toString()).set({
                      "location":LocationController.text.toString(),
                      "index":index.toString(),
                      
                    }).then((value) => showDialog(
                      
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
                        child: Text("Your Location has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      ))).then((value) => Navigator.pop(context));
                    
                  },
                      child: Center(child: Text("Save",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                                  ],
                                ),
                              ),
                             ),
                      ));
                    },
                     child: Container(
                                    margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Location",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                    leading: Icon(Icons.location_on,size: 35,color: Colors.black,),
                            ),
                          ),
                   ),
                        
                         InkWell(
                          onTap: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        contentPadding: EdgeInsets.all(12),
                             content: SingleChildScrollView(
                              child: Container(
                                 decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 5), color: Colors.black12)
                              ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("About",style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.00,
                  ),

                Container(
                  margin: EdgeInsets.all(12),

                  child: TextField(
  
                    
                    controller: aboutController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  About...",
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 19,right: 26),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                     boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 3),
                        color: Colors.black12
                      )
                     ]
                    ),
                    child: GestureDetector(
                      onTap: ()async{
                      
                    var index=0;
                    await FirebaseFirestore.instance.collection("ProfileSettings").doc("${index}${index+2}".toString()).set({
                      "About":aboutController.text.toString(),
                      "index":index.toString(),
                      
                    }).then((value) => showDialog(
                      
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
                        child: Text("Your data has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      ))).then((value) => Navigator.pop(context));
                    
                  },
                      child: Center(child: Text("Save",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                                  ],
                                ),
                              ),
                             ),
                      ));
                    },
                           child: Container(
                                          margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                                               padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
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
                                    leading: Icon(Icons.person,size: 35,color: Colors.black,),
                            ),
                                                 ),
                         ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.04
                        ),
                         Row(
                           children: [
                             Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text("Other",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
                           ],
                         ),
                    
       
                   InkWell(
                    onTap: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        contentPadding: EdgeInsets.all(12),
                             content: SingleChildScrollView(
                              child: Container(
                                 decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 5), color: Colors.black12)
                              ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Region",style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.00,
                  ),

                Container(
                  margin: EdgeInsets.all(12),

                  child: TextField(
  
                    
                    controller: RegionController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  Region",
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 19,right: 26),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                     boxShadow: [
                      BoxShadow(
                        offset: Offset(5, 3),
                        color: Colors.black12
                      )
                     ]
                    ),
                    child: GestureDetector(
                      onTap: ()async{
                      
                    var index=0;
                    await FirebaseFirestore.instance.collection("ProfileSettings").doc("${index}${index+3}".toString()).set({
                      "Region":RegionController.text.toString(),
                      "index":index.toString(),
                      
                    }).then((value) => showDialog(
                      
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
                        child: Text("Your Region has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      ))).then((value) => Navigator.pop(context));
                    
                  },
                      child: Center(child: Text("Save",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                                  ],
                                ),
                              ),
                             ),
                      ));
                    },
                     child: Container(
                                    margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                        padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("    Region",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                    leading: Icon(Icons.settings_outlined,size: 35,color: Colors.black,),
                               ),
                          ),
                   ),

                   
                         InkWell(
                          onTap: (){
                      showDialog(context: context, builder: (context)=>AlertDialog(
                        contentPadding: EdgeInsets.all(12),
                             content: SingleChildScrollView(
                              child: Container(
                                 decoration: BoxDecoration(
                              color: Color.fromARGB(166, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(3, 5), color: Colors.black12)
                              ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 22),
                        child: Text("Language",style:  TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                ),
                
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.00,
                  ),

                Container(
                  margin: EdgeInsets.all(12),

                  child: TextField(
  
                    
                    controller: LanguageController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            
                            hintText: "  Language",
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  InkWell(
                      onTap: ()async{
                      
                    var index=0;
                    await FirebaseFirestore.instance.collection("ProfileSettings").doc("${index}${index+4}".toString()).set({
                      "language":LocationController.text.toString(),
                      "index":index.toString(),
                      
                    }).then((value) => showDialog(
                      
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
                        child: Text("Your Language has been successfully inserted!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      ))).then((value) => Navigator.pop(context));
                    
                  },
                    child: Container(
                      margin: EdgeInsets.only(left: 19,right: 26),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                       boxShadow: [
                        BoxShadow(
                          offset: Offset(5, 3),
                          color: Colors.black12
                        )
                       ]
                      ),
                      child: Center(child: Text("Save",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                                  ],
                                ),
                              ),
                             ),
                      ));
                    },
                           child: Container(
                                          margin: EdgeInsets.only(top: 6,right: 20,left: 20,bottom: 12),
                                               padding: EdgeInsets.only(right: 12,top:12,bottom: 20,left: 12),
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(166, 255, 255, 255),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(3, 5), color: Colors.black12)
                                ]),
                            child: ListTile(
                              title: Text("   Language",style:  TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                                    leading: Icon(Icons.language,size: 35,color: Colors.black,),
                                ),
                                                 ),
                         ),
                        
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.01
                        ),
                   
                        
                        
                   
                        ],
                      ),
        )
    );
  }
}