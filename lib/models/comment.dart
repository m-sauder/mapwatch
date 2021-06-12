class Comment {
  String coordinateId;
  String commentId;
  String comment;
  DateTime datePosted;

  Comment(
    this.coordinateId,
    this.commentId,
    this.comment,
    this.datePosted,
  );

  Comment.fromJson(Map<String, dynamic> json)
      : coordinateId = json['coordinateId'],
        commentId = json['commentId'],
        comment = json['comment'],
        datePosted = json['datePosted'];

  Map<String, dynamic> toJson() => {
        'coordinateId': coordinateId,
        'commentID': commentId,
        'comment': comment,
        'datePosted': datePosted,
      };
}
