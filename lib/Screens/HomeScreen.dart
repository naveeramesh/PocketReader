import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocket_reader/Screens/Categorypage.dart';
import 'package:pocket_reader/Screens/Described.dart';
import 'package:pocket_reader/constants/categorydata.dart';
import 'package:pocket_reader/models/article.dart';
import 'package:pocket_reader/models/categorymodel.dart';
import 'package:pocket_reader/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> article = List<Article>();
  List<CategoryModel> categories = List<CategoryModel>();
  ApiService client = ApiService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    // getNews();
  }

  nextPage(Article article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (b) => DescribtionScreen(
                  article: article,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,
                  // child: Image.asset('assets/images/logo.PNG'),
                  child: Image.network(
                      'https://image.flaticon.com/icons/png/512/3009/3009335.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      'Discover',
                      style: GoogleFonts.lato(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10.0),
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (b) => CategoryPage(
                                          category: categories[index].category,
                                        )));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        categories[index].imageurl),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 10,
                          child: Text(
                            categories[index].category,
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 18),
                          ),
                        )
                      ]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Top Headlines',
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: FutureBuilder(
                    future: client.getArticle(),
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
