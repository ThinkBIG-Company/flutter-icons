# flutter_icons 4.2.0-nullsafety.0

Customizable Icons for Flutter,Inspired by [react-native-vector-icons](https://github.com/oblador/react-native-vector-icons)

## Notice
>> 1. icon names that begin with a number are preceded by a `$`prefix
>> 2. icon named with a reserved dart keyword have also the `$` suffix added

## Bundled Icon Sets

[Browse all](https://oblador.github.io/react-native-vector-icons/).

* [`AntDesign`](https://ant.design/) by AntFinance (v3.0.0, **298** icons)
* [`AntDesign-Filled`](https://ant.design/) by AntFinance (v4.1.0 latest, **218** icons)
* [`AntDesign-Outlined`](https://ant.design/) by AntFinance (v4.1.0 latest, **420** icons)
* [`Brandico`](https://github.com/fontello/brandico.font) by Fontello. (v1.0.0 latest, **45** icons)
* [`Elusive`](https://github.com/dovy/elusive-icons) by Team Redux (v2.0.0 latest, **304** icons)
* [`Entypo`](http://entypo.com) by Daniel Bruce (v1.0.0 latest, **411** icons)
* [`EvilIcons`](http://evil-icons.io) by Alexander Madyankin & Roman Shamin (v1.10.1 latest, **70** icons)
* [`Feather`](http://feathericons.com) by Cole Bemis & Contributors (v4.28.0 latest, **286** icons)
* [`FontAwesome`](http://fortawesome.github.io/Font-Awesome/icons/) by Dave Gandy (v4.7.0, **786** icons)
* [`FontAwesome 5`](https://fontawesome.com) by Fonticons, Inc. (v5.15.3, **1500** (free))
* [`Fontelico`](https://github.com/fontello/fontelico.font) by Fontello. (v1.0.0 latest, **34** icons)
* [`Fontisto`](https://www.fontisto.com/icons) by Fontisto. (v3.0.4 latest, **617** icons)
* [`Foundation`](http://zurb.com/playground/foundation-icon-fonts-3) by ZURB, Inc. (v3.0.0 latest, **283** icons)
* [`Ionicons`](https://ionicons.com/) by the Ionic team (v5.5.1, **1332** icons)
* [`Linearicons`](https://linearicons.com/free) by Perxis (v1.0.0 latest, **170** icons)
* [`Linecons`](https://designmodo.com/linecons-free) by Design modo (v1.0.0 latest, **48** icons)
* [`Maki`](https://labs.mapbox.com/maki-icons) by Mapbox (v6.2.0 latest, **374** icons)
* [`MaterialCommunityIcons`](https://materialdesignicons.com/) by MaterialDesignIcons.com  (v5.4.45 latest, **5346** icons)
* [`MaterialIcons`](https://material.io/resources/icons) by Google, Inc. (v1.0.0 git -> May 10, 2021, **1842** icons)
* [`Meteocons`](https://www.alessioatzeni.com/meteocons/) by Alessio Atzeni (v1.0.0 latest, **47** icons)
* [`MfgLabs`](https://mfglabs.github.io/mfglabs-iconset) by MfgLabs (v1.0.0 latest, **187** icons)
* [`ModernPictograms`](https://thedesignoffice.org/project/modern-pictograms) by John Caserta (v1.0.0 latest, **91** icons)
* [`Octicons`](http://octicons.github.com) by Github, Inc. (v13.0.0 latest, **433** icons)
* [`RPGAwesome`](https://nagoshiashumari.github.io/Rpg-Awesome) by Daniela Howe and Ivan Montiel (v1.0.0 latest, **495** icons)
* [`SimpleLineIcons`](https://simplelineicons.github.io) by Sabbir & Contributors (v2.4.1 latest, **189** icons)
* [`Typicons`](https://www.s-ings.com/typicons) by Stephen Hutchings (v2.0.9, **293** icons)
* [`Weather Icons`](https://erikflowers.github.io/weather-icons/) by erikflowers (v2.0.10, **596** icons)
* [`WebSymbols`](https://github.com/fontello/websymbols-uni.font) by Just Be Nice studio (v1.0.0 latest, **85** icons)
* [`Zocial`](http://zocial.smcllns.com/) by Sam Collins (v1.0.0, **100** icons)

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

// The FlutterIcons class is provided to access all Icons
// Icon name in the original basis added icon set abbreviation name as suffix
// Here in after referred to as the following
//Ant Design Icons -> ant,
//Ant Design v4+ Filled Icons -> adf,
//Ant Design v4+ Outlined Icons -> ado,
//Brandico Icons -> bdo,
//Elusive Icons -> elu,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> fa,
//Font Awesome 5 Regular -> far
//Font Awesome 5 Brands -> fab
//Font Awesome 5 Solid -> fas
//Fontelico Icons -> fon,
//Fontisto Icons -> fto,
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Linearicons Icons -> lin,
//Linecons Icons -> lco,
//Maki Icons -> mak,
//Material Community Icons -> mco,
//Material Icons Baseline -> mib,
//Material Icons Outline -> mio,
//Material Icons Round -> mir,
//Material Icons Sharp -> mis,
//Material Icons TwoTone **Not available at this moment**,
//Meteocons Icons -> met,
//MfgLabs Icons -> mfg,
//Octicons Icons -> oct,
//Simple Line Icons -> sli,
//Weather Icons -> wea
//Zocial Icons -> zoc,
Icon(FlutterIcons.stepforward_ant)
Icon(FlutterIcons.html5_fa)
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
//Ant Design v4+ Filled Icons -> adf,
//Ant Design v4+ Outlined Icons -> ado,
//Brandico Icons -> bdo,
//Elusive Icons -> elu,
//Entypo Icons -> ent,
//Evil Icons -> evi,
//Feather Icons -> fea,
//Font Awesome Icons -> fa,
//Font Awesome 5 Regular -> far
//Font Awesome 5 Brands -> fab
//Font Awesome 5 Solid -> fas
//Fontelico Icons -> fon,
//Fontisto Icons -> fto,
//Foundation Icons -> fou,
//Ionicons Icons -> ion,
//Linearicons Icons -> lin,
//Linecons Icons -> lco,
//Maki Icons -> mak,
//Material Community Icons -> mco,
//Material Icons Baseline -> mib,
//Material Icons Outline -> mio,
//Material Icons Round -> mir,
//Material Icons Sharp -> mis,
//Material Icons TwoTone **Not available at this moment**,
//Meteocons Icons -> met,
//MfgLabs Icons -> mfg,
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

