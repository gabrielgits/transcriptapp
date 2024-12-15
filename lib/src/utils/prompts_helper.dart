class PromptsHelper {
  static String createGame(String title) {
    const String format = '''
Return the game as valid JSON using the following structure:
{
  "title": \$gameTitle,
  "category": \$gameCategory,
  "description": \$gameShortAndFunnyDescription,
  "questions": [
    {
      "questionId": \$questionId,
      "question": \$question1,
      "level":  \$questionLevel,
      "tips": \$questionTips,
      "answers": [
        {"answerId":1,"answer": \$answer1},
        {"answerId":2,"answer": \$answer2},
        {"answerId":3,"answer": \$answer3},
        {"answerId":4,"answer": \$answer4},
      ],
      "correctAnswer": \$correctAnswerId,
    },
    ...
  ]
}

questions: should be a List of 15 questions objects as Map<String, dynamic> type. 
questionId: should be an integer sequence starting from 1 to 15.
level: should be an String: "easy", "medium" or "hard".
answers: should be a List of 4 answers objects as Map<String, dynamic> type.
answerId: should be an integer sequence starting from 1 to 4. 
''';

    String text = '''
Create a complete quiz about $title with 3 levels, easy, medium and hard. Each level should have 5 questions.

$format
''';

    return text;
  }

  static String answerVerify(
      {required String question,
      required String response,
      required bool correct}) {
    final isCorrect = correct ? 'is correct' : 'is incorrect';
    String text = '''
Explain in short sentence why the answer "$response" for question "$question" $isCorrect.
''';

    return text;
  }

  static String tipGet(String question) {
    String text = '''
Write in short sentence a tip for question "$question", without say the answer.
''';

    return text;
  }
}
