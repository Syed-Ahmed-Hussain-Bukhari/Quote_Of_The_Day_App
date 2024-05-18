import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/homepage.dart';

class MyQuote extends StatefulWidget {
  const MyQuote({super.key});

  @override
  State<MyQuote> createState() => _MyQuoteState();
}

class _MyQuoteState extends State<MyQuote> {
  TextEditingController searchController=TextEditingController();
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
                    onChanged: (value){
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
                        child: Text("My Quotes",style:  TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),)),
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
            child:StreamBuilder(stream: FirebaseFirestore.instance.collection("QuoteCreator").snapshots(),
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
                        
                        var searchData=snapshot.data!.docs[index]["quote"].toString();
                        if(searchController.text.toString().isEmpty){
                              return Container(
                         margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(right: 12,top:12,bottom: 60,left: 12),
                          width: MediaQuery.of(context).size.width * 0.9,
                          
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
                                child: Text(snapshot.data!.docs[index]["quote"].toString()
                                  ,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12, top: 25),
                                child: Text(
                                  snapshot.data!.docs[index]["author"].toString(),
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                               Container(
                              padding: EdgeInsets.only(left: 12, top: 25),
                              child: Text(
                                snapshot.data!.docs[index]["time"].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                    
                              ),
                              
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: ()async{
                                        var id=snapshot.data!.docs[index].id;
                                        await FirebaseFirestore.instance.collection("QuoteCreator").doc(id).delete();
                            
                                    },
                                    child: Container(
                                      child: Icon(Icons.delete,size: 35,)),
                                  ),
                                  SizedBox(width: 15,),
                                  InkWell(
                                    onTap: ()async{
                                        var id=snapshot.data!.docs[index].id;
                                        await FirebaseFirestore.instance.collection("QuoteCreator").doc(id).delete();
                            
                                    },
                                    child: Container(
                                      child: Icon(Icons.share,size: 35,)),
                                  )
                                ],
                              ),
                            )
                              
                            ],
                          ));
                         
                        }
                        else if (searchData.toLowerCase().toString().contains(searchController.text.toLowerCase().toString())){
                           return Container(
                         margin: EdgeInsets.all(20),
                         padding: EdgeInsets.only(right: 12,top:12,bottom: 60,left: 12),
                         width: MediaQuery.of(context).size.width * 0.9,
                          
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
                                child: Text(snapshot.data!.docs[index]["quote"].toString()
                                  ,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 12, top: 25),
                                child: Text(
                                  snapshot.data!.docs[index]["author"].toString(),
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),
                               Container(
                              padding: EdgeInsets.only(left: 12, top: 25),
                              child: Text(
                                snapshot.data!.docs[index]["time"].toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                    
                              ),
                              
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: ()async{
                                        var id=snapshot.data!.docs[index].id;
                                        await FirebaseFirestore.instance.collection("QuoteCreator").doc(id).delete();
                            
                                    },
                                    child: Container(
                                      child: Icon(Icons.delete,size: 35,)),
                                  ),
                                  SizedBox(width: 15,),
                                  InkWell(
                                    onTap: ()async{
                                        var id=snapshot.data!.docs[index].id;
                                        await FirebaseFirestore.instance.collection("QuoteCreator").doc(id).delete();
                            
                                    },
                                    child: Container(
                                      child: Icon(Icons.share,size: 35,)),
                                  )
                                ],
                              ),
                            )
                              
                            ],
                          ));
                         
                        }
                         

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