import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {
  /*------新加的------*/
  final Quote quoteInput;
  QuoteCard (this.quoteInput);  //傳進來的值用建構函數接住
  /*------------*/

  /*const QuoteCard({ //用不到
    Key key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch ,
          children: <Widget>[
            Text(
              quoteInput.text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6,),
            Text(
              quoteInput.author,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}