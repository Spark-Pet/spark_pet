class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.username,
    required this.petId,
    required this.statsId,
    required this.bones,
    required this.purchasedAccessoryIds,
    required this.activeChallengeIds,
    required this.pastChallengeIds,
    required this.dateJoined,
    this.imagePath,
  });

  String id;
  String name;
  String email;
  String password;
  String username;
  String petId;
  String statsId;
  int bones;
  List<String> purchasedAccessoryIds;
  List<String> activeChallengeIds;
  List<String> pastChallengeIds;
  DateTime dateJoined;
  String? imagePath;
}

class UserDb {
  final List<UserData> _users = [
    UserData(
      id: 'user-001',
      name: 'John Doe',
      username: 'jdoe',
      email: 'johndoe@gmail.com',
      password: 'password',
      petId: 'pet-001',
      statsId: 'stats-001',
      bones: 100,
      purchasedAccessoryIds: ['accessory-001'],
      activeChallengeIds: [],
      pastChallengeIds: [],
      dateJoined: DateTime(2023, 10, 1),
    ),
    UserData(
      id: 'user-002',
      name: 'Jane Doe',
      username: 'janedoe',
      email: 'janedoe@mail.com',
      password: 'password',
      petId: 'pet-002',
      statsId: 'stats-002',
      bones: 100,
      purchasedAccessoryIds: [],
      activeChallengeIds: [],
      pastChallengeIds: [],
      dateJoined: DateTime(2023, 10, 4),
    ),
    UserData(
      id: 'user-003',
      name: 'John Smith',
      username: 'jsmith',
      email: 'jsmith@gmail.com',
      password: 'password',
      petId: 'pet-003',
      statsId: 'stats-003',
      bones: 100,
      purchasedAccessoryIds: [],
      activeChallengeIds: [],
      pastChallengeIds: [],
      dateJoined: DateTime(2023, 10, 6),
    )
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  List<UserData> getUsers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

  String login(String email, String password) {
    try {
      final user = _users.firstWhere((userData) => userData.email == email && userData.password == password);
      return user.id;
    } catch (e) {
      return '';
    }
  }
}