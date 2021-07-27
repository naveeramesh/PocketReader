import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_reader/Screens/Described.dart';
import 'package:pocket_reader/models/article.dart';
import 'package:pocket_reader/services/api_services.dart';

class CategoryPage extends StatefulWidget {
  final String category;
  const CategoryPage({Key key, this.category}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  nextPage(Article article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (b) => DescribtionScreen(
                  article: article,
                )));
  }

  Categoryservice categoryservice = Categoryservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 30,
                      child: Image.network(
                          'https://image.flaticon.com/icons/png/512/3009/3009335.png'),
                    ),
                  ),
                  Text(
                    widget.category,
                    style: GoogleFonts.lato(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 120,
                child: FutureBuilder(
                    future: categoryservice.getCategory(widget.category),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Article>> snapshot) {
                      if (snapshot.hasData) {
                        List<Article> article = snapshot.data;
                        return Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: article.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    nextPage(article[index]);
                                  },
                                  child: Container(
                                    // height: 200,
                                    margin: EdgeInsets.all(12),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.black26.withAlpha(7),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      article[index]
                                                                  .urlToImage ==
                                                              null
                                                          ? ""
                                                          : article[index]
                                                              .urlToImage),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Text(
                                                article[index].source.name,
                                                style: GoogleFonts.lato(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          child: Text(
                                            article[index].title,
                                            style: GoogleFonts.lato(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
