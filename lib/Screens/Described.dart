import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_reader/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class DescribtionScreen extends StatefulWidget {
  final Article article;
  const DescribtionScreen({Key key, this.article}) : super(key: key);

  @override
  _DescribtionScreenState createState() => _DescribtionScreenState();
}

class _DescribtionScreenState extends State<DescribtionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(children: [
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
            ),
            Positioned(
              top: 25,
              left: 5,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_sharp,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              left: 10,
              right: 0,
              bottom: 30,
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.article.source.name,
                    style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )),
            ),
            Positioned(
              left: 10,
              right: 0,
              bottom: 10,
              child: Container(
                  child: Row(
                children: [
                  Text(
                    'Author : ',
                    style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    widget.article.author.toString() == "null"
                        ? 'No author'
                        : widget.article.author.toString(),
                    style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              )),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
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
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Visit here',
                style: GoogleFonts.lato(
                    color: Colors.red[700],
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Container(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () async {
                    await canLaunch(widget.article.url)
                        ? await launch(widget.article.url)
                        : throw 'Could not launch url';
                  },
                  child: Text(
                    widget.article.url,
                    style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
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
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.article.content.toString() == "null"
                      ? "For more details visit the link above."
                      : widget.article.content.toString(),
                  style: GoogleFonts.lato(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
