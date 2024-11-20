import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:transcriptapp/src/core/presenter/screens/show_error_view.dart';
import 'package:transcriptapp/src/core/presenter/widgets/loading_widget.dart';

import '../controllers/controller_my_exams.dart';
import 'game_card.dart';

class MygamesSlider extends ConsumerStatefulWidget {
  const MygamesSlider({super.key});

  @override
  ConsumerState<MygamesSlider> createState() => _MygamesSliderState();
}

class _MygamesSliderState extends ConsumerState<MygamesSlider> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(controllerMyStudentsProvider);

    return controller.when(
      loading: () => const Center(child: LoadingWidget()),
      error: (error, _) => ShowErrorView(
        title: 'Error on Load my game list',
        detail: error.toString(),
        onPressed: () => setState(() {}),
      ),
      data: (data) {
        // show message if data is empty
        if (data.isEmpty) {
          return Column(
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  color: Colors.grey,
                ),
                child: Image.asset(
                  'assets/images/tchissola/tchissola6.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'You don\'t have any game yet!',
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        }
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: data.map((game) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: InkWell(
                        onTap: () => context.pushNamed(
                          'gameview',
                          extra: {'game': game},
                        ),
                        child: GameCard(
                          title: game.title,
                          category: game.model.name,
                          description: game.model.name,
                          icon: "assets/images/icons/app_icon.png",
                          backgroundColor: Colors.grey.value,
                          color: Colors.white.value,
                          author: game.model.name,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
