class ErrorEvent {
  String type;
  String title;
  String message;

  ErrorEvent(this.message, {this.type = "default", this.title = "Error"});
}