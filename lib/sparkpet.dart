import 'package:spark_pet/screens/challenges.dart';
import 'package:spark_pet/screens/closet.dart';
import 'package:spark_pet/screens/store.dart';
import 'package:spark_pet/screens/home.dart';
import 'package:spark_pet/screens/leaderboard.dart';
import 'package:flutter/material.dart';

import 'components/spark_pet_nav_bar.dart';


class SparkPet extends StatefulWidget {
  const SparkPet({Key? key}) : super(key: key);

  @override
  State<SparkPet> createState() => _SparkPetState();
}

class _SparkPetState extends State<SparkPet> {
  int currentPageIndex = 2;

  void refreshState(int newIndex) {
    setState(() {
      currentPageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkPet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            <Widget>[
              const StoreScreen(),
              const ClosetScreen(),
              const HomeScreen(),
              const LeaderboardScreen(),
              const ChallengesScreen(),
            ][currentPageIndex],
            SparkPetNavBar(
              currentPageIndex: currentPageIndex,
              notifyParent: refreshState
            ),
          ],
        ),
      ),
    );
  }
}
