import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum Sentiment {
  positive,
  negative,
  neutral,
}

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String headline;
  final Sentiment sentiment;
  final VoidCallback onTap;

  const NewsCard({
    required this.imageUrl,
    required this.headline,
    required this.sentiment,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color sentimentColor;
    IconData sentimentIcon;
    switch (sentiment) {
      case Sentiment.positive:
        sentimentColor = Colors.green;
        sentimentIcon = Icons.sentiment_satisfied;
        break;
      case Sentiment.negative:
        sentimentColor = Colors.red;
        sentimentIcon = Icons.sentiment_dissatisfied;
        break;
      case Sentiment.neutral:
      default:
        sentimentColor = Colors.grey;
        sentimentIcon = Icons.sentiment_neutral;
        break;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  child: Text(
                    removeSourceFromHeadline(headline),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: sentimentColor.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Icon(
                sentimentIcon,
                color: Colors.white,
                size: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String removeSourceFromHeadline(String headline) {
    final regex = RegExp(r' - (.+)$');
    final match = regex.firstMatch(headline);
    if (match != null) {
      return headline.replaceFirst(match.group(0)!, '').trim();
    }
    return headline;
  }
}
