import 'package:flutter/widgets.dart';

/// Direct [IconData] constants for the Font Awesome glyphs used in this app.
///
/// Using raw [IconData] constants with [AppIcon] ensures Flutter's release
/// icon tree-shaker (`const_finder`) reliably preserves every glyph in both
/// `FontAwesomeBrands` and `FontAwesomeSolid` without needing
/// `--no-tree-shake-icons`.
abstract final class AppIcons {
  static const String _brands = 'FontAwesomeBrands';
  static const String _solid = 'FontAwesomeSolid';
  static const String _pkg = 'font_awesome_flutter';

  static const IconData github = IconData(
    0xf09b,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData linkedin = IconData(
    0xf08c,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData youtube = IconData(
    0xf167,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData externalLink = IconData(
    0xf08e,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
  static const IconData flutter = IconData(
    0xe694,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData unity = IconData(
    0xe049,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData cube = IconData(
    0xf1b2,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
  static const IconData gamepad = IconData(
    0xf11b,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
  static const IconData gitAlt = IconData(
    0xf841,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData mobile = IconData(
    0xf3cd,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
  static const IconData python = IconData(
    0xf3e2,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData code = IconData(
    0xf121,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
  static const IconData js = IconData(
    0xf3b8,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData docker = IconData(
    0xf395,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData linux = IconData(
    0xf17c,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData aws = IconData(
    0xf375,
    fontFamily: _brands,
    fontPackage: _pkg,
  );
  static const IconData database = IconData(
    0xf1c0,
    fontFamily: _solid,
    fontPackage: _pkg,
  );
}

/// Renders non-square Font Awesome glyphs without clipping, respecting
/// ambient [IconTheme] size and color.
class AppIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;

  const AppIcon(this.icon, {super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    final effectiveSize = size ?? iconTheme.size ?? 24.0;
    final effectiveColor = color ?? iconTheme.color;

    return RichText(
      overflow: TextOverflow.visible,
      textDirection: Directionality.of(context),
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          inherit: false,
          color: effectiveColor,
          fontSize: effectiveSize,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          height: 1.0,
        ),
      ),
    );
  }
}
