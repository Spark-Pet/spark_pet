import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spark_pet/screens/challenges.dart';
import 'package:spark_pet/screens/closet.dart';
import 'package:spark_pet/screens/login.dart';
import 'package:spark_pet/screens/store.dart';
import 'package:spark_pet/screens/home.dart';
import 'package:spark_pet/screens/leaderboard.dart';

import 'components/spark_pet_nav_bar.dart';
import 'models/user_data.dart';

final currentPageProvider = StateProvider<int>((_) => 2);
final showMainModalProvider = StateProvider<bool>((_) => false);
final mainModalProvider = StateProvider<Container>((_) => Container());


class SparkPet extends ConsumerWidget {
  const SparkPet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = ref.watch(currentUserIDProvider);
    final currentPageIndex = ref.watch(currentPageProvider);
    final showModal = ref.watch(showMainModalProvider);
    final modal = ref.watch(mainModalProvider);

    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: loggedIn.isNotEmpty ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              <Widget>[
                const StoreScreen(),
                const ClosetScreen(),
                const HomeScreen(),
                LeaderboardScreen(),
                const ChallengesScreen(),
              ][currentPageIndex],
              SparkPetNavBar(),
              if (showModal) Stack(
                children: [
                  InkWell(
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0x56000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      ref.read(showMainModalProvider.notifier).state = false;
                      ref.read(mainModalProvider.notifier).state = Container();
                    },
                  ),
                  Center(
                    child: modal,
                  )
                ],
              ),
            ],
          )
          : LoginScreen(),
        ),
      ),
    );
  }
}
