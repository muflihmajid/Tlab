class ExitEvent {
  String reason;
  bool needLogout;

  ExitEvent({this.reason = "default", this.needLogout = false});
}