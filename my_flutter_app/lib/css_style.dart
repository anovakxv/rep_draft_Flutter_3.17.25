import 'package:flutter/material.dart';

/// A utility class that provides CSS-like styling capabilities for Flutter widgets
class CssStyle {
  final Map<String, dynamic> _styles;

  CssStyle(this._styles);

  /// Factory constructor to create styles from a CSS-like map
  factory CssStyle.fromMap(Map<String, dynamic> styles) {
    return CssStyle(styles);
  }

  /// Get a specific style property
  dynamic get(String property) {
    return _styles[property];
  }

  /// Convert CSS-like color values to Flutter Colors
  static Color? parseColor(String? colorValue) {
    if (colorValue == null) return null;
    // Handle hex colors
    if (colorValue.startsWith('#')) {
      String hex = colorValue.replaceFirst('#', '');
      if (hex.length == 6) {
        hex = 'FF$hex'; // Add alpha if not present
      }
      return Color(int.parse(hex, radix: 16));
    }
    // Handle rgba
    if (colorValue.startsWith('rgba(')) {
      List<String> values = colorValue
          .substring(5, colorValue.length - 1)
          .split(',')
          .map((e) => e.trim())
          .toList();
      return Color.fromRGBO(
        int.parse(values[0]),
        int.parse(values[1]),
        int.parse(values[2]),
        double.parse(values[3]),
      );
    }
    // Handle rgb
    if (colorValue.startsWith('rgb(')) {
      List<String> values = colorValue
          .substring(4, colorValue.length - 1)
          .split(',')
          .map((e) => e.trim())
          .toList();
      return Color.fromRGBO(
        int.parse(values[0]),
        int.parse(values[1]),
        int.parse(values[2]),
        1.0,
      );
    }
    // Handle named colors
    switch (colorValue.toLowerCase()) {
      case 'transparent':
        return Colors.transparent;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      default:
        return null;
    }
  }

  /// Apply CSS-like styles to a container
  static BoxDecoration getBoxDecoration(Map<String, dynamic> styles) {
    return BoxDecoration(
      color: parseColor(styles['backgroundColor'] as String?),
      border: _getBorder(styles),
      borderRadius: _getBorderRadius(styles),
      boxShadow: _getBoxShadow(styles),
    );
  }

  /// Parse border from CSS-like styles
  static Border? _getBorder(Map<String, dynamic> styles) {
    if (styles.containsKey('border')) {
      String borderValue = styles['border'] as String;
      List<String> parts = borderValue.split(' ');
      if (parts.length >= 3) {
        double width = double.tryParse(parts[0].replaceAll('px', '')) ?? 1.0;
        String style = parts[1]; // solid, dashed, etc.
        Color color = parseColor(parts[2]) ?? Colors.black;
        return Border.all(
          width: width,
          style: style == 'dashed'
              ? BorderStyle.none
              : BorderStyle.solid, // Flutter doesn't support dashed directly
          color: color,
        );
      }
    }
    // Handle individual borders
    Border? border;
    if (styles.containsKey('borderTop')) {
      BorderSide side = _parseBorderSide(styles['borderTop'] as String);
      border = Border(top: side);
    }
    if (styles.containsKey('borderRight')) {
      BorderSide side = _parseBorderSide(styles['borderRight'] as String);
      border = (border ?? const Border()).copyWith(right: side);
    }
    if (styles.containsKey('borderBottom')) {
      BorderSide side = _parseBorderSide(styles['borderBottom'] as String);
      border = (border ?? const Border()).copyWith(bottom: side);
    }
    if (styles.containsKey('borderLeft')) {
      BorderSide side = _parseBorderSide(styles['borderLeft'] as String);
      border = (border ?? const Border()).copyWith(left: side);
    }
    return border;
  }

  /// Parse a border side from CSS-like string
  static BorderSide _parseBorderSide(String value) {
    List<String> parts = value.split(' ');
    double width = 1.0;
    Color color = Colors.black;
    if (parts.isNotEmpty) {
      width = double.tryParse(parts[0].replaceAll('px', '')) ?? 1.0;
    }
    if (parts.length > 2) {
      color = parseColor(parts[2]) ?? Colors.black;
    }
    return BorderSide(width: width, color: color);
  }

  /// Parse border radius from CSS-like styles
  static BorderRadius? _getBorderRadius(Map<String, dynamic> styles) {
    if (styles.containsKey('borderRadius')) {
      String value = styles['borderRadius'] as String;
      double radius = double.tryParse(value.replaceAll('px', '')) ?? 0.0;
      return BorderRadius.circular(radius);
    }
    return null;
  }

  /// Parse box shadow from CSS-like styles
  static List<BoxShadow>? _getBoxShadow(Map<String, dynamic> styles) {
    if (styles.containsKey('boxShadow')) {
      String value = styles['boxShadow'] as String;
      List<String> parts = value.split(' ');
      if (parts.length >= 4) {
        double offsetX = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        double offsetY = double.tryParse(parts[1].replaceAll('px', '')) ?? 0.0;
        double blurRadius =
            double.tryParse(parts[2].replaceAll('px', '')) ?? 0.0;
        Color color = parseColor(parts[3]) ?? Colors.black.withOpacity(0.2);
        return [
          BoxShadow(
            color: color,
            offset: Offset(offsetX, offsetY),
            blurRadius: blurRadius,
          ),
        ];
      }
    }
    return null;
  }

  /// Apply CSS-like text styles
  static TextStyle getTextStyle(Map<String, dynamic> styles) {
    return TextStyle(
      color: parseColor(styles['color'] as String?),
      fontSize: _parseFontSize(styles['fontSize']),
      fontWeight: _parseFontWeight(styles['fontWeight']),
      fontFamily: styles['fontFamily'] as String?,
      decoration: _parseTextDecoration(styles['textDecoration']),
      letterSpacing: _parseLetterSpacing(styles['letterSpacing']),
    );
  }

  /// Parse font size from CSS-like value
  static double? _parseFontSize(dynamic fontSize) {
    if (fontSize == null) return null;
    if (fontSize is double) return fontSize;
    if (fontSize is int) return fontSize.toDouble();
    if (fontSize is String) {
      return double.tryParse(fontSize.replaceAll('px', ''));
    }
    return null;
  }

  /// Parse font weight from CSS-like value
  static FontWeight? _parseFontWeight(dynamic fontWeight) {
    if (fontWeight == null) return null;
    if (fontWeight is String) {
      switch (fontWeight) {
        case 'normal':
          return FontWeight.normal;
        case 'bold':
          return FontWeight.bold;
        case '100':
          return FontWeight.w100;
        case '200':
          return FontWeight.w200;
        case '300':
          return FontWeight.w300;
        case '400':
          return FontWeight.w400;
        case '500':
          return FontWeight.w500;
        case '600':
          return FontWeight.w600;
        case '700':
          return FontWeight.w700;
        case '800':
          return FontWeight.w800;
        case '900':
          return FontWeight.w900;
        default:
          return FontWeight.normal;
      }
    }
    if (fontWeight is int) {
      return FontWeight.values.firstWhere(
        (weight) => weight.index == fontWeight ~/ 100,
        orElse: () => FontWeight.normal,
      );
    }
    return null;
  }

  /// Parse text decoration from CSS-like value
  static TextDecoration? _parseTextDecoration(dynamic decoration) {
    if (decoration == null) return null;
    switch (decoration) {
      case 'underline':
        return TextDecoration.underline;
      case 'line-through':
        return TextDecoration.lineThrough;
      case 'overline':
        return TextDecoration.overline;
      default:
        return null;
    }
  }

  /// Parse letter spacing from CSS-like value
  static double? _parseLetterSpacing(dynamic letterSpacing) {
    if (letterSpacing == null) return null;
    if (letterSpacing is double) return letterSpacing;
    if (letterSpacing is int) return letterSpacing.toDouble();
    if (letterSpacing is String) {
      return double.tryParse(letterSpacing.replaceAll('px', ''));
    }
    return null;
  }

  /// Apply CSS-like margin
  static EdgeInsets getMargin(Map<String, dynamic> styles) {
    double top = 0.0;
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
    if (styles.containsKey('margin')) {
      String margin = styles['margin'] as String;
      List<String> parts = margin.split(' ');
      if (parts.length == 1) {
        double value = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        top = right = bottom = left = value;
      } else if (parts.length == 2) {
        double vertical = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        double horizontal =
            double.tryParse(parts[1].replaceAll('px', '')) ?? 0.0;
        top = bottom = vertical;
        left = right = horizontal;
      } else if (parts.length == 4) {
        top = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        right = double.tryParse(parts[1].replaceAll('px', '')) ?? 0.0;
        bottom = double.tryParse(parts[2].replaceAll('px', '')) ?? 0.0;
        left = double.tryParse(parts[3].replaceAll('px', '')) ?? 0.0;
      }
    }
    // Individual margins override the combined margin
    if (styles.containsKey('marginTop')) {
      top = double.tryParse(
            styles['marginTop'].toString().replaceAll('px', ''),
          ) ??
          top;
    }
    if (styles.containsKey('marginRight')) {
      right = double.tryParse(
            styles['marginRight'].toString().replaceAll('px', ''),
          ) ??
          right;
    }
    if (styles.containsKey('marginBottom')) {
      bottom = double.tryParse(
            styles['marginBottom'].toString().replaceAll('px', ''),
          ) ??
          bottom;
    }
    if (styles.containsKey('marginLeft')) {
      left = double.tryParse(
            styles['marginLeft'].toString().replaceAll('px', ''),
          ) ??
          left;
    }
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  /// Apply CSS-like padding
  static EdgeInsets getPadding(Map<String, dynamic> styles) {
    double top = 0.0;
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
    if (styles.containsKey('padding')) {
      String padding = styles['padding'] as String;
      List<String> parts = padding.split(' ');
      if (parts.length == 1) {
        double value = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        top = right = bottom = left = value;
      } else if (parts.length == 2) {
        double vertical = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        double horizontal =
            double.tryParse(parts[1].replaceAll('px', '')) ?? 0.0;
        top = bottom = vertical;
        left = right = horizontal;
      } else if (parts.length == 4) {
        top = double.tryParse(parts[0].replaceAll('px', '')) ?? 0.0;
        right = double.tryParse(parts[1].replaceAll('px', '')) ?? 0.0;
        bottom = double.tryParse(parts[2].replaceAll('px', '')) ?? 0.0;
        left = double.tryParse(parts[3].replaceAll('px', '')) ?? 0.0;
      }
    }
    // Individual paddings override the combined padding
    if (styles.containsKey('paddingTop')) {
      top = double.tryParse(
            styles['paddingTop'].toString().replaceAll('px', ''),
          ) ??
          top;
    }
    if (styles.containsKey('paddingRight')) {
      right = double.tryParse(
            styles['paddingRight'].toString().replaceAll('px', ''),
          ) ??
          right;
    }
    if (styles.containsKey('paddingBottom')) {
      bottom = double.tryParse(
            styles['paddingBottom'].toString().replaceAll('px', ''),
          ) ??
          bottom;
    }
    if (styles.containsKey('paddingLeft')) {
      left = double.tryParse(
            styles['paddingLeft'].toString().replaceAll('px', ''),
          ) ??
          left;
    }
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}

/// Extension method to apply CSS-like styles to Container widgets
extension CssContainer on Container {
  static Container styled(Map<String, dynamic> styles, {Widget? child}) {
    return Container(
      width: styles['width'] != null
          ? double.tryParse(styles['width'].toString().replaceAll('px', ''))
          : null,
      height: styles['height'] != null
          ? double.tryParse(
              styles['height'].toString().replaceAll('px', ''),
            )
          : null,
      margin: CssStyle.getMargin(styles),
      padding: CssStyle.getPadding(styles),
      decoration: CssStyle.getBoxDecoration(styles),
      child: child,
    );
  }
}

/// Extension method to apply CSS-like styles to Text widgets
extension CssText on Text {
  static Text styled(String text, Map<String, dynamic> styles) {
    return Text(
      text,
      style: CssStyle.getTextStyle(styles),
      textAlign: _getTextAlign(styles['textAlign']),
    );
  }

  static TextAlign? _getTextAlign(dynamic align) {
    if (align == null) return null;
    switch (align) {
      case 'center':
        return TextAlign.center;
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'justify':
        return TextAlign.justify;
      default:
        return null;
    }
  }
}
