import 'package:flutter/material.dart';
import 'package:quote_of_the_day_app/widgets/quote_widget.dart';

class FavoriteQuotesPage extends StatefulWidget {
  const FavoriteQuotesPage({
    super.key,
    required this.favoriteQuotes,
  });

  final List<QuoteWidget> favoriteQuotes;

  @override
  State<FavoriteQuotesPage> createState() => _FavoriteQuotesPageState();
}

class _FavoriteQuotesPageState extends State<FavoriteQuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: widget.favoriteQuotes.length,
        itemBuilder: (context, index) {
          return widget.favoriteQuotes[index];
        },
      ),
    );
  }
}
