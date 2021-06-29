import 'package:flutter/material.dart';
import 'quote.dart';

class QuoteCard extends StatelessWidget {

  final Quote quoteInput;

  final Function delete; //新增
  //QuoteCard (this.quoteInput); //原本
  QuoteCard ({this.quoteInput,this.delete});


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
            /*------新加的刪除按鈕------*/
            SizedBox(height: 8,),
            FlatButton.icon(
                onPressed: delete,
                icon: Icon(Icons.delete),
                label: Text('delete'))
            /*----------------------------*/
          ],
        ),
      ),
    );
  }
}