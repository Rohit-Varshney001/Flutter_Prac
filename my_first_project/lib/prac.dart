
import 'dart:collection';
import 'dart:io';

void main(){

  // final moonCount = <String, int>{'Mercury': 0, 'Venus': 0, 'Earth': 1,
  //   'Mars': 2, 'Jupiter': 79, 'Saturn': 82, 'Uranus': 27, 'Neptune': 14};
  // final mapFrom = Map.from(moonCount);
  // print(mapFrom);
  //
  // var numbers = [1,2,3,4];
  // Map itMap = Map.fromIterable(numbers,
  //   key: (item) => item,
  //   value: (item2) => item2*item2 );
  // print(itMap);
  //
  // final planets = <int, String>{1: 'Mercury', 2: 'Venus', 3: 'Earth'};
  // final unmodifiableMap = Map.unmodifiable(planets);
  // print(unmodifiableMap);
  // unmodifiableMap[4] = 'Mars';
  // print(unmodifiableMap);

  final planets = <int, String>{1: 'Mercury', 2: 'Venus',
    3: 'Earth', 5: 'Mars'};
  final gasGiants = <int, String>{5: 'Jupiter', 6: 'Saturn'};
  final iceGiants = <int, String>{7: 'Uranus', 8: 'Neptune'};
  planets.addEntries(gasGiants.entries);
  planets.addEntries(iceGiants.entries);

  print(planets);


}
