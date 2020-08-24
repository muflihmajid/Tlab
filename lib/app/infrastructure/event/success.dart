class SuccessEvent {
  String title;
  String content;
  String confirmText;
  Function onConfirm; 

  SuccessEvent({this.title, this.content, this.confirmText, this.onConfirm});
}