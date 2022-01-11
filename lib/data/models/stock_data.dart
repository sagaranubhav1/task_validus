class StockData {
  String id;
  String stockName;
  double lastPrice;
  double price;
  double dayGain;
  String extendedHours;
  String lastTrade;

  StockData(
      {this.id,
      this.stockName,
      this.price,
      this.extendedHours,
      this.dayGain,
      this.lastTrade,
      this.lastPrice});

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      id: json['id'],
      lastPrice: json['lastPrice'],
      stockName: json['stockName'],
      price: json['price'],
      extendedHours: json['extendedHours'],
      lastTrade: json['lastTrade'],
      dayGain: json['dayGain'],
    );
  }
}
