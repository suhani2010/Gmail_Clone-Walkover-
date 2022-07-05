class MailData{
  List<String> sender_id;
  String subject;
  String description;
  List<String> attachments;
  String display_icon;

  MailData({
      required this.sender_id,
      required this.subject,
      required this.description,
      required this.attachments,
      required this.display_icon,
    });
  


}