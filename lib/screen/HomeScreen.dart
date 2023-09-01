import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_ui/screen/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Map<String, dynamic> articles;

  Future<void> fillData() async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=&sortBy=publishedAt&apiKey=7561fba3f6c34b308887883255892322"));
    articles = jsonDecode(response.body);
    //print(articles);
  }

  List<Widget> list = [
    Text("HOME", style: TextStyle(color: Colors.black45)),
    Text("NEWS", style: TextStyle(color: Colors.black45)),
    Text("SHOWBLE", style: TextStyle(color: Colors.black45)),
    Text("EXTRA", style: TextStyle(color: Colors.black45)),
    Text("STYLE", style: TextStyle(color: Colors.black45)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Image(
            image: AssetImage("assets/image/Evokelogo.jpg"),
            width: 145,
            height: 145,
          )),
          leading: Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.black45,
              ),
            )
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            isScrollable: true,
            tabs: List.generate(list.length, (index) => list[index]),
          ),
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: 100,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> user = articles['articles'][index];
                  // print(user);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DetailsScreen(
                                    title: user['title'],
                                    image: user['urlToImage'],
                                    content: user['content'],
                                    name: user['source']['name'],
                                    description: user['description'],
                                    url: user['url'],
                                  )));
                    },
                    child: Container(
                      height: 129,
                      width: 350,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          color: Colors.black54,
                        )
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                          left: 10,
                        ),
                        child: Row(children: [
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                image: DecorationImage(
                                    image:
                                        NetworkImage("${user['urlToImage']}"),
                                    fit: BoxFit.fill)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    maxLines: 3,
                                    '${user['title']}',
                                    style: TextStyle(
                                        //   fontFamily: "Cookie-Regular",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${user['publishedAt']}',
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    //   overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${user['url']}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black45,
                                    ),
                                    //   overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ]),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 0),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Center(),
              );
            }
          },
          future: fillData(),
        ),
      ),
    );
  }
}
