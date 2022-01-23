class Post {
  String id;//投稿を識別するid、投稿一つにidも一つ
  String content;//投稿の中身
  String postAccountId;//投稿したアカウントのid
  DateTime? createdTime;

  Post({this.id = "", this.content = "", this.postAccountId = "", this.createdTime});

}