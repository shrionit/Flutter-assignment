class User {
  final int userId;
  final String name;
  final String avatar;
  bool isOnline;

  User({
    this.userId,
    this.name,
    this.avatar,
    this.isOnline = true,
  });
}

final User currentUser = User(
  userId: 0,
  name: 'Matt',
  avatar: 'assets/images/john-wick.jpg',
);

// USERS
final User greg = User(
  userId: 1,
  name: 'Greg',
  avatar: 'assets/images/greg.jpg',
);
final User james = User(
  userId: 2,
  name: 'James',
  avatar: 'assets/images/james.jpg',
);
final User john = User(
  userId: 3,
  name: 'John',
  avatar: 'assets/images/john.jpg',
);
final User olivia = User(
  userId: 4,
  name: 'Olivia',
  avatar: 'assets/images/olivia.jpg',
);
final User sam = User(
  userId: 5,
  name: 'Sam',
  avatar: 'assets/images/sam.jpg',
);
final User sophia = User(
  userId: 6,
  name: 'Sophia',
  avatar: 'assets/images/sophia.jpg',
);
final User steven = User(
  userId: 7,
  name: 'Steven',
  avatar: 'assets/images/steven.jpg',
);
