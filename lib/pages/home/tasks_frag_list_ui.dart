import 'package:elisen_mobile/pages/ticket/ticket_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TasksFragListUI extends StatefulWidget {
  @override
  _TasksFragListUIState createState() => _TasksFragListUIState();
}

class _TasksFragListUIState extends State<TasksFragListUI> {
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
    return Container(
      //height: MediaQuery.of(context).size.height,
      child: EasyRefresh.custom(
        //topBouncing: true,
        bottomBouncing: true,

        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return TicketListUI();
            }, childCount: 5),
          ),
        ],

        onRefresh: () async {

        },

        onLoad: () async {

        },
      ),
    );
  }
}