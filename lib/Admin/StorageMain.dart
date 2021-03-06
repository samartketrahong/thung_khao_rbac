import 'package:flutter/material.dart';
import 'package:thung_khao_rbac/Admin/AdminMain.dart';
import 'package:thung_khao_rbac/Admin/StorageDetail.dart';
import 'package:thung_khao_rbac/Admin/Widget/BottonNavigationBarAdminWidget.dart';
import './Widget/StorageMainWidget.dart';
class StorageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StorageStatus();
  }
}

class StorageStatus extends State<StorageMain> {

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>AdminMain())),
      child: Scaffold(
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.white,
            child: MenuNavigation(),
          ),
          body: Container(
            margin: MediaQuery.of(context).padding,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Color.fromRGBO(42, 64, 87, 5),
                  child: Row(
                    children: [
                      BackButton(
                        color: Colors.white,

                      ),
                      ProductText(),
                    ],
                  ),
                ),

                //---------------//
                Flexible(
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("res/BackgroundShop.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(child: FutureBuilder(future: Future.value(true),builder: (context,snapshost){
                        if(snapshost.hasData){
                          List<Widget> list =[];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index)  {
                              list.clear();
                              if (index % 2 == 0) {
                                if (index < 10) {
                                  list.add(Flexible(
                                    child: ProductItem(
                                      goToDetail: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StorageDetail()));
                                      },
                                      name: '????????????????????? ????????????????????? ???????????? 100000 ????????????????????????',
                                      price:'1022',
                                      num: '1000',
                                      imageUrl:'http://128.199.110.176:8080/upload/img/8images.jpeg',
                                    ),
                                  ));
                                }
                                if (index + 1 < 10) {
                                  list.add(Flexible(
                                    child: ProductItem(
                                      goToDetail: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    StorageDetail()));
                                      },
                                      name: '????????????????????? ????????????????????? ???????????? 100000 ????????????????????????',
                                      price:'1022',
                                      num: '1000',
                                      imageUrl:'http://128.199.110.176:8080/upload/img/8images.jpeg',
                                    ),
                                  ));
                                } else {
                                  list.add(
                                      Flexible(child: Container()));
                                }
                              }
                              return Row(
                                children: list,
                              );
                            },
                            itemCount: 10,
                          );
                        }
                        else if( snapshost.hasError){
                          return Center(child: Text('??????????????????????????????????????????????????????????????????????????????'),);
                        }
                        else{
                          return CircularProgressIndicator();
                        }
                      }, )),
                    ]))
              ],
            ),
          ),
          floatingActionButton: Container(
            child: FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.add),
              backgroundColor: Colors.red,
            ),
          )
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   child: AddButton(
        //     GotoNewproduct: () => {},
        //   ),
        // ),
      ),
    );
  }
}