class Source {
  String? _id;
  String? _name;

  Source(this._id, this._name);

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }
}

class Feed {
  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Feed(this._source, this._author, this._title, this._description, this._url,
      this._urlToImage, this._publishedAt, this._content);


  Source? get source => _source;

  set source(Source? value) {
    _source = value;
  }

  String? get author => _author;

  set author(String? value) {
    _author = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }

  String? get url => _url;

  set url(String? value) {
    _url = value;
  }

  String? get urlToImage => _urlToImage;

  set urlToImage(String? value) {
    _urlToImage = value;
  }

  String? get publishedAt => _publishedAt;

  set publishedAt(String? value) {
    _publishedAt = value;
  }

  String? get content => _content;

  set content(String? value) {
    _content = value;
  }
}
