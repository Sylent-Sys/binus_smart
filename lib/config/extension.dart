extension StringExtension on String {
    String sentencesCase() {
      if(isEmpty) return this;
      return split(' ').map((v) => v[0].toUpperCase()+v.substring(1).toLowerCase()).join(' ');
    }
}