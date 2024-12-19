import 'package:alertshow/alertshow.dart';
import 'package:bform/bform.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';
import 'package:transcriptapp/src/features/exams/domain/models/question_model.dart';

import '../controllers/testes_controller.dart';

final CarouselSliderController _controller = CarouselSliderController();
int _current = 0;
// Variable to store the selected answer's ID
Map<int, int> _selectedAnswers = {};

class TestePlayScreen extends ConsumerStatefulWidget {
  const TestePlayScreen({super.key, required this.testeId});

  final int testeId;

  @override
  ConsumerState<TestePlayScreen> createState() => _TestePlayScreenState();
}

class _TestePlayScreenState extends ConsumerState<TestePlayScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(startTesteProvider(widget.testeId));

    return SafeArea(
      child: Scaffold(
        body: controller.when(
          loading: () => const Scaffold(
            body: Center(child: LoadingWidget()),
          ),
          error: (error, _) => Scaffold(
            body: ShowErrorView(
              title: 'Error on start test',
              detail: error.toString(),
              onPressed: () => {},
            ),
          ),
          data: (questions) {
            final itemsListSlider = questions.map((question) {
              return QuestionWidget(
                question: question,
                key: ValueKey(question.id),
              );
            }).toList();

            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const TitleWidget(),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 450,
                      child: Column(children: [
                        CarouselSlider(
                          items: itemsListSlider,
                          carouselController: _controller,
                          options: CarouselOptions(
                              height: 400.0,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              aspectRatio: 2.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                        const Spacer(),
                        SizedBox(
                          //height: 24.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: questions.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 12.0,
                                  height: 12.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.black)
                                          .withOpacity(
                                              _current == entry.key ? 0.9 : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Consumer(
                builder: (context, ref, child) {
                  final controllerSend = ref.watch(testesControllerProvider);
                  return switch (controllerSend) {
                    AsyncLoading() => const Center(child: LoadingWidget()),
                    AsyncError() => const Text(
                        'Oops, something unexpected happened',
                      ),
                    _ => BformFooter(
                        leftChild: _current < 1
                            ? null
                            : BformButton(
                                label: tr('testePlay.back'),
                                colors: [Theme.of(context).primaryColor],
                                style: BformButtonStyle.outlined,
                                onPressed: () {
                                  setState(() {
                                    _current--;
                                    _controller.animateToPage(_current);
                                  });
                                },
                              ),
                        middleChild: BformButton(
                          label: tr('testePlay.finish'),
                          colors: const [
                            Colors.red,
                          ],
                          style: BformButtonStyle.outlined,
                          onPressed: () async {
                            final result = await alertshowDialog(
                              title: tr('testePlay.send'),
                              content: Text(tr('testePlay.warning')),
                              noButton: tr('testePlay.no'),
                              yesButton: tr('testePlay.yes'),
                              context: context,
                            );
                            if (context.mounted && result) {
                              await ref
                                  .read(testesControllerProvider.notifier)
                                  .sendStudentAnswers(
                                    selectedAnswers: _selectedAnswers,
                                    testeId: widget.testeId,
                                  );

                              if (context.mounted) {
                                context.goNamed('home');
                              }
                            }
                          },
                        ),
                        rightChild: _current > questions.length - 2
                            ? null
                            : BformButton(
                                label: tr('testePlay.next'),
                                colors: [Theme.of(context).primaryColor],
                                style: BformButtonStyle.outlined,
                                onPressed: () {
                                  setState(() {
                                    _current++;
                                    _controller.animateToPage(_current);
                                  });
                                },
                              ),
                      ),
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        //borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        tr('testePlay.title'),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.question,
  });

  final QuestionModel question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late int selectedAnswerId;

  @override
  void initState() {
    super.initState();
    // Initialize the selected answer for this question
    selectedAnswerId = _selectedAnswers[widget.question.id] ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              widget.question.question,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          height: 270,
          //color: Colors.grey,
          decoration:  BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Scrollbar(
            child: ListView.builder(
              itemCount: widget.question.answers.length,
              itemBuilder: (context, index) {
                final answer = widget.question.answers[index];
                return RadioListTile<int>(
                  value: answer.id,
                  groupValue: selectedAnswerId,
                  title: Text("${answer.line} ) ${answer.answer}"),
                  onChanged: (value) {
                    setState(() {
                      selectedAnswerId = value ?? 0;
                      _selectedAnswers[widget.question.id] = selectedAnswerId;
                    });
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
