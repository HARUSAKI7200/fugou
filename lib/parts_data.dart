// 部材情報のデータ構造
class PartData {
  final String symbol;
  final String upper;
  final String lower;
  final String brace;
  final String support;
  final String additionalSupport;

  PartData({
    required this.symbol,
    required this.upper,
    required this.lower,
    required this.brace,
    required this.support,
    required this.additionalSupport,
  });
}

// 符号から部材を検索するためのデータ
final List<PartData> partTable = [
  PartData(symbol: '1', upper: '2.4×7.5', lower: '2.4×7.5', brace: '2.4×7.5', support: '2.4×7.5', additionalSupport: '不要'),
  PartData(symbol: '2', upper: '2.4×7.5', lower: '2.4×7.5', brace: '2.4×7.5', support: '2.4×7.5', additionalSupport: '2.4×7.5'),

  PartData(symbol: '11', upper: '2.4×9.0', lower: '2.4×9.0', brace: '2.4×9.0', support: '2.4×9.0', additionalSupport: '不要'),
  PartData(symbol: '12', upper: '2.4×9.0', lower: '2.4×9.0', brace: '2.4×9.0', support: '2.4×9.0', additionalSupport: '2.4×9.0'),

  PartData(symbol: '21', upper: '3.0×9.0', lower: '3.0×9.0', brace: '3.0×9.0', support: '3.0×9.0', additionalSupport: '不要'),
  PartData(symbol: '22', upper: '3.0×9.0', lower: '3.0×9.0', brace: '3.0×9.0', support: '3.0×9.0', additionalSupport: '2.4×9.0'),
  PartData(symbol: '23', upper: '3.0×9.0', lower: '3.0×9.0', brace: '3.0×9.0', support: '3.0×9.0', additionalSupport: '3.0×9.0'),

  PartData(symbol: '31', upper: '4.0×9.0', lower: '4.0×9.0', brace: '4.0×9.0', support: '4.5×9.0', additionalSupport: '不要'),
  PartData(symbol: '32', upper: '4.0×9.0', lower: '4.0×9.0', brace: '4.0×9.0', support: '4.5×9.0', additionalSupport: '2.4×9.0'),
  PartData(symbol: '33', upper: '4.0×9.0', lower: '4.0×9.0', brace: '4.0×9.0', support: '4.5×9.0', additionalSupport: '3.0×9.0'),
  PartData(symbol: '34', upper: '4.0×9.0', lower: '4.0×9.0', brace: '4.0×9.0', support: '4.5×9.0', additionalSupport: '4.0×9.0'),

  PartData(symbol: '41', upper: '4.5×9.0', lower: '4.5×9.0', brace: '4.5×9.0', support: '4.5×9.0', additionalSupport: '不要'),
  PartData(symbol: '42', upper: '4.5×9.0', lower: '4.5×9.0', brace: '4.5×9.0', support: '4.5×9.0', additionalSupport: '2.4×9.0'),
  PartData(symbol: '43', upper: '4.5×9.0', lower: '4.5×9.0', brace: '4.5×9.0', support: '4.5×9.0', additionalSupport: '3.0×9.0'),
  PartData(symbol: '44', upper: '4.5×9.0', lower: '4.5×9.0', brace: '4.5×9.0', support: '4.5×9.0', additionalSupport: '4.0×9.0'),
  PartData(symbol: '45', upper: '4.5×9.0', lower: '4.5×9.0', brace: '4.5×9.0', support: '4.5×9.0', additionalSupport: '4.5×9.0'),

  PartData(symbol: '51', upper: '5.0×10.0', lower: '5.0×10.0', brace: '5.0×10.0', support: '5.0×10.0', additionalSupport: '不要'),
  PartData(symbol: '52', upper: '5.0×10.0', lower: '5.0×10.0', brace: '5.0×10.0', support: '5.0×10.0', additionalSupport: '2.4×10.0'),
  PartData(symbol: '53', upper: '5.0×10.0', lower: '5.0×10.0', brace: '5.0×10.0', support: '5.0×10.0', additionalSupport: '3.0×10.0'),
  PartData(symbol: '54', upper: '5.0×10.0', lower: '5.0×10.0', brace: '5.0×10.0', support: '5.0×10.0', additionalSupport: '5.0×10.0'),

  PartData(symbol: '61', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '不要'),
  PartData(symbol: '62', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '2.4×9.0'),
  PartData(symbol: '63', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '3.0×9.0'),
  PartData(symbol: '64', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '4.0×9.0'),
  PartData(symbol: '65', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '4.5×9.0'),
  PartData(symbol: '66', upper: '6.0×9.0', lower: '6.0×9.0', brace: '6.0×9.0', support: '6.0×9.0', additionalSupport: '5.0×9.0'),

  PartData(symbol: '71', upper: '6.0×12.0', lower: '6.0×12.0', brace: '6.0×12.0', support: '6.0×12.0', additionalSupport: '2.4×12.0'),
  PartData(symbol: '72', upper: '6.0×12.0', lower: '6.0×12.0', brace: '6.0×12.0', support: '6.0×12.0', additionalSupport: '3.0×12.0'),
  PartData(symbol: '73', upper: '6.0×12.0', lower: '6.0×12.0', brace: '6.0×12.0', support: '6.0×12.0', additionalSupport: '6.0×12.0'),

  PartData(symbol: '81', upper: '6.0×18.0', lower: '6.0×18.0', brace: '6.0×18.0', support: '6.0×18.0', additionalSupport: '2.4×18.0'),
  PartData(symbol: '82', upper: '6.0×18.0', lower: '6.0×18.0', brace: '6.0×18.0', support: '6.0×18.0', additionalSupport: '3.0×18.0'),
  PartData(symbol: '83', upper: '6.0×18.0', lower: '6.0×18.0', brace: '6.0×18.0', support: '6.0×18.0', additionalSupport: '6.0×18.0'),

  PartData(symbol: '91', upper: '7.5×15.0', lower: '7.5×15.0', brace: '7.5×15.0', support: '7.5×15.0', additionalSupport: '3.0×15.0'),
  PartData(symbol: '92', upper: '7.5×15.0', lower: '7.5×15.0', brace: '7.5×15.0', support: '7.5×15.0', additionalSupport: '5.0×15.0'),
  PartData(symbol: '93', upper: '7.5×15.0', lower: '7.5×15.0', brace: '7.5×15.0', support: '7.5×15.0', additionalSupport: '7.5×15.0'),

  PartData(symbol: '101', upper: '7.5×18.0', lower: '7.5×18.0', brace: '7.5×18.0', support: '7.5×18.0', additionalSupport: '3.0×18.0'),
  PartData(symbol: '102', upper: '7.5×18.0', lower: '7.5×18.0', brace: '7.5×18.0', support: '7.5×18.0', additionalSupport: '6.0×18.0'),
  PartData(symbol: '103', upper: '7.5×18.0', lower: '7.5×18.0', brace: '7.5×18.0', support: '7.5×18.0', additionalSupport: '7.5×18.0'),
];