import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';

import 'cheking_room.dart';

class RoomTab extends StatefulWidget {
  @override
  _RoomTabState createState() => _RoomTabState();
}

class _RoomTabState extends State<RoomTab> {
  TextEditingController _txtSearch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtSearch = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        //
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              pinned: false,
              snap: true,
              floating: true,
              primary: true,
              backgroundColor: CupertinoColors.lightBackgroundGray,
              flexibleSpace: SafeArea(
                minimum: EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Number of people label
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Text('Search'),
                      ),
                      // TextFormField for input number of people
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextFormField(
                          controller: _txtSearch,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.orange,
                          style: TextStyle(fontSize: 15, color: Colors.black38),
                          decoration: InputDecoration(
                            hintText: '',
                          ),
                        ),
                      ),
                      // Search button
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 50,
                          height: 40,
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            color: Colors.orange,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // label comfirm
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Text('Room list'),
                ),
                SafeArea(
                  top: false,
                  right: true,
                  left: true,
                  child: Column(
                    children: [
                      Room(),
                      Room(),
                      Room(),
                      Room(),
                      Room(),
                      Room(),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class Room extends StatelessWidget {
  const Room({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1),
        ],
      ),
      child: FlatButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckDetails(),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/images/image 3.png'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'EMPTY',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'R201',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Classroom',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.layers,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '20 m2',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'At most 30',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 60,
              child: FlatButton(
                onPressed: () =>
                    print('You have pressed event_available button'),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
