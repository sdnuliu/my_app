class TestGeneric {
  void start() {
    Cache<String> cache1=Cache();
    cache1.setItem("cache1", "123");
    print(cache1.getItem("cache1"));
    Cache<int> cache= Cache();
    cache.setItem("cache2", 1008);
    print(cache.getItem("cache2"));
  }
}

class Cache<T> {
  static final Map<String, Object> _cache = Map();

  void setItem(String key, T value) {
    _cache[key] = value;
  }

  T getItem(String key) {
    return _cache[key];
  }
}
