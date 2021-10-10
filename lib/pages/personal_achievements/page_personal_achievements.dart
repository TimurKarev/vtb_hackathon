// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Personal_Achievements extends StatefulWidget {
  Personal_Achievements({Key? key}) : super(key: key);

  @override
  PpersonalAachievementsState createState() => PpersonalAachievementsState();
}

class PpersonalAachievementsState extends State<Personal_Achievements> {
  @override
  Widget build(BuildContext context) {
    double otstup = 30;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            // scrollDirection: Axis.vertical,
            children: <Widget>[
              //TabBar - заголовок, какие то доп вещи, может монетки
              Container(
                height: 50,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            // Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Достижения",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 28),
                          ),
                        )),
                  ],
                ),
              ),
              // SizedBox(height: otstup,),



              //User profile
              Container(
                margin: EdgeInsets.all(20),
                // padding: EdgeInsets.all(30),
                height: 200,
                // width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                        // height: 150,
                        // width: 150,
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        // padding: EdgeInsets.only(left: 30),
                        // decoration: new BoxDecoration(
                        //   color: Colors.green,
                        //   border: Border.all(color: Colors.black, width: 0.0),
                        //   borderRadius:
                        //       new BorderRadius.all(Radius.elliptical(100, 100)),
                        // ),
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ClipOval(                             
                              child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAavrFS-6QFNV0SuXicYkZSwEeEZ4BkxEi-JsRv3eUJ3dEfDybutG6w4vbST04Yu9EGM8&usqp=CAU'),
                            ),
                          ),
                        )
                        //       FittedBox(
                        //           fit: BoxFit.fill,
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.all(Radius.circular(10.0)),//add border radius here
                        //           child: Image.network(
                        // 'https://avatars.mds.yandex.net/get-ott/374297/2a000001616b87458162c9216ccd5144e94d/678x380'),
                        //         ),
                        //       ),
                        ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 40),
                            child: Text(
                              "Пользователь",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(fontSize: 28),
                            ),
                          ),
                          Spacer(),
                          Container(
                              padding: EdgeInsets.only(bottom: 40),
                              child: RichText(
                                  text: TextSpan(
                                      children: [TextSpan(text: "Ваш опыт : ", style:TextStyle(fontSize: 24,   color: Colors.black),), 
                                      TextSpan(text:"500", style:TextStyle(fontSize: 24,   color: Colors.green), )]))
                              // Text(
                              //   "Ваш опыт: 500",
                              //   overflow: TextOverflow.ellipsis,
                              //   maxLines: 1,
                              //   style: TextStyle(fontSize: 24),
                              // ),
                              ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  // image: ,
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    // BoxShadow(color: Colors.grey, spreadRadius: 3),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: otstup,
              ),
              // Тело
              _widgetType(context, "За храбрость"),
              SizedBox(
                height: otstup,
              ),
              _widgetType(context, "Скорость прохождения"),
              // SizedBox(height: otstup,),
              // _widgetType(context, "Посхалки"),
              // SizedBox(height: otstup,),
              // _widgetType(context, "Сложность"),
              // Container(
              //   // height: 250,
              //   child: Expanded(
              //       child: Padding(
              //         padding: EdgeInsets.only(left: 45),
              //         child: ListView.separated(
              //           // scrollDirection: Axis.horizontal,
              //           shrinkWrap: true,
              //           separatorBuilder: (_, inex) => SizedBox(
              //             height: 5,
              //           ),
              //           itemCount: 4,
              //           itemBuilder: (context, index) {
              //             return _itemList(context, index);
              //           },
              //         ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetType(BuildContext context, String titleType) {
    return Container(
      height: 220,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              titleType,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              separatorBuilder: (_, inex) => SizedBox(
                width: 6,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(
                    width: 50,
                  );
                }
                return _itemList(context, index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 90,
          width: 250,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            //TODO:
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              // BoxShadow(color: Colors.grey, spreadRadius: 3),
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 180,
                child:
              // Container(
              //   alignment: Alignment.center,
                // padding: EdgeInsets.all(15),
                // child:
          // Expanded(
          //         width: 100,
          //         height: 140,
          //         child:
              FittedBox(
                      fit: BoxFit.fill,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30), topLeft: Radius.circular(30)),
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjKUOTmLXzhpx-Tk060TJWL9LPqvM935dxjA&usqp=CAU'
                        ),
                      )),
                  // decoration: BoxDecoration(
                  //   //TODO:
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(10),
                  //   boxShadow: [
                  //     // BoxShadow(color: Colors.grey, spreadRadius: 3),
                  //     BoxShadow(
                  //       color: Colors.grey.withOpacity(0.5),
                  //       spreadRadius: 5,
                  //       blurRadius: 7,
                  //       offset: Offset(0, 3), // changes position of shadow
                  //     ),
                  //   ],
                  // ),
                // ),
              // )
              )
              ,
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Заголовок",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Пояснение",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              "XP",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green),
                            ),
                          ),
                          // SizedBox(width: 5,),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "200",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
