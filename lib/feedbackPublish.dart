import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quote_app/feedback.dart';
import 'package:quote_app/homepage.dart';

class FeedbackSumbitPage extends StatefulWidget {
  const FeedbackSumbitPage({super.key});

  @override
  State<FeedbackSumbitPage> createState() => _FeedbackSumbitPageState();
}

class _FeedbackSumbitPageState extends State<FeedbackSumbitPage> {
  var time=DateTime.now();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  var experienceController;
  TextEditingController feedbackController=TextEditingController();
 
  
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FeedbackPage()));
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
                          
                                Title(color: Colors.black, child: Container(
                        // margin: EdgeInsets.only(left: 22),
                        child: Text("Feedback",style:  TextStyle(fontSize: 35,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ),

                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),

                    Container(
                  margin: EdgeInsets.all(0),
                  child: TextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            hintText: "  Enter your username",
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
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Container(
                  margin: EdgeInsets.all(0),
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black,
                          style:TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold), 
                          decoration: InputDecoration(
                            hintText: "  Enter your email",
                            hintStyle: TextStyle(fontSize: 16,color: Colors.black),
                            prefixIcon: Icon(Icons.email_outlined,color: Colors.black,size: 24,),
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
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Row(
                    children: [
                      Container(
                            margin: EdgeInsets.only(left: 2),
                            child: Text("How was your Experience?",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
                    ],
                  ),
              SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),

              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.12),
                    child: AnimatedRatingStars(
                          initialRating: 1,
                          minRating: 0.0,
                          maxRating: 5.0,
                          filledColor: Colors.amber,
                          emptyColor: Colors.black,
                          filledIcon: Icons.star,
                          halfFilledIcon: Icons.star_half,
                          emptyIcon: Icons.star_border,
                          onChanged: (double rating) {
                            // Handle the rating change here
                            experienceController=rating.toString();
                            print(experienceController);
                          },
                          displayRatingValue: true,
                          interactiveTooltips: true,
                          customFilledIcon: Icons.star,
                          customHalfFilledIcon: Icons.star_half,
                          customEmptyIcon: Icons.star_border,
                          
                          starSize: 50.0,
                          animationDuration: Duration(milliseconds: 300),
                          animationCurve: Curves.easeInOut,
                          readOnly: false,
                        ),
                  ),
                ],
              ),
                            
                 SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),             

                TextFormField(
                  maxLines: 5,
                  maxLength: 1052,
                  
                  controller: feedbackController,
                  cursorColor: Colors.black,
                        style:TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold), 
                        decoration: InputDecoration(                            
                     counterStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),
                          // contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                          hintText: " Add your comments...",
                          hintStyle: TextStyle(fontSize: 16,color: Colors.black),
                          
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
                      SizedBox(height: 20,),
                      GestureDetector(
                  onTap: ()async{
                    
                    await FirebaseFirestore.instance.collection("feedback").doc().set({
                      "name":nameController.text.toString(),
                      "email":emailController.text.toString(),
                      "experience":experienceController.toString(),
                      "userFeedback":feedbackController.toString(),
                      "time":DateFormat("HH:mm a").format(time).toString()
                      
                    }).then((value) async => await FirebaseFirestore.instance.collection("Notification").doc().set({
                      "notification":"Your Feedback has been successfully sumbit!",
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
                        child: Text("Your Feedback has been successfully sumbit!",style:  TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)),
                    )
                              ],
                            ),
                          ),
                        ),
                      )))
                     .then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FeedbackPage())));
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
                    child: Center(child: Text("Sumbit",style:  TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),),
                  ),
                )
                
                              ],
                            ),
                          ),
        
    );
  }
}