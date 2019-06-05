import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  List<int> _listNumber;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _count = 0;

  //Este es el primer método llamado cuando se crea el widget (después del constructor de la clase, por supuesto)
  @override
  void initState() {
    _listNumber = new List();
    _addTenImg();
    //metodo que se va a disparar cada vez que se mueva el scroll
    _scrollController.addListener(() {
      //verificamos que el scroll este en el final
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //  _addTenImg();
        _fetchData();
      }
    });
    super.initState();
  }

  //se dispara cuando la pagina es destruida
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista'),
        ),
        body:
            //stack los ordena de forma apilada, uno encima de otro
            Stack(
          children: <Widget>[_createList(), _createLoading()],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumber.length,
        itemBuilder: (BuildContext context, int index) {
          //optengo el valor de la lista
          final img = _listNumber[index];
          return FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://picsum.photos/id/$img/500/300'));
        },
      ),
    );
  }

  Future getPageOne() async {
    final duration = Duration(seconds: 2);

    new Timer(duration, () {
      _listNumber.clear();
      _count++;
      _addTenImg();
    });
    return Future.delayed(duration);
  }

  _addTenImg() {
    for (int i = 1; i < 10; i++) {
      _count++;
      _listNumber.add(_count);
    }
    setState(() {});
  }

  Future _fetchData() async {
    //creo el dely
    _isLoading = true;
    setState(() {});
    final duation = Duration(seconds: 2);
    return new Timer(duation, responseHttp);
  }

  void responseHttp() {
    _isLoading = false;
    setState(() {});

    //mover el scroll
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addTenImg();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        //centro al final
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}
