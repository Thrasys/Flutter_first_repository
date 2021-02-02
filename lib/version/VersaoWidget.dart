import 'package:flutter/material.dart';

import '../main.dart';

class VersaoWidget extends StatelessWidget {
  static const String _title = 'Informacoes desse App';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        home: Scaffold(
          appBar:
              AppBar(backgroundColor: Colors.black, title: const Text(_title)),
          body: CardDetails(),
          ///////////////////////////////////////////////////////////
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
            child: ListTile(
              leading: Icon(
                Icons.arrow_back,
                color: Colors.transparent,
              ),
              title: Text(
                'VOLTAR',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyHomePage())),
            ),
            /////////////////////////////////////////////////////////////////
          ),
        ));
  }
}

/// This is the stateless widget that the main application instantiates.
class CardDetails extends StatelessWidget {
  CardDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: width * 0.8,
        height: height * 0.4,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.verified_user_sharp),
                title: Text('App Repository'),
                subtitle: Text(
                    'aplicativo criado dia 02/02/2021, com intencao didatica para conhecimento da funcionalidade do design pattern (repository)'),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text('VERSAO: 1.0'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    'Copyright ©2020, All Rights Reserved.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Color(0xFF162A49)),
                  ),
                  Text(
                    'Powered by DEV_TVAS',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Color(0xFF162A49)),
                  ),
                  Text(
                    'versao 1.0',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: Color(0xFF162A49)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
