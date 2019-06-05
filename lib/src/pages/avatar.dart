import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.kinja-img.com/gawker-media/image/upload/s--iov15Eje--/c_scale,f_auto,fl_progressive,q_80,w_800/y41bsru7hkylimqepa92.jpg'),
              radius: 20.0,
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('AF'),
                backgroundColor: Colors.deepPurpleAccent,
              ))
        ],
      ),
    );
  }
}
