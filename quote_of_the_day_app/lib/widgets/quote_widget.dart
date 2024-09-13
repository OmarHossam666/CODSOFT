import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_of_the_day_app/pages/favorite_quotes_page.dart';
import 'package:share_plus/share_plus.dart';

class QuoteWidget extends StatefulWidget {
  final String quote;
  final String author;
  final Color pageColor;

  const QuoteWidget({
    super.key,
    required this.pageColor,
    required this.quote,
    required this.author,
  });

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  bool isLiked = false;

  List<QuoteWidget> favoriteQuotes = [];

  Future<void> onShareClick() async {
    final text = '"${widget.quote}" - ${widget.author}';
    await Share.share(text);
  }

  void onLikeClick() {
    setState(() {
      isLiked = isLiked ? false : true;

      if (isLiked) {
        favoriteQuotes.add(widget);
      } else {
        favoriteQuotes.remove(widget);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.pageColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Row(
            children: [
              Image.asset(
                "assets/quote.png",
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteQuotesPage(
                              favoriteQuotes: favoriteQuotes)));
                },
                icon: const Icon(
                  Icons.favorite_border_rounded,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.quote,
            style: GoogleFonts.playfairDisplay(
              textStyle: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.author,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onLikeClick,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onShareClick,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white)),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
