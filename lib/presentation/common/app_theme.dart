// Flutter imports:
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.yellow[800],
    colorScheme: ColorScheme.light(
      primary: Colors.yellow[800]!,
      secondary: Colors.orange[700]!,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.yellow[800],
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange[700],
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.yellow[900],
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 14.0, color: Colors.black87),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.orange[700]!),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.grey[50],
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white, // 選択中のタブのテキスト色
      unselectedLabelColor: Colors.grey[300], // 非選択のタブのテキスト色
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.yellow[700]!, // インジケータの色
          width: 2.0, // インジケータの太さ
        ),
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white, // ドロワーの背景色
      elevation: 16.0, // ドロワーの影の高さ
      shape: RoundedRectangleBorder(
        // ドロワーの形状
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      // その他の設定...
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // Brightnessをdarkに設定
    brightness: Brightness.dark,

    // ダークテーマ用のプライマリカラー
    primaryColor: Colors.yellow[800],

    colorScheme: ColorScheme.dark(
      primary: Colors.yellow[800]!, // プライマリカラー
      secondary: Colors.orange[700]!, // アクセントカラー
      // ...他の色...
    ),

    // AppBarのテーマ設定
    appBarTheme: AppBarTheme(
      color: Colors.grey[850], // 暗めの色
      elevation: 0,
    ),

    // ボタンのテーマ設定
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.orange[700],
      textTheme: ButtonTextTheme.primary,
    ),

    // フローティングアクションボタンのテーマ
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.yellow[900],
    ),

    // テキストのテーマ設定
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 14.0, color: Colors.white70),
    ),

    // インプットデコレーションのテーマ（フォームフィールド用）
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.orange[700]!),
      ),
    ),

    // カードテーマ
    cardTheme: CardTheme(
      color: Colors.grey[800],
      shadowColor: Colors.black,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    tabBarTheme: TabBarTheme(
      labelColor: Colors.white, // 選択中のタブのテキスト色
      unselectedLabelColor: Colors.grey, // 非選択のタブのテキスト色
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.blue[300]!, // インジケータの色
          width: 2.0, // インジケータの太さ
        ),
      ),
    ),

    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[850], // ドロワーの背景色
      elevation: 16.0, // ドロワーの影の高さ
      shape: const RoundedRectangleBorder(
        // ドロワーの形状
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      // その他の設定...
    ),
  );
}
