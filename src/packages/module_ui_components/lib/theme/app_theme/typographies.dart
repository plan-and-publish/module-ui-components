part of 'app_theme_data.dart';

enum TypographyFamily {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  headline7,
  subtitle1,
  subtitle2,
  body1,
  body2,
  button,
  caption,
  overLine,
  dropDownCaption,
  navItemCaption,
  navItemSectionCaption,
  dialogTitle,
  textInputHelper,
  textInputContentOutline,
  textInputContentFill,
  iconCardTitle,
}

enum FontFamily { manrope }

abstract class ITypographies {
  const ITypographies();

  ITypography byFontFamily([
    FontFamily? fontFamily,
  ]);
}

abstract class ITypography {
  const ITypography();

  TextStyle get headline1;
  TextStyle get headline2;
  TextStyle get headline3;
  TextStyle get headline4;
  TextStyle get headline5;
  TextStyle get headline6;
  TextStyle get headline7;
  TextStyle get subtitle1;
  TextStyle get subtitle2;
  TextStyle get body1;
  TextStyle get body2;
  TextStyle get button;
  TextStyle get caption;
  TextStyle get overLine;
  TextStyle get dropDownCaption;
  TextStyle get navItemCaption;
  TextStyle get navItemSectionCaption;
  TextStyle get dialogTitle;
  TextStyle get textInputHelper;
  TextStyle get textInputContentOutline;
  TextStyle get textInputContentFill;
  TextStyle get iconCardTitle;

  TextStyle byTypographyFamily(TypographyFamily? typographyFamily) {
    switch (typographyFamily) {
      case TypographyFamily.headline1:
        return headline1;
      case TypographyFamily.headline2:
        return headline2;
      case TypographyFamily.headline3:
        return headline3;
      case TypographyFamily.headline4:
        return headline4;
      case TypographyFamily.headline5:
        return headline5;
      case TypographyFamily.headline6:
        return headline6;
      case TypographyFamily.headline7:
        return headline7;
      case TypographyFamily.subtitle1:
        return subtitle1;
      case TypographyFamily.subtitle2:
        return subtitle2;
      case TypographyFamily.body1:
        return body1;
      case TypographyFamily.body2:
        return body2;
      case TypographyFamily.button:
        return button;
      case TypographyFamily.caption:
        return caption;
      case TypographyFamily.overLine:
        return overLine;
      case TypographyFamily.dropDownCaption:
        return dropDownCaption;
      case TypographyFamily.navItemCaption:
        return navItemCaption;
      case TypographyFamily.navItemSectionCaption:
        return navItemSectionCaption;
      case TypographyFamily.dialogTitle:
        return dialogTitle;
      case TypographyFamily.textInputHelper:
        return textInputHelper;
      case TypographyFamily.textInputContentOutline:
        return textInputContentOutline;
      case TypographyFamily.textInputContentFill:
        return textInputContentFill;
      case TypographyFamily.iconCardTitle:
        return iconCardTitle;
      default:
        return body1;
    }
  }
}
