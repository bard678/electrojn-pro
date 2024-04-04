

import 'package:bluetooth/main.dart';
import 'package:bluetooth/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> themes=["Green theme","Yellow theme","Blue theme","Red theme","Pink theme"];
  List<String> title=["Confirmation on exit","Change language","Change theme"];
  List<String> supTitle=["Asking before exiting","Choose your own language","customise theme"];
  List<IconData> icons=[Icons.exit_to_app,Icons.language,Icons.room_preferences_outlined];
  int radio=0;
  bool checked=false;
  bool ask=false;
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.to(()=>BluetoothDev());
        }, icon: Icon(Icons.arrow_back)),
        title: Text("Settings"),
        // backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child:

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("Application preferences",style: TextStyle(color: Theme.of(context).primaryColor),),
              ),
              Container(

                height: MediaQuery.of(context).size.height-AppBar().preferredSize.height-40,
                child: ListView.builder(itemCount: title.length,itemBuilder: (context,i){

                  return Column(
                    children: [
                      ListTile(
                        trailing:i==0? Checkbox(
                            activeColor: Colors.green,
                            value: checked, onChanged: (v){setState(() {
                          checked=v!;
                        });}):SizedBox(),
                        onTap: (){
                          if(i==2){
                          Get.defaultDialog(
                            title: "Choose theme",
                            content: SizedBox(
                              height: 300,
                              width: 200,
                              child: ListView.builder(
                                itemCount: themes.length,
                                  itemBuilder: (b,i){
                              return  Column(
                                children: [
                                  ListTile(
                                    leading: Container(width: 40,height:40,color:isDark0? darkThemeData[i].primaryColorDark:lightThemeData[i].primaryColor,),
                                    onTap:(){

                                     //TODO CHOOSE THEME
                                      if(i==0){
                                        if(isDark0){   Get.changeTheme(darkGreenTheme);
                                        ThemeController().toggleTheme(true,0);}
                                      else{  Get.changeTheme(lightGreenTheme);
                                        ThemeController().toggleTheme(false,0);}
                                      Get.back();
                                      }

                                      if(i==1){
                                        if(isDark0){   Get.changeTheme(darkYellowTheme);
                                        ThemeController().toggleTheme(true,1);}
                                        else{  Get.changeTheme(lightYellowTheme);
                                        ThemeController().toggleTheme(false,1);

                                        }
                                        Get.back();
                                      } if(i==2){
                                        if(isDark0){   Get.changeTheme(darkBlueTheme);
                                        ThemeController().toggleTheme(true,2);}
                                        else{  Get.changeTheme(lightBlueTheme);
                                        ThemeController().toggleTheme(false,2);}
                                        Get.back();
                                      }if(i==2){
                                        if(isDark0){   Get.changeTheme(darkBlueTheme);
                                        ThemeController().toggleTheme(true,2);}
                                        else{  Get.changeTheme(lightBlueTheme);
                                        ThemeController().toggleTheme(false,2);}
                                        Get.back();
                                      }
                                    },
                                    title: Text(themes[i]),),
                                  Divider(height: 2,)
                                ],
                              );
                              }),
                            )
                          );
                          }

                        },
                        leading: Icon(icons[i]),
                        title: Text(title[i]),subtitle: Text(supTitle[i]),),
                      Divider(
                        height: 2,
                      )
                    ],
                  );
                }),
              )
            ],

          ),
        ),
      ),
    );
  }
}