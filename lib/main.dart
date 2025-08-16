import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'symbol_data.dart'; // SymbolDataクラスをインポート
import 'parts_data.dart'; // PartDataクラスとpartTableをインポート

// 内容品質量ごとのデータをインポート
import 'data/data_1_0.dart';
import 'data/data_2_0.dart';
import 'data/data_3_0.dart';
import 'data/data_4_0.dart';
import 'data/data_5_0.dart';
import 'data/data_6_5.dart';
import 'data/data_8_0.dart';
import 'data/data_10_0.dart';


// アプリのエントリーポイント
void main() {
  runApp(const SymbolSearchApp());
}

class SymbolSearchApp extends StatelessWidget {
  const SymbolSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '符号検索アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SymbolSearchPage(),
    );
  }
}

class SymbolSearchPage extends StatefulWidget {
  const SymbolSearchPage({super.key});

  @override
  _SymbolSearchPageState createState() => _SymbolSearchPageState();
}

class _SymbolSearchPageState extends State<SymbolSearchPage> {
  // 検索条件の選択肢
  final List<String> contentQualities = ['1.0', '2.0', '3.0', '4.0', '5.0', '6.5', '8.0', '10.0'];
  final List<String> supportSpacings = ['60以下', '75以下', '91以下', '105以下', '123以下'];
  final List<String> outerWidths = ['100', '150', '200', '250', '300', '350', '400', '450', '500'];
  final List<String> innerHeights = ['100', '150', '200', '250', '300', '350', '400', '450', '500'];

  // ユーザーが選択した値
  String? selectedContentQuality;
  String? selectedSupportSpacing;
  String? selectedOuterWidth;
  String? selectedInnerHeight;

  // 検索結果
  String searchSymbol = '';
  PartData? searchPart;
  String message = '条件を選択して検索してください';

  // 内容品質量ごとのデータ
  List<SymbolData> currentSymbolTable = [];

  // 選択された内容品質量に基づいてデータをロードする
  void _loadSymbolData(String? contentQuality) {
    if (contentQuality == null) {
      currentSymbolTable = [];
      return;
    }

    switch (contentQuality) {
      case '1.0':
        currentSymbolTable = data_1_0;
        break;
      case '2.0':
        currentSymbolTable = data_2_0;
        break;
      case '3.0':
        currentSymbolTable = data_3_0;
        break;
      case '4.0':
        currentSymbolTable = data_4_0;
        break;
      case '5.0':
        currentSymbolTable = data_5_0;
        break;
      case '6.5':
        currentSymbolTable = data_6_5;
        break;
      case '8.0':
        currentSymbolTable = data_8_0;
        break;
      case '10.0':
        currentSymbolTable = data_10_0;
        break;
      default:
        currentSymbolTable = [];
        break;
    }
  }

  // 検索ロジック
  void _searchSymbol() {
    if (selectedContentQuality == null ||
        selectedSupportSpacing == null ||
        selectedOuterWidth == null ||
        selectedInnerHeight == null) {
      setState(() {
        message = '全ての項目を選択してください';
        searchSymbol = '';
        searchPart = null;
      });
      return;
    }

    final result = currentSymbolTable.firstWhere(
      (data) =>
          data.supportSpacing == selectedSupportSpacing &&
          data.outerWidth == selectedOuterWidth &&
          data.innerHeight == selectedInnerHeight,
      orElse: () => SymbolData(
        contentQuality: '',
        supportSpacing: '',
        outerWidth: '',
        innerHeight: '',
        symbol: '該当なし',
      ),
    );
    
    final part = partTable.firstWhere(
      (data) => data.symbol == result.symbol,
      orElse: () => PartData(
        symbol: '',
        upper: '該当なし',
        lower: '該当なし',
        joint: '該当なし',
        brace: '該当なし',
        support: '該当なし',
        additionalSupport: '該当なし',
      ),
    );

    setState(() {
      searchSymbol = result.symbol;
      searchPart = part;
      message = '';
    });
  }

  @override
  void initState() {
    super.initState();
    // アプリ起動時に内容品質量 1.0 のデータを初期ロード
    selectedContentQuality = '1.0';
    _loadSymbolData(selectedContentQuality);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('符号検索アプリ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('内容品質量 (t)', style: TextStyle(fontSize: 16)),
            _buildDropdown(contentQualities, selectedContentQuality, (value) {
              setState(() {
                selectedContentQuality = value;
                _loadSymbolData(value); // 選択が変わったらデータを再ロード
                searchSymbol = ''; // 検索結果をクリア
                searchPart = null;
              });
            }),
            const SizedBox(height: 16),
            const Text('支柱の間隔 (cm)', style: TextStyle(fontSize: 16)),
            _buildDropdown(supportSpacings, selectedSupportSpacing, (value) {
              setState(() {
                selectedSupportSpacing = value;
              });
            }),
            const SizedBox(height: 16),
            const Text('外のり幅 (cm)', style: TextStyle(fontSize: 16)),
            _buildDropdown(outerWidths, selectedOuterWidth, (value) {
              setState(() {
                selectedOuterWidth = value;
              });
            }),
            const SizedBox(height: 16),
            const Text('内のり高さ (cm)', style: TextStyle(fontSize: 16)),
            _buildDropdown(innerHeights, selectedInnerHeight, (value) {
              setState(() {
                selectedInnerHeight = value;
              });
            }),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _searchSymbol,
                child: const Text('符号を検索', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  const Text('検索結果:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  if (searchSymbol.isEmpty)
                    Text(
                      message,
                      style: const TextStyle(fontSize: 20, color: Colors.grey),
                    )
                  else ...[
                    Text(
                      '符号: $searchSymbol',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const SizedBox(height: 24),
                    _buildPartInfo(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 部材情報を表示するウィジェット
  Widget _buildPartInfo() {
    if (searchPart == null || searchPart!.symbol.isEmpty) {
      return const Text('部材情報がありません', style: TextStyle(color: Colors.red));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('--- 部材の組み合わせ ---', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildPartRow('上かまち', searchPart!.upper),
        _buildPartRow('下かまち', searchPart!.lower),
        _buildPartRow('部', searchPart!.joint),
        _buildPartRow('すじかい', searchPart!.brace),
        _buildPartRow('支柱', searchPart!.support),
        _buildPartRow('そえ柱', searchPart!.additionalSupport),
      ],
    );
  }

  // 部材情報の一行表示
  Widget _buildPartRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(value),
        ],
      ),
    );
  }

  // ドロップダウンメニューを生成する共通メソッド
  Widget _buildDropdown(List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          hint: const Text('選択してください'),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}