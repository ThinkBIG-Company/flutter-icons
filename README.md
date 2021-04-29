English | [简体中文](./README_zh-CN.md)

# flutter_icons 3.0.0-nullsafety.0

Customizable Icons for Flutter,Inspired by [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons)

## Notice
>> 1. icon names that begin with a number are preceded by a `$`prefix
>> 2. icon named with the dart keyword have the `_` suffix added

## Bundled Icon Sets

[Browse all](https://oblador.github.io/react-native-vector-icons/).

* [`AntDesign`](https://ant.design/) by AntFinance (**297** icons)
* [`Brandico`](https://github.com/fontello/brandico.font) by Fontello. **SOON**
* [`Elusive`](https://github.com/dovy/elusive-icons) by Team Redux **SOON**
* [`Entypo`](http://entypo.com) by Daniel Bruce (**411** icons) 
* [`EvilIcons`](http://evil-icons.io) by Alexander Madyankin & Roman Shamin (v1.10.1, **70** icons) 
* [`Feather`](http://feathericons.com) by Cole Bemis & Contributors (v4.28.0, **286** icons) 
* [`FontAwesome`](http://fortawesome.github.io/Font-Awesome/icons/) by Dave Gandy (v4.7.0, **675** icons)
* [`FontAwesome 5`](https://fontawesome.com) by Fonticons, Inc. (v5.7.0, **1500** (free))
* [`Fontelico`](https://github.com/fontello/fontelico.font) by Fontello. **SOON**
* [`Fontisto`](https://www.fontisto.com/icons) by Fontisto. (v3.0.4, **617** icons)
* [`Foundation`](http://zurb.com/playground/foundation-icon-fonts-3) by ZURB, Inc. (v3.0, **283** icons)
* [`Ionicons`](https://ionicons.com/) by the Ionic team (v5.1.2, **3681** icons)
* [`Linearicons`](https://linearicons.com/free) by Perxis **SOON**
* [`Linecons`](https://designmodo.com/linecons-free) by Design modo **SOON**
* [`Maki`](https://labs.mapbox.com/maki-icons) by Mapbox **SOON**
* [`MaterialCommunityIcons`](https://materialdesignicons.com/) by MaterialDesignIcons.com  (v5.4.45, **5346** icons)
* [`MaterialIcons`](https://material.io/resources/icons) by Google, Inc. (v4.0.0, **1562** icons)
* [`MfgLabs`](https://mfglabs.github.io/mfglabs-iconset) by MfgLabs **SOON**
* [`Meteocons`](https://www.alessioatzeni.com/meteocons) by Alessio Atzeni **SOON**
* [`ModernPictograms`](https://thedesignoffice.org/project/modern-pictograms) by John Caserta **SOON**
* [`Octicons`](http://octicons.github.com) by Github, Inc. (v8.4.1, **183** icons)
* [`RPGAwesome`](https://nagoshiashumari.github.io/Rpg-Awesome) by Daniela Howe and Ivan Montiel **SOON**
* [`SimpleLineIcons`](https://simplelineicons.github.io) by Sabbir & Contributors (v2.4.1, **189** icons)
* [`Typicons`](https://www.s-ings.com/typicons) by Stephen Hutchings **SOON**
* [`Weather Icons`](https://erikflowers.github.io/weather-icons/) by erikflowers (v2.0.10, **596** icons)
* [`WebSymbols`](https://github.com/fontello/websymbols-uni.font) by Just Be Nice studio **SOON**
* [`Zocial`](http://zocial.smcllns.com/) by Sam Collins (v1.0, **100** icons)

## Usage
To use this plugin, add `flutter_icons` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Widget

### IconToggle

| Prop                 | Description                                                                                                                                                                               |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| selectedIconData  | Icon is displayed when value is true |
| unselectedIconData | Icon is displayed when value is false |
| activeColor | When value is true, the icon color is displayed |
| inactiveColor | When value is false, the icon color is displayed |
| value| Whether this IconToggle is selected. |
| onChanged | Called when the value of the IconToggle should change. |
| duration| The duration of the transition from selected Icon to unselected Icon |
| reverseDuration | he duration of the transition from unselected Icon to selected Icon |
| transitionBuilder | Transition animation function between the selected Icon and the unselected Icon |


## Example

``` dart
// Import package
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

// 1.0.0 version used
Icon(AntDesign.stepforward),
Icon(Ionicons.ios_search),
Icon(FontAwesome.glass),
Icon(MaterialIcons.ac_unit),
Icon(FontAwesome5.address_book),
Icon(FontAwesome5Solid.address_book),
Icon(FontAwesome5Brands.$500px)

// After 1.1.0, the FlutterIcons class is provided to access all Icons
// Icon name in the original basis added icon set abbreviation name as suffix
// Here in after referred to as the following
//Ant Design Icons -> ant,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> faw,
//Font Awesome 5 Regular -> faw5
//Font Awesome 5 Solid -> faw5s
//Font Awesome 5 Brands -> faw5b
//Fontisto Icons -> fto,
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Material Community Icons -> mco,
//Material Icons -> mdi,
//Octicons Icons -> oct,
//Simple Line Icons -> sli,
//Zocial Icons -> zoc,
//Weather Icons -> wea
Icon(FlutterIcons.stepforward_ant)
Icon(FlutterIcons.html5_faw)
...
```

### How to keep only the fonts used in the project.

#### step 1
Execute the command
```
pub global activate split_icon
```
#### step2
Add the font you want to leave in the project's pubspec file
```dart
//Ant Design Icons -> ant,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> faw,
//Font Awesome 5 Regular -> faw5
//Font Awesome 5 Solid -> faw5s
//Font Awesome 5 Brands -> faw5b
//Fontisto Icons -> fto,
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Material Community Icons -> mco,
//Material Icons -> mdi,
//Octicons Icons -> oct,
//Simple Line Icons -> sli,
//Weather Icons -> wea
//Zocial Icons -> zoc,

...

flutter_icons:
  includes:
    - ant 
    - mco
 ...
 ```
    
#### step3
Execute the command in the project directory
``` 
split_icon
```

