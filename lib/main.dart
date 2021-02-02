import 'package:flutter/material.dart';
import 'models/productModel.dart';
import 'repositories/productRepos.dart';
import 'version/VersaoWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DEV_TVAS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Minha Primeira Repository'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> _products = new List<ProductModel>();
  ProductRepository _repository = new ProductRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.verified),
                splashColor: Colors.blue,
                color: Colors.black,
                splashRadius: 20,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => VersaoWidget()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
      body: new FutureBuilder(
        future: _repository.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: new Text('Carregando...'));
            default:
              if (snapshot.hasError)
                return new Text(snapshot.error);
              else
                return listView(context, snapshot);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.update),
        backgroundColor: Colors.greenAccent,
        elevation: 20,
        tooltip: 'Atualizar',
        isExtended: true,
        onPressed: () {
          setState(() {
            return MyHomePage();
          });
        },
      ),
    );
  }

  Widget listView(BuildContext context, AsyncSnapshot snapshot) {
    List<ProductModel> products = snapshot.data;

    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            new ListTile(
              title: new Text(products[index].title),
            ),
          ],
        );
      },
    );
  }
}
