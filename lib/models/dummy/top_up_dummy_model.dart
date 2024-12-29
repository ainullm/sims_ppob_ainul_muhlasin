class TopUpDummyModel {
  final String? textPrice;
  final String? price;

  TopUpDummyModel({
    this.textPrice,
    this.price,
  });
}

List<TopUpDummyModel> topUpDummyList = [
  TopUpDummyModel(textPrice: 'Rp 10.000', price: '10000'),
  TopUpDummyModel(textPrice: 'Rp 20.000', price: '20000'),
  TopUpDummyModel(textPrice: 'Rp 50.000', price: '50000'),
  TopUpDummyModel(textPrice: 'Rp 100.000', price: '100000'),
  TopUpDummyModel(textPrice: 'Rp 200.000', price: '200000'),
  TopUpDummyModel(textPrice: 'Rp 500.000', price: '500000'),
];
