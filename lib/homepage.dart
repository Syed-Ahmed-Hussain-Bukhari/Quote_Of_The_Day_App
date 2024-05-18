import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quote_app/MyQuote.dart';
import 'package:quote_app/favouritePage.dart';
import 'package:quote_app/feedback.dart';
import 'package:quote_app/notification.dart';
import 'package:quote_app/profile.dart';
import 'package:quote_app/quoteCreator.dart';
import 'package:quote_app/quotes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var index=0;
  Icon favourite_icon=Icon(Icons.favorite_border_outlined,size: 40,);
  bool  chect_favourite_icon=true;
 var quote;
  var author;
  var time=DateTime.now();

  var data;
   Future<void> getApi() async{
    final respnonse=await http.get(Uri.parse("https://api.quotable.io/quotes"));
    if(respnonse.statusCode==200){
      data=jsonDecode(respnonse.body.toString());
     
    }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme:const  IconThemeData(
              size: 40,//change size on your need
              color: Colors.black,//change color on your need
            ),
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Color.fromARGB(255, 207, 102, 225),
                Color.fromARGB(255, 97, 164, 219)
              ]),
            ),
          ),
        ),

        endDrawer: Drawer(
          
          child:  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 188, 113, 201),
                  Color.fromARGB(255, 125, 187, 238)
                ],
              ),
            ),
            child: ListView(
              children: [
                 DrawerHeader(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 37),
                        child: Text(
                          'Syed Ahmed',
                          style: TextStyle(
                            color: Color.fromARGB(166, 255, 255, 255),
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 125, 187, 238),
                        radius: 55,
                        child: Image(image: AssetImage("assets/images/5f52d08382f4134fab4bc18c_consultant-brand-brixtemplates-removebg-preview.png"),fit: BoxFit.fill,),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    
                  ),
                ),
          
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyQuote()));
                    },
                    child: ListTile(
                    title: const Text(
                          'My Quote',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black,),
                        ),
                        leading: Icon(Icons.person_2_outlined,size: 28,color: Colors.black,),
                                  ),
                  ),
                 InkWell(
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QuoteCreator()));
                    },
                   child: ListTile(
                    title: const Text(
                          "Quotes Creator",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.draw_sharp,size: 28,color: Colors.black,),
                                 ),
                 ),
                
                InkWell(
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FavouritePage()));
                    },
                  child: ListTile(
                    title: const Text(
                          'Favourite',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.favorite,size: 28,color: Colors.black,),
                  ),
                ),
                InkWell(
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QuotePage()));
                    },
                  child: ListTile(
                    title: const Text(
                          'Daily Quotes',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black,),
                        ),
                        leading: Icon(Icons.format_quote,size: 28,color: Colors.black,),
                  ),
                ),
                InkWell(
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const FeedbackPage()));
                    },
                  child: ListTile(
                    title: const Text(
                          'Feedback',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.feedback,size: 28,color: Colors.black,),
                  ),
                ),
                InkWell(
                  onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const notificationPage()));
                    },
                  child: ListTile(
                    title: const Text(
                          'Notification',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.notifications,size: 35,color: Colors.black,),
                  ),
                ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));

                    },
                    child: ListTile(
                    title: const Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.person,size: 28,color: Colors.black),
                                  ),
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 28, top: 12),
                      child: const Text(
                        'Quote of the Day',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Container(
                  child: Expanded(child: FutureBuilder(future: getApi(), builder: (context,snapshot){
                    
                    if(snapshot.connectionState==ConnectionState.waiting){
                                    
                      return CircularProgressIndicator(
                         color:Color.fromARGB(255, 207, 102, 225),
                        backgroundColor: Color.fromARGB(255, 97, 164, 219),
                        
                        
                      );
                    
                    } 
                   
                   return Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(166, 255, 255, 255),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(3, 5), color: Colors.black12)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                child: Image.network("https://th.bing.com/th/id/R.8cd5230dae45e046638270be53f1339a?rik=G%2b9ms3f4Ao2LaA&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_532719.png&ehk=2TkunpSDjDF%2fLd9Yp8u1KkWWvavG6Y8Xq3EI1tdvlkg%3d&risl=&pid=ImgRaw&r=0",scale: 45,)
                                
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12, top: 12),
                              child: Text(
                               data["results"][index]["content"].toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12, top: 25),
                              child: Text(
                                data["results"][index]["author"].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                    
                              ),
                              
                            ),
                          ],
                        )),
                  );
                  
                  }
                  
                  )
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {

                          index=index+1;
                          if(20==index){
                            index=0;
                          }
                          favourite_icon=Icon(Icons.favorite_border_outlined,size: 40,);
                          chect_favourite_icon=false;
                          if(chect_favourite_icon){
                              favourite_icon=Icon(Icons.favorite,size: 40,);
                              
                         }
                         else{
                          favourite_icon=Icon(Icons.favorite_border_outlined,size: 40,);
                          chect_favourite_icon=true;
                         }
                          setState(() {
                            
                          });
                        },
                        icon: Icon(
                          Icons.refresh_outlined,
                          size: 45,
                        )),
                    IconButton(
                        onPressed: () async{
                         if(chect_favourite_icon){
                            favourite_icon=Icon(Icons.favorite,size: 40,);
                            quote=data["results"][index]["content"].toString();
                            author=data["results"][index]["author"].toString();
                                
                            await FirebaseFirestore.instance.collection("favourite").doc().set({
                              "favourite_quote":quote.toString(),
                              "favourite_author":author.toString(),
                        }).then((value)async => await FirebaseFirestore.instance.collection("Notification").doc().set({
                             "notification":"Your new favorite quote has been successfully added!",
                              "time":DateFormat("HH:mm a").format(time).toString()
                        }));
                              chect_favourite_icon=false;
                         }
                         else{
                          favourite_icon=Icon(Icons.favorite_border_outlined,size: 40,);
                             
                            await FirebaseFirestore.instance.collection("favourite").doc().delete();

                          chect_favourite_icon=true;
                         }
                        
                          setState(() {
                            
                          });
                        },

                        icon:favourite_icon 
                        ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          size: 40,
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.005,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(166, 255, 255, 255),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(offset: Offset(3, 5), color: Colors.black12)
                      ]),
                )
              ],
            )));
  }
}
