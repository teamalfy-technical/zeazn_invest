class Plan {
  String? title;
  String? price;
  String? reward;
  String? description;
  String? location;
  String? slots;
  String? dateTime;

  Plan({
    this.title,
    this.price,
    this.reward,
    this.description,
    this.location,
    this.slots,
    this.dateTime,
  });

  @override
  String toString() {
    return '''Title: $title 
      Price: $price
      Reward: $reward
      Description: $description
      Location: $location
      Slots: $slots
      DateTime: $dateTime
    ''';
  }
}
