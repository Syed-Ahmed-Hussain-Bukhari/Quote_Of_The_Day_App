import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/homepage.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  TextEditingController searchController=TextEditingController();
  Icon favorite_icon=Icon(Icons.favorite,color: Colors.red,size: 30,);
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
                  child: TextFormField(
                    controller: searchController,
                    cursorColor: Colors.black,
                    onChanged: (String value) {
                      setState(() {
                        
                      });
                    },
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
                        child: Text("Favourite",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
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
            child:StreamBuilder(stream: FirebaseFirestore.instance.collection("favourite").snapshots(),
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
                       var searchData=snapshot.data!.docs[index]["favourite_quote"].toString();
                       if(searchData.toLowerCase().toString().contains(searchController.text.toLowerCase().toString())){
                              return Center(
                     child: Container(
                     margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.25,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 12),
                            child: Text(snapshot.data!.docs[index]["favourite_quote"].toString()
                              ,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 25),
                            child: Text(
                              snapshot.data!.docs[index]["favourite_author"].toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: ()async{
                                    var id=snapshot.data!.docs[index].id;
                                    await FirebaseFirestore.instance.collection("favourite").doc(id).delete();
                                                    },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: favorite_icon
                                ),
                              )
                            ],
                          )
                          
                        ],
                      )),
                         );
                       
                       }
                       else if(searchController.text.toString().isEmpty){
                        return Center(
                     child: Container(
                     margin: EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.25,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 12),
                            child: Text(snapshot.data!.docs[index]["favourite_quote"].toString()
                              ,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 12, top: 25),
                            child: Text(
                              snapshot.data!.docs[index]["favourite_author"].toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: ()async{
                                    var id=snapshot.data!.docs[index].id;
                                    await FirebaseFirestore.instance.collection("favourite").doc(id).delete();
                                                    },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  child: favorite_icon
                                ),
                              )
                            ],
                          )
                          
                        ],
                      )),
                         );
                       }
                         
                         

                    });
                    
                    }
                    
              return Container();
            },
            )
        )
    );
  }
}