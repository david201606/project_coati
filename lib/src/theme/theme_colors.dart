import 'package:flutter/material.dart';

class ColorsPalettes{
  ColorScheme lightColors() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary : Color(0xFF884196),
      onPrimary : Color(0xFFFFFFFF),
      primaryContainer : Color(0xFFFFD6FF),
      onPrimaryContainer : Color(0xFF350042),
      secondary : Color(0xFF6B596B),
      onSecondary : Color(0xFFFFFFFF),
      secondaryContainer : Color(0xFFF3DBF1),
      onSecondaryContainer : Color(0xFF251726),
      tertiary : Color(0xFF82524B),
      onTertiary : Color(0xFFFFFFFF),
      tertiaryContainer : Color(0xFFFFDAD3),
      onTertiaryContainer : Color(0xFF32110D),
      error : Color(0xFFBA1B1B),
      errorContainer : Color(0xFFFFDAD4),
      onError : Color(0xFFFFFFFF),
      onErrorContainer : Color(0xFF410001),
      background : Color(0xFFFCFCFC),
      onBackground : Color(0xFF1E1A1E),
      surface : Color(0xFFFCFCFC),
      onSurface : Color(0xFF1E1A1E),
      surfaceVariant : Color(0xFFECDFE8),
      onSurfaceVariant : Color(0xFF4D444C),
      outline : Color(0xFF7F747D),
      onInverseSurface : Color(0xFFF7EEF3),
      inverseSurface : Color(0xFF332F32),
      inversePrimary : Color(0xFFF8ACFF),
      shadow : Color(0xFF000000),
    );
  }
  ColorScheme darkColors() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary : Color(0xFFF8ACFF),
      onPrimary : Color(0xFF530A63),
      primaryContainer : Color(0xFF6E287C),
      onPrimaryContainer : Color(0xFFFFD6FF),
      secondary : Color(0xFFD6BFD5),
      onSecondary : Color(0xFF3A2B3B),
      secondaryContainer : Color(0xFF524153),
      onSecondaryContainer : Color(0xFFF3DBF1),
      tertiary : Color(0xFFF6B8AF),
      onTertiary : Color(0xFF4C2520),
      tertiaryContainer : Color(0xFF673B35),
      onTertiaryContainer : Color(0xFFFFDAD3),
      error : Color(0xFFFFB4A9),
      errorContainer : Color(0xFF930006),
      onError : Color(0xFF680003),
      onErrorContainer : Color(0xFFFFDAD4),
      background : Color(0xFF1E1A1E),
      onBackground : Color(0xFFE9E0E5),
      surface : Color(0xFF1E1A1E),
      onSurface : Color(0xFFE9E0E5),
      surfaceVariant : Color(0xFF4D444C),
      onSurfaceVariant : Color(0xFFCFC3CC),
      outline : Color(0xFF988D96),
      onInverseSurface : Color(0xFF1E1A1E),
      inverseSurface : Color(0xFFE9E0E5),
      inversePrimary : Color(0xFF884196),
      shadow : Color(0xFF000000),
    );
  }

}

