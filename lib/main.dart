import 'dart:async';
import 'dart:convert';

import 'package:bluetooth/settings.dart';
import 'package:bluetooth/themes.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
int index=0;
bool isDark0=false;
class ThemeController extends GetxController {

  void toggleTheme(bool _dark,int i) {
    isDark0=_dark;
    index=i;
BluetoothDev();

  }
}
BluetoothDevice _device=BluetoothDevice(address: "address");
List<BluetoothDevice> _list=[];
class Controller extends GetxController{
  void connect(BluetoothDevice device){
    _device=device;
  }
}

void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return    GetMaterialApp(
        theme: lightThemeData[0],
        debugShowCheckedModeBanner: false,
        home:BluetoothDev()
    );
  }
}

class BluetoothDev extends StatefulWidget {

  BluetoothDev({super.key});

  @override
  State<BluetoothDev> createState() => _BluetoothDevState();
}

class _BluetoothDevState extends State<BluetoothDev> {
  @override
  void initState(){
    //TODO initState
    // storage();
    super.initState();
    check();
    get();
  }
  void storage()async{

    if(box.read("key")){
      isDark=true;

      Get.changeTheme(ThemeData.dark());

    }else {
      Get.changeTheme(ThemeData.light());
      isDark=true;

    }

  }
  void check(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      iss();
    });
  }
  List<BoxShadow> _boxDark=[ BoxShadow(
    // color:Colors.black87 ,
      color:Color.lerp(Colors.white,Colors.grey, 0.2)! ,
      offset: Offset(3, 3),
      spreadRadius: 1
      ,blurRadius: 0.5

  ), BoxShadow(  spreadRadius: 3,
      // color: Colors.white70,
      color:Colors.black45,

      offset: Offset(-3, -3)
  ),];
  List<BoxShadow> _boxLight=[ BoxShadow(
    // color:Colors.black87 ,
      color:Color.lerp(Colors.white,Colors.grey, 0.7)! ,
      offset: Offset(3, 3),
      spreadRadius: 1
      ,blurRadius: 0.5

  ), BoxShadow(  spreadRadius: 3,
      // color: Colors.white70,
      color:Colors.white54,

      offset: Offset(-3, -3)
  )];
  bool d1=false;
  bool d2=false;
  bool d3=false;
  bool d4=false;
  bool d5=false;
  int tapIndex=0;
  int popMenuIndex=0;
  double ledValue=0;
  double fanValue=0;
  double lampValue=0;
  double bedRoomLampValue=0;
  double corridorLampValue=0;
  double deskLampValue=0;
  bool lamp=false;
  bool lamp1=false;
  bool lamp2=false;

  bool bedRoomLamp=false;
  bool bedRoomLamp1=false;
  bool bedRoomLamp2=false;

  bool corridorLamp=false;
  bool corridorLamp1=false;
  bool corridorLamp2=false;

  bool deskLamp=false;
  bool deskLamp1=false;
  bool deskLamp2=false;

  bool tv=false;
  bool air=false;

  bool bedRoomTv=false;
  bool bedRoomAir=false;

  bool corridorTv=false;
  bool corridorAir=false;
  GetStorage box=GetStorage();

  bool deskTv=false;
  bool deskAir=false;


  Color dark=Colors.black45;
  Color light=Colors.white10;

  BluetoothConnection? _connection;
  bool connected=false;
  bool isDark = isDark0;
  late List<BluetoothDevice> bluetoothList;
  // Future pref()async{
  //   preferences=await SharedPreferences.getInstance();
  //   if(preferences.getBool("key")!)
  //   {
  //     _data=ThemeData.dark();
  //   }
  //   else if(preferences.getBool("key")!!){
  //     _data=ThemeData.light();
  //   }
  // }
  Future connectTo(BluetoothDevice device)async{

    try {
      _connection = await BluetoothConnection.toAddress(device.address);
    } catch(e){
      print(e);
    }



  }
  Future sendMesseges(String messeges)async{
    _connection?.output.add(utf8.encode(messeges));
  }
  Future<List<BluetoothDevice>> get()async{
    await FlutterBluetoothSerial.instance.requestEnable();
    try{
      bluetoothList =await FlutterBluetoothSerial.instance.getBondedDevices();

    }catch(e){print(e);}
    return bluetoothList;
  }
  Future iss()async{
    bool? isEnable=await FlutterBluetoothSerial.instance.isEnabled;
    isEnabled=isEnable!;
  }
  bool isEnabled=false;
  @override
  Widget build(BuildContext context) {

    List<Widget> tapSellector=[
      SingleChildScrollView(

        child: Column(
          children: [
            SizedBox(height: 30,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){

                        setState(() {
                          if(d1){
                            //TODO send via bluetooth
                            sendMesseges("Stop");
                            d1=false;
                          }else {
                            d1 = true;
                            sendMesseges("a");
                          }
                        });},
                      child: Container(
                        child: Center(child: Text(d1?"ON":"OFF",style: TextStyle(fontSize: 30,color:d1? Colors.green:Colors.red,fontWeight: FontWeight.bold),)),
                        width: 150,
                        height: 60,
                        decoration:  BoxDecoration(
                            boxShadow:isDark? _boxDark:_boxLight
                        ),),

                    ),
                    GestureDetector(
                      onTap: (){setState(() {
                        if(d2){d2=false;}else d2=true;
                      });},
                      child: Container(
                        child: Center(child: Text(d2?"ON":"OFF",style: TextStyle(fontSize: 30,color:d2? Colors.green:Colors.red,fontWeight: FontWeight.bold),)),
                        width: 150,
                        height: 60,
                        decoration:  BoxDecoration(
                            boxShadow:isDark? _boxDark:_boxLight
                        ),),
                    ),

                  ],
                ),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){setState(() {
                        if(d3){d3=false;}else d3=true;
                      });},
                      child: Container(
                        child: Center(child: Text(d3?"ON":"OFF",style: TextStyle(fontSize: 30,color:d3? Colors.green:Colors.red,fontWeight: FontWeight.bold),)),
                        width: 150,
                        height: 60,
                        decoration:  BoxDecoration(
                            boxShadow:isDark? _boxDark:_boxLight
                        ),),

                    ),
                    GestureDetector(
                      onTap: (){setState(() {
                        if(d4){d4=false;}else d4=true;
                      });},
                      child: Container(
                        child: Center(child: Text(d4?"ON":"OFF",style: TextStyle(fontSize: 30,color:d4? Colors.green:Colors.red,fontWeight: FontWeight.bold),)),
                        width: 150,
                        height: 60,
                        decoration:  BoxDecoration(
                            boxShadow:isDark? _boxDark:_boxLight
                        ),),
                    ),

                  ],
                ),
                SizedBox(height: 50,),
                Column(
                  children: [
                    Text("Led brightness",style: TextStyle(fontSize: 25),),
                    Slider(
                        activeColor: Color.lerp(Colors.red, Colors.green, ledValue),
                        value: ledValue, onChanged: (v){setState(() {
                      ledValue=v;
                    });}),
                    SizedBox(width: 50,),
                    Text("Fan speed",style: TextStyle(fontSize: 25),),
                    Slider(
                        activeColor: Color.lerp(Colors.red, Colors.green, fanValue),
                        value: fanValue, onChanged: (v){setState(() {
                      fanValue=v;
                      print(fanValue);
                    });}),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(lamp){lamp=false;}
                    else{
                      lamp=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:lamp? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(lamp1){lamp1=false;}
                    else{
                      lamp1=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:lamp1? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(lamp2){lamp2=false;}
                    else{
                      lamp2=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:lamp2? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
            ],
          )
          ,SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(tv){tv=false;}
                    else{
                      tv=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:tv? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("TV"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(air){air=false;}
                    else{
                      air=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:air? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 150,
                    height: 50,
                    child: Center(child: Text("Air conditioner"))),
              ),

            ],
          ),
          SizedBox(height: 40,),
          Text("Lamp brightness",style: TextStyle(fontSize: 20),),
          Slider(
              activeColor: Color.lerp(Colors.red, Colors.green, lampValue),
              value: lampValue, onChanged: (v){setState(() {
            lampValue=v;
          });})

        ],),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(bedRoomLamp){bedRoomLamp=false;}
                    else{
                      bedRoomLamp=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:bedRoomLamp? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(bedRoomLamp1){bedRoomLamp1=false;}
                    else{
                      bedRoomLamp1=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:bedRoomLamp1? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(bedRoomLamp2){bedRoomLamp2=false;}
                    else{
                      bedRoomLamp2=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:bedRoomLamp2? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
            ],
          )
          ,SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(bedRoomTv){bedRoomTv=false;}
                    else{
                      bedRoomTv=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:bedRoomTv? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("TV"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(bedRoomAir){bedRoomAir=false;}
                    else{
                      bedRoomAir=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:bedRoomAir? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 150,
                    height: 50,
                    child: Center(child: Text("Air conditioner"))),
              ),

            ],
          ),
          SizedBox(height: 40,),
          Text("Lamp brightness",style: TextStyle(fontSize: 20),),
          Slider(
              activeColor: Color.lerp(Colors.red, Colors.green, bedRoomLampValue),
              value: bedRoomLampValue, onChanged: (v){setState(() {
            bedRoomLampValue=v;
          });})

        ],),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(corridorLamp){corridorLamp=false;}
                    else{
                      corridorLamp=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:corridorLamp? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(corridorLamp1){corridorLamp1=false;}
                    else{
                      corridorLamp1=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:corridorLamp1? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(corridorLamp2){corridorLamp2=false;}
                    else{
                      corridorLamp2=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:corridorLamp2? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
            ],
          )
          ,SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(corridorTv){corridorTv=false;}
                    else{
                      corridorTv=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:corridorTv? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("TV"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(corridorAir){corridorAir=false;}
                    else{
                      corridorAir=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:corridorAir? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 150,
                    height: 50,
                    child: Center(child: Text("Air conditioner"))),
              ),

            ],
          ),
          SizedBox(height: 40,),
          Text("Lamp brightness",style: TextStyle(fontSize: 20),),
          Slider(
              activeColor: Color.lerp(Colors.red, Colors.green, corridorLampValue),
              value: corridorLampValue, onChanged: (v){setState(() {
            corridorLampValue=v;
          });})

        ],),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(deskLamp){deskLamp=false;}
                    else{
                      deskLamp=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:deskLamp? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(deskLamp1){deskLamp1=false;}
                    else{
                      deskLamp1=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:deskLamp1? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(deskLamp2){deskLamp2=false;}
                    else{
                      deskLamp2=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:deskLamp2? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("Lamp"))),
              ),
            ],
          )
          ,SizedBox(height: 50,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(deskTv){deskTv=false;}
                    else{
                      deskTv=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:deskTv? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 100,
                    height: 50,
                    child: Center(child: Text("TV"))),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(deskAir){deskAir=false;}
                    else{
                      deskAir=true;
                    }
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        color:deskAir? Colors.green:Colors.red ,
                        border: Border.all(width: 4,color: Color.lerp(Colors.grey, Colors.white, 0.2)!)
                    ),

                    width: 150,
                    height: 50,
                    child: Center(child: Text("Air conditioner"))),
              ),

            ],
          ),
          SizedBox(height: 40,),
          Text("Lamp brightness",style: TextStyle(fontSize: 20),),
          Slider(
              activeColor: Color.lerp(Colors.red, Colors.green, deskLampValue),
              value: deskLampValue, onChanged: (v){setState(() {
            deskLampValue=v;
          });})

        ],),


    ];
    return  DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: AppBar(
            leading: PopupMenuButton<int>(
                onSelected: ( v){
                  setState(() {
                    popMenuIndex=v ;
                  });
                  if(popMenuIndex==0){
                    // TODO :get .
                    Get.to(()=>SettingsScreen());

                    box.write("key", true);
                  }
                },
                child: Icon(Icons.more_vert),
                itemBuilder: (itemBuilder)=>[
                  PopupMenuItem(
                      value:0 ,
                      child: Text("Settings")),
                  PopupMenuItem(

                      child: Text("User Manual ")),
                  PopupMenuItem(child: Text("About")),

                ]),
            bottom:TabBar(
                labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                onTap: (v){
                  setState(() {
                    tapIndex=v;
                  });
                },
                unselectedLabelColor: Colors.black38,
                labelColor: Color.lerp(Colors.green, Colors.black, 0.2),
                indicatorColor: Color.lerp(Colors.green, Colors.black, 0.2),
                isScrollable: true,
                tabs: [
                  Tab(text: "Home",),
                  Tab(text: "Living room",),
                  Tab(text: "Bedroom",),
                  Tab(text: "Corridor",),
                  Tab(text: "Desk ",),

                ]) ,

            // backgroundColor: Color.lerp(Colors.blue, Colors.black, 0.2),
            actions: [
              IconButton(onPressed: (){

                //TODO getTheme
                if(isDark){
                  Get.changeTheme(lightThemeData[index]);
                  isDark=false;
                  isDark0=isDark;
                  box.write("key", false);
                  setState(() {

                  });
                }

                else {

                  Get.changeTheme(darkThemeData[index]);
                  isDark=true;
                  isDark0=isDark;
                  box.write("key", true);
                  setState(() {

                  });
                }
              }, icon: Icon(isDark? Icons.dark_mode_outlined:Icons.light_mode_outlined,)),

              IconButton(onPressed: ()async{
                await  get();
                Get.defaultDialog(
                  titleStyle: TextStyle(color: Theme.of(context).primaryColorDark ),
                  title:"Bluetooth",
                  radius: 0,
                  actions: [TextButton(onPressed: (){FlutterBluetoothSerial.instance.openSettings();}, child: Text("Open Settings",style: TextStyle(color:  Theme.of(context).primaryColorDark,fontSize: 20),))],
                  content:
                  SizedBox(height: 400,
                    //TODO list
                    child:
                    ListView.builder(
                        itemCount: bluetoothList.length,
                        itemBuilder: (b,index)=>Column(
                          children: [
                            ListTile(
                              onTap: ()async{
                                _list=bluetoothList;
                                if(bluetoothList[index].isConnected){
                                  Controller().connect(bluetoothList[index]);
                                }
                                else{  await    connectTo(bluetoothList[index]);
                                Controller().connect(bluetoothList[index]);

                                Get.back();}


                                if(bluetoothList[index].isConnected) {
                                  Get.back();
                                }
                              },
                              title: Text(bluetoothList[index].name!),subtitle: Text(bluetoothList[index].address!,style: TextStyle(color: bluetoothList[index].isConnected?Colors.green:Colors.red),) ,),
                            Divider(height: 2,)
                          ],
                        )),
                  ),
                );

              }, icon: const Icon(Icons.bluetooth))
            ],
            title: const Text('ElectroJN',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          body: Column(
            children: [
              tapSellector[tapIndex],
              SizedBox(height: 30,),
              Text(isEnabled?_device.isConnected?"Connected":"Disconnected":"Bluetooth off",style: TextStyle(fontSize: 20,color:isEnabled? Colors.green:Colors.red,fontWeight: FontWeight.bold),)
            ],
          )
      ),

    );
  }
}
