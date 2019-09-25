import 'package:elisen_mobile/pages/ticket/show_ticket.dart';
import 'package:flutter/material.dart';

class TicketListUI extends StatelessWidget {
  final image = 'assets/img/2.jpg';

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowTicketPage()),
        );
      },

      child: Container(
        child: Column(
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

                      InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Tap'),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.star_border,
                            size: 35.0,
                            color: Colors.grey,
                          ),
                        ),
                      )
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
        ),
      ),
    );
  }
}