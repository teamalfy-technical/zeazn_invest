class Project {
  String? title;
  String? description;
  String? image;
  Creator? creator;
  double? targetAmount;

  Project({
    this.title,
    this.description,
    this.image,
    this.creator,
    this.targetAmount,
  });

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    targetAmount = json['target'];
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['target'] = targetAmount;
    if (creator != null) {
      data['creator'] = creator!.toJson();
    }
    return data;
  }
}

class Creator {
  String? firstName;
  String? lastName;
  String? image;

  double? ratings;

  Creator({this.firstName, this.lastName, this.image, this.ratings});

  Creator.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['image'] = image;
    data['ratings'] = ratings;

    return data;
  }
}

final List<Project> projects = [
  Project(
    title: 'Jazz Night',
    description:
        'Come and enjoy a jazz vocalist whose velvety tones and timeless melodies transport audiences to an era of smooth sophistication. ',
    image: 'https://picsum.photos/200',
    targetAmount: 20000,
    creator: Creator(
      firstName: 'Sarah',
      lastName: 'Donut',
      image: 'https://picsum.photos/200',
      ratings: 5,
    ),
  ),
  Project(
    title: 'Highlife Concert',
    description:
        'Come and enjoy a highlife vocalist whose velvety tones and timeless melodies transport audiences to an era of smooth sophistication. ',
    image: 'https://picsum.photos/200',
    targetAmount: 20000,
    creator: Creator(
      firstName: 'Amakye',
      lastName: 'Dede',
      image: 'https://picsum.photos/200',
      ratings: 3.5,
    ),
  ),
  Project(
    title: 'Highlife Concert',
    description:
        'Come and enjoy a jazz vocalist whose velvety tones and timeless melodies transport audiences to an era of smooth sophistication. ',
    image: 'https://picsum.photos/200',
    targetAmount: 20000,
    creator: Creator(
      firstName: 'Sarah',
      lastName: 'Donut',
      image: 'https://picsum.photos/200',
      ratings: 4.5,
    ),
  ),
];
