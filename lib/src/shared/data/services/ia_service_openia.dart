import 'package:dart_openai/dart_openai.dart';

class IaServiceOpenia {
  final String apiKey;

  IaServiceOpenia(this.apiKey) {
    OpenAI.apiKey = apiKey;
  }

  Future<OpenAIChatCompletionChoiceMessageModel> getData(String request) async {
// the system message that will be sent to the request.
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "return any message you are given as JSON.",
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    // the user message that will be sent to the request.
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          request,
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

// all messages to be sent.
    final requestMessages = [
      systemMessage,
      userMessage,
    ];

// the actual request.
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo-1106",
      responseFormat: {"type": "json_object"},
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
      maxTokens: 500,
    );

    return chatCompletion.choices.first.message;
  }

  Future<Map<String, dynamic>> getText(String request) async {
    final data = await getData(request);
    return data.toMap();
  }
}
