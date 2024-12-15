
import 'package:dart_openai/dart_openai.dart';
import 'package:transcriptapp/src/shared/data/services/ia_service.dart';

class IaServiceOpenia implements IaService {
  final String apiKey;

  IaServiceOpenia(this.apiKey) {
    OpenAI.apiKey = apiKey;
  }

  @override
  Future<Map<String, dynamic>> getData(String request) async {
    try {
      final chatCompletion = await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo",
        //temperature: 0.2,
        messages: [
          OpenAIChatCompletionChoiceMessageModel(
            content: [
    OpenAIChatCompletionChoiceMessageContentItemModel.text(
      "return any message you are given as JSON.",
    ),
  ],
           
            role: OpenAIChatMessageRole.user,
          ),
        ],
      );
      return chatCompletion.choices.first.message.toMap();
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<Map<String, dynamic>> getText(String request) {
    // TODO: implement getText
    throw UnimplementedError();
  }
}
