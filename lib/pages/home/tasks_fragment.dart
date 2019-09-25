import 'package:elisen_mobile/pages/home/tasks_frag_list_ui.dart';
import 'package:elisen_mobile/pages/ticket/ticket_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TasksFragment extends StatefulWidget {
  @override
  _TasksFragmentState createState() => _TasksFragmentState();
}

class _TasksFragmentState extends State<TasksFragment> {
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
    return DefaultTabController(
        initialIndex: 0,
        length: 5,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, .9),

          appBar: PreferredSize(
            preferredSize: new Size(MediaQuery.of(context).size.width, 232),
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70.0,),

                      Text("Tâches", textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                      )),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0)
                        ),

                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: false,
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontStyle: FontStyle.italic
                            ),
                            decoration: InputDecoration(
                              hintText: "Numero ticket",
                              border: InputBorder.none,
                              icon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                            ),
                          ),

                          suggestionsCallback: (pattern) async {
                            //var fetchData = await fetchProjets(10, 0, search: pattern);
                            //return fetchData.data.contents;
                            return [];
                          },

                          itemBuilder: (context, myProjet) {
                            return ListTile(
                              title: Text(myProjet.name),
                              subtitle: Text('${myProjet.montant} XOF'),
                            );
                          },

                          onSuggestionSelected: (myProjet) {
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjetProfilPage(projet: myProjet)));
                          },
                        ),
                      ),

                      TabBar(
                        isScrollable: true,
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        indicatorWeight: 2,
                        tabs: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 8),
                            child: Text("Assignées", style: TextStyle(
                                fontSize: 16
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 8),
                            child: Text("En attente", style: TextStyle(
                                fontSize: 16
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 8),
                            child: Text("En cours", style: TextStyle(
                                fontSize: 16
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 8),
                            child: Text("Attente rapport", style: TextStyle(
                                fontSize: 16
                            ),),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 40, left: 4, right: 4, bottom: 8),
                            child: Text("Fermé", style: TextStyle(
                                fontSize: 16
                            ),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                Positioned(
                  top: 20,
                  right: 30,
                  child: Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          body: TabBarView(
            children: <Widget>[
              TasksFragListUI(),

              Container(
                //height: MediaQuery.of(context).size.height,
                child: EasyRefresh.custom(
                  //topBouncing: true,
                  bottomBouncing: true,

                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
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
                      }, childCount: 10),
                    ),
                  ],

                  onRefresh: () async {

                  },

                  onLoad: () async {

                  },
                ),
              ),

              Container(
                //height: MediaQuery.of(context).size.height,
                child: EasyRefresh.custom(
                  //topBouncing: true,
                  bottomBouncing: true,

                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
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
                      }, childCount: 10),
                    ),
                  ],

                  onRefresh: () async {

                  },

                  onLoad: () async {

                  },
                ),
              ),

              Container(
                //height: MediaQuery.of(context).size.height,
                child: EasyRefresh.custom(
                  //topBouncing: true,
                  bottomBouncing: true,

                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
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
                      }, childCount: 10),
                    ),
                  ],

                  onRefresh: () async {

                  },

                  onLoad: () async {

                  },
                ),
              ),

              Container(
                //height: MediaQuery.of(context).size.height,
                child: EasyRefresh.custom(
                  //topBouncing: true,
                  bottomBouncing: true,

                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
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
                      }, childCount: 10),
                    ),
                  ],

                  onRefresh: () async {

                  },

                  onLoad: () async {

                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}