
import 'package:url_launcher/url_launcher.dart';

class OpenUrl {

  final String url;

  OpenUrl(this.url) {
    _launchUrl(url);
  }

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw 'Não é possivel abrir $url';
    }
  }
}