
class GenericEntity {

  int id;

  Map<String, Object> toMap() {
    return {
      'mock': 'mock',
      'mock2': 'mock'
    };
  }

  Object fromMapGeneric (Map<String, Object> doc, int id) {
    return null;
  }
}