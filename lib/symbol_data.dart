// 符号表のデータ構造を定義するクラス
class SymbolData {
  final String contentQuality;
  final String supportSpacing;
  final String outerWidth;
  final String innerHeight;
  final String symbol;

  SymbolData({
    required this.contentQuality,
    required this.supportSpacing,
    required this.outerWidth,
    required this.innerHeight,
    required this.symbol,
  });
}