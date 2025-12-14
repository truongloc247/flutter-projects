class Place {
  String _placeName;
  bool _includeBreakfirst;
  int? _serviceLevel;
  double _feedbackScore;
  int _numberOfFeedback;
  String _location;
  double _distance;
  String _providingService;
  String _serviceDescription;
  double _price;
  String _priceDescription;
  String _imgUrl;

  Place({
    required String placeName,
    required bool includeBreakfast,
    int? serviceLevel,
    required double feedbackScore,
    required int numberOfFeedback,
    required String location,
    required double distance,
    required String providingService,
    required String serviceDescription,
    required double price,
    required String priceDescription,
    required String imgUrl,
  }) : _placeName = placeName,
       _includeBreakfirst = includeBreakfast,
       _serviceLevel = serviceLevel,
       _feedbackScore = feedbackScore,
       _numberOfFeedback = numberOfFeedback,
       _location = location,
       _distance = distance,
       _providingService = providingService,
       _serviceDescription = serviceDescription,
       _price = price,
       _priceDescription = priceDescription,
       _imgUrl = imgUrl;

  String get placeName => _placeName;
  bool get includeBreakfast => _includeBreakfirst;
  int? get serviceLevel => _serviceLevel;
  double get feedbackScore => _feedbackScore;
  int get numberOfFeedback => _numberOfFeedback;
  String get location => _location;
  double get distance => _distance;
  String get providingService => _providingService;
  String get serviceDescription => _serviceDescription;
  double get price => _price;
  String get priceDescription => _priceDescription;
  String get imgUrl => _imgUrl;
}
