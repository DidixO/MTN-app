import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HomeAgentFragment extends StatefulWidget {
  @override
  _HomeAgentFragmentState createState() => _HomeAgentFragmentState();
}

class _HomeAgentFragmentState extends State<HomeAgentFragment> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromRGBO(255, 255, 255, .9),

      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 220,
            color: Colors.yellow[800],
          ),

          Positioned(
            top: 20,
            right: 30,
            child: Icon(
              Icons.power_settings_new,
              color: Colors.white,
            ),
          ),

          Column(
            children: <Widget>[
              Container(
                  height: 62,
                  margin: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/profile-empty.jpg'),
                  )
              ),

              Padding(
                padding: EdgeInsets.all(4),
              ),

              // Nom
              Text(
                "Nom de l'utilisateur",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding: EdgeInsets.all(4),
              ),

              // Type utilisateur
              Text(
                "Categorie",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),

              Container(
                padding: EdgeInsets.all(4),
                child: Card(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      // Tickets ouverts
                      Column(
                        children: <Widget>[
                          Container(
                              padding:
                              EdgeInsets.only(top: 15, bottom: 5),
                              child: Text("Tickets ouverts", style: TextStyle(
                                  color: Colors.white)
                              )
                          ),

                          Container(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text("5,000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16)
                              )
                          ),
                        ],
                      ),

                      // Taux de satisfaction
                      Column(
                        children: <Widget>[
                          Container(
                              padding:
                              EdgeInsets.only(top: 15, bottom: 5),
                              child: Text("Satisfaction %",
                                  style: TextStyle(
                                      color: Colors.white)
                              )
                          ),

                          Container(
                              padding: EdgeInsets.only(bottom: 15),
                              child: Text("5,000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16)
                              )
                          ),
                        ],
                      ),

                      // Tickets fermés
                      Column(
                        children: <Widget>[
                          Container(
                              padding:
                              EdgeInsets.only(top: 10, bottom: 5),
                              child: Text("Tickets fermés",
                                  style: TextStyle(
                                      color: Colors.white)
                              )
                          ),

                          Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text("5,000",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 260,
            left: 0,
            right: 0,
            bottom: 0,
            child: EasyRefresh.custom(
              emptyWidget: _count == 0 ? Container(
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: SizedBox(), flex: 2,),
                    SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset('assets/images/nodata.png'),
                    ),
                    Text(
                      "Aucun ticket monté en escalade",
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                    ),
                    Expanded(child: SizedBox(), flex: 3,),
                  ],
                ),
              ): null,

              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Liste des tickets montés en escalade",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // Action
                              Center(
                                child: Container(
                                  width: 42,
                                  height: 42,
                                  child: Image.asset("assets/images/profile-empty.jpg"),
                                ),
                              ),

                              // Content
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      "Titre ici",
                                      style: TextStyle(
                                          fontSize: 18.0, fontWeight: FontWeight.bold),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      "Ici description breve",
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                ],
                              ),

                              // Action
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      "5m",
                                      style: TextStyle(color: Colors.grey),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.star_border,
                                        size: 35.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Divider(
                            height: 1.0,
                            color: Colors.grey[350],
                          )
                        ],
                      );
                    },
                    childCount: _count,
                  ),
                ),
              ],

              onRefresh: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    _count = 20;
                  });
                });
              },
              onLoad: () async {
                await Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    _count += 20;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

