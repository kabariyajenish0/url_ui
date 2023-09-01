import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
      {super.key,
      this.image,
      this.name,
      this.url,
      this.title,
      this.content,
      this.description});

  final image;
  final name;
  final url;
  final title;
  final content;
  final description;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Share.share("${widget.url.toString()}");
                },
                icon: Icon(
                  Icons.share,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border,
                  color: Colors.black,
                )),
          ]),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 15),
                child: Container(
                  height: 240,
                  width: 330,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      image: DecorationImage(
                          image: NetworkImage("${widget.image}"),
                          fit: BoxFit.fill)),
                ),
              ),
              Text("${widget.content}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              Text("${widget.name}",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400)),
              SizedBox(height: 30),
              Text("${widget.title}",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(height: 25),
              Text("${widget.description}",
                  style: TextStyle(
                    fontSize: 15,
                  )),
              SizedBox(height: 25),
              Text("${widget.url}",
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
