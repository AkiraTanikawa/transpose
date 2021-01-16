class Chord {
  static List<String> scale = [
    'C',
    'C#',
    'D',
    'D#',
    'E',
    'F',
    'F#',
    'G',
    'G#',
    'A',
    'A#',
    'B'
  ];

  String value;
  int index;

  Chord(String input , int i){
    value = input;
    index = i;
  }

  static List<Chord> parse(String text){
    var parts = text.split(" ");
    List<Chord> output =List<Chord>();
    for (var partItem in parts) {
      var chord = Chord(partItem,scale.indexOf(partItem));
      output.add(chord);
    } 

    return output;
  }

  Chord transpose(int difference){
    var outputChordName = scale[(index+difference)%12];
    return Chord(outputChordName,(index+difference)%12);
  }
}
