import 'package:flutter/material.dart';
import '../Styles/ColorStyle.dart';
import '../Styles/EffectStyle.dart';
import '../Styles/TextStyles.dart';

import 'package:country_picker/country_picker.dart';




class CountryPicker extends StatefulWidget {

  double radius;
  Color? colorBorder;
  Color? colorBG;
  Widget? icon;
  EdgeInsets padding;
  Color colorIcon;
  TextStyle textStyle;
  double height;
  double fontSizeFlagEmoji;
  String displayNameNoCountryCode;
  String flagEmoji;

  CountryPicker({Key? key,
    this.radius = 4,
    this.colorBorder = Colors.grey,
    this.colorBG = Colors.white,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
      size: 26,
      color: Colors.black,
    ),
    this.padding = const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 14),
    this.colorIcon = Colors.grey,
    this.textStyle = const TextStyle(),
    this.height = 50,
    this.fontSizeFlagEmoji = 14,
    this.displayNameNoCountryCode = 'United Kingdom',
    this.flagEmoji = '🇬🇧',
  }) : super(key: key);

  @override
  _CountryPickerState createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: widget.height,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: widget.colorBG!,
            borderRadius: EffectStyle.radiusCustom(widget.radius),
            border: Border.all(
              color: widget.colorBorder!,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    widget.flagEmoji,
                    style: TextStyle(
                        fontSize: widget.fontSizeFlagEmoji
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      widget.displayNameNoCountryCode,
                      style: (widget.displayNameNoCountryCode == 'United Kingdom')
                          ? TextStylesProductSans.textStyles_14.apply(
                        color: ColorStyle.grey,
                        fontWeightDelta: 2,
                      ) : widget.textStyle,
                    ),
                  ),
                ],
              ),
            ),
            widget.icon!
          ],
        ),
      ),
      onTap: () {
        showCountryPicker(
          context: context,
          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          exclude: <String>['KN', 'MF'],
          //Optional. Shows phone code before the country name.
          showPhoneCode: true,
          showWorldWide: false,
          onSelect: (Country country) {
            print(country.displayNameNoCountryCode);
            print(country.displayNameNoCountryCode);
            setState(() {
              widget.displayNameNoCountryCode = country.displayNameNoCountryCode.split('(')[0];
              widget.flagEmoji = country.flagEmoji;
            });
          },
          // Optional. Sets the theme for the country list picker.
          countryListTheme: CountryListThemeData(
            // Optional. Sets the border radius for the bottomsheet.
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CountryPickerPhoneCode extends StatefulWidget {
  double radius;
  Color colorBorder;
  Widget? icon;
  EdgeInsets padding;
  TextStyle textStyle;
  Color? colorBG;

  CountryPickerPhoneCode({Key? key,
    this.radius = 4,
    this.colorBorder = Colors.grey,
    this.icon,
    this.padding = const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 14),
    this.textStyle = const TextStyle(),
    this.colorBG,
  }) : super(key: key);

  String flagEmoji = '🇬🇧';
  String countryCode = 'UK';
  String phoneCode = '44';



  @override
  _CountryPickerPhoneCodeState createState() => _CountryPickerPhoneCodeState();
}

class _CountryPickerPhoneCodeState extends State<CountryPickerPhoneCode> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.colorBG,
          borderRadius: EffectStyle.radiusCustom(widget.radius),
          border: Border.all(
            color: widget.colorBorder,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.flagEmoji,
              style: TextStylesProductSans.textStyles_14.apply(
                color: Colors.black,
                fontWeightDelta: 0,
              ),
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "+"+widget.phoneCode,
              style: (widget.phoneCode == '44')
                  ? TextStylesProductSans.textStyles_14.apply(
                color: ColorStyle.grey,
                fontWeightDelta: 2,
              ) : widget.textStyle,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              widget.countryCode,
              style: (widget.phoneCode == '44')
                  ? TextStylesProductSans.textStyles_14.apply(
                color: ColorStyle.grey,
                fontWeightDelta: 2,
              ) : widget.textStyle,
            ),
            if (widget.icon != null)
              widget.icon!
          ],
        ),
      ),
      onTap: () {
        showCountryPicker(
          context: context,
          exclude: <String>['KN', 'MF'],
          showPhoneCode: true,
          showWorldWide: false,
          onSelect: (Country country) {
            print('Select country: ${country.displayName}');
            print('Select country: ${country.displayNameNoCountryCode}');
            print('Select country: ${country.flagEmoji}');
            print('Select country: ${country.phoneCode}');
            print('Select country: ${country.countryCode}');

            setState(() {
              widget.countryCode =
                  country.countryCode;
              widget.flagEmoji = country.flagEmoji;
              widget.phoneCode = country.phoneCode;
            });
          },
          // Optional. Sets the theme for the country list picker.
          countryListTheme: CountryListThemeData(
            // Optional. Sets the border radius for the bottomsheet.
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CountryPickerCountryCode extends StatefulWidget {
  double radius;
  Color? colorBorder;
  Color? colorBG;
  Widget? icon;
  EdgeInsets padding;
  Color colorIcon;
  TextStyle textStyle;
  double height;
  double fontSizeFlagEmoji;
  String countryCode;
  String flagEmoji;

  CountryPickerCountryCode({Key? key,
    this.radius = 4,
    this.colorBorder = Colors.grey,
    this.colorBG = Colors.white,
    this.icon = const Icon(
      Icons.keyboard_arrow_down,
      size: 26,
      color: Colors.black,
    ),
    this.padding = const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 14),
    this.colorIcon = Colors.grey,
    this.textStyle = const TextStyle(),
    this.height = 50,
    this.fontSizeFlagEmoji = 14,
    this.countryCode = 'United Kingdom',
    this.flagEmoji = '🇬🇧',
  }) : super(key: key);



  @override
  _CountryPickerCountryCodeState createState() => _CountryPickerCountryCodeState();
}

class _CountryPickerCountryCodeState extends State<CountryPickerCountryCode> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: widget.height,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: widget.colorBG!,
            borderRadius: EffectStyle.radiusCustom(widget.radius),
            border: Border.all(
              color: widget.colorBorder!,
              width: 1,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  widget.flagEmoji,
                  style: TextStyle(
                      fontSize: widget.fontSizeFlagEmoji
                  ),
                ),
                SizedBox(width: 6,),
                Text(
                  widget.countryCode,
                  textAlign: TextAlign.center,
                  style: (widget.countryCode == 'United Kingdom')
                      ? TextStylesProductSans.textStyles_14.apply(
                    color: ColorStyle.grey,
                    fontWeightDelta: 2,
                  ) : widget.textStyle,
                ),
              ],
            ),
            widget.icon!
          ],
        ),
      ),
      onTap: () {
        showCountryPicker(
          context: context,
          //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
          exclude: <String>['KN', 'MF'],
          //Optional. Shows phone code before the country name.
          showPhoneCode: true,
          showWorldWide: false,
          onSelect: (Country country) {
            print(country.displayNameNoCountryCode);
            print(country.displayNameNoCountryCode);
            setState(() {
              widget.countryCode = country.countryCode;
              widget.flagEmoji = country.flagEmoji;
            });
          },

          countryListTheme: CountryListThemeData(
            // Optional. Sets the border radius for the bottomsheet.
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            // Optional. Styles the search field.
            inputDecoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Start typing to search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withOpacity(0.2),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

