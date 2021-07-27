import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pocket_reader/Screens/DetailNews.dart';
import 'package:pocket_reader/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DescribtionScreen extends StatefulWidget {
  final Article article;
  const DescribtionScreen({Key key, this.article}) : super(key: key);

  @override
  _DescribtionScreenState createState() => _DescribtionScreenState();
}

class _DescribtionScreenState extends State<DescribtionScreen> {
  var currentdate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(widget.article.urlToImage == null
                            ? ""
                            : widget.article.urlToImage),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text(
                            widget.article.source.name,
                            style: GoogleFonts.lato(
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          )),
                          Container(
                              child: Row(
                            children: [
                              Text(
                                'Author: ',
                                style: GoogleFonts.lato(
                                    color: Colors.white.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.article.author.toString() == "null"
                                      ? "No Author"
                                      : widget.article.author,
                                  style: GoogleFonts.lato(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              widget.article.publishedAt,
                              style: GoogleFonts.lato(
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.article.title,
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.article.description.toString(),
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 20),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 4,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Colors.blue[700].withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (b) =>
                                    DetailNews(url: widget.article.url)));
                      },
                      child: Center(
                        child: Text(
                          "Source",
                          style: GoogleFonts.lato(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
