class Word {
  final int id;
  final String name;
  final String subtext;
  final String img;

  Word( {this.id, this.name, this.subtext, this.img});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'subtext': this.subtext,
      'img': this.img
    };
  }

  factory Word.fromMap(int id, Map<String, dynamic> map) {
    return Word(
      id: id,
      name: map['name'],
      subtext: map['subtext'],
      img: map['img'],
    );
  }

  Word copyWith({int id, String name, int yummyness}){
    return Word(
      id: id ?? this.id,
      name: name ?? this.name,
      subtext: name ?? this.subtext,
      img: img ?? this.img,
    );
  }
}