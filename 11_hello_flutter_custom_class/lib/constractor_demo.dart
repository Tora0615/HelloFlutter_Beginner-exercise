class QuoteClass01{
  String text;
  String author;
  QuoteClass01(String textInput,String authorInput){  //建構子寫法1
    this.text = textInput;
    this.author = authorInput;
  }
}

/* <注意> 建構子的參數傳遞有前後順序，顛倒填入內容會不相同 */
QuoteClass01 quote01 = new QuoteClass01('Some sentence','author name');  //建構子使用方式
QuoteClass01 quote02 = QuoteClass01('Some sentence','author name');  //new可以省略


class QuoteClass02{
  String text;
  String author;
  QuoteClass02(this.text,this.author); //建構子寫法2 --> 更為精簡
}
/* <注意> 建構子的參數仍有先後順序 */
QuoteClass02 quote03 = QuoteClass02('Some sentence','author name');


class QuoteClass03{
  String text;
  String author;
  QuoteClass03({this.text,this.author}); //建構子寫法3 --> 注意有加大括號
}
/* <注意> 建構子的參數可以先後顛倒，因為使用了 paramName：value 的方式指定命名參數 */
QuoteClass03 quote04 = QuoteClass03(author:'author name',text:'Some sentence');