// Generated by CoffeeScript 1.6.1
var SideView,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

SideView = (function(_super) {

  __extends(SideView, _super);

  function SideView(frame) {
    SideView.__super__.constructor.call(this, frame);
    /*
    Please describe initialization processing of a class below from here.
    */

    this.CELLHEIGHT = 20;
    this.TABHEIGHT = 24;
    this.selecttab = 0;
    this.dispdata = [];
    this.sourceview = void 0;
    this.mediaview = void 0;
    this.documentpath = JSSearchPathForDirectoriesInDomains("JSDocumentDirectory");
    this.enforcepath = this.documentpath + "/../..";
    this.picturepath = JSSearchPathForDirectoriesInDomains("JSPictureDirectory");
    this.filemanager = new JSFileManager();
    this.setClipToBounds(false);
  }

  SideView.prototype.viewDidAppear = function() {
    var select,
      _this = this;
    SideView.__super__.viewDidAppear.call(this);
    /*
    Please describe the processing about a view below from here.
    */

    select = ["code", "media"];
    this.tabview = new JSSegmentedControl(select);
    this.tabview.setTextSize(9);
    this.tabview.setFrame(JSRectMake(0, 0, this._frame.size.width - 2, this.TABHEIGHT));
    this.tabview.setValue(this.selecttab);
    this.addSubview(this.tabview);
    this.tabview.addTarget(function() {
      if ((_this.mainview.glview != null)) {
        _this.mainview.glview.removeFromSuperview();
      }
      _this.selecttab = _this.tabview._selectedSegmentIndex;
      return _this.dispListView();
    });
    this.sourceview = new SourceView(JSRectMake(0, this.tabview._frame.size.height, this._frame.size.width, this._frame.size.height - this.tabview._frame.size.height - 64));
    this.sourceview._titleBar.setText("source list");
    this.addSubview(this.sourceview);
    this.mediaview = new MediaView(JSRectMake(0, this.tabview._frame.size.height, this._frame.size.width, this._frame.size.height - this.tabview._frame.size.height - 64));
    this.mediaview._titleBar.setText("media list");
    this.addSubview(this.mediaview);
    return this.dispListView();
  };

  SideView.prototype.dispListView = function(tab) {
    var dir, ext,
      _this = this;
    if (tab == null) {
      tab = parseInt(this.selecttab);
    }
    if ((this.addButton != null)) {
      this.addButton.removeFromSuperview();
    }
    if ((this.delButton != null)) {
      this.delButton.removeFromSuperview();
    }
    if ((this.renameButton != null)) {
      this.renameButton.removeFromSuperview();
    }
    switch (tab) {
      case 0:
        this.sourceview.lastedittab = void 0;
        dir = this.documentpath + "/src";
        ext = ["coffee"];
        if ((this.mainview.editorview != null)) {
          this.mainview.editorview.setHidden(false);
        }
        this.mainview.imageview.setHidden(true);
        this.sourceview.setHidden(false);
        this.mediaview.setHidden(true);
        this.addButton = new JSButton(JSRectMake(0, this._frame.size.height - 24, 32, 24));
        this.addButton.setButtonTitle("+");
        this.addSubview(this.addButton);
        this.filemanager.fileList(dir, ext, function(data) {
          var jdata;
          jdata = JSON.parse(data)['file'];
          _this.sourceview.dispdata = jdata;
          _this.sourceview.dispdata.sort(function(a, b) {
            if (a < b) {
              return -1;
            } else if (a > b) {
              return 1;
            } else {
              return 0;
            }
          });
          _this.sourceview.reloadData();
          return $(_this.sourceview._viewSelector + "_select").focus();
        });
        this.addButton.addTarget(function() {
          var alert;
          alert = new JSAlertView("Create New Class File", "Input new class file name.", [""]);
          alert.delegate = _this._self;
          alert.setAlertViewStyle("JSAlertViewStylePlainTextInput");
          alert.delegate = _this;
          alert.mode = "NEW_CLASS";
          _this.addSubview(alert);
          return alert.show();
        });
        this.delButton = new JSButton(JSRectMake(this._frame.size.width - 32, this._frame.size.height - 24, 32, 24));
        this.delButton.setButtonTitle("-");
        this.addSubview(this.delButton);
        return this.delButton.addTarget(function() {
          var alert, fname;
          fname = _this.sourceview.dispdata[_this.sourceview.lastedittab];
          if ((fname != null)) {
            alert = new JSAlertView("Caution", "Delete '" + fname + "' OK?");
            alert.delegate = _this._self;
            alert.cancel = true;
            alert.mode = "DELETE_FILE";
            alert.fname = fname;
            _this.addSubview(alert);
            return alert.show();
          }
        });
      case 1:
        this.mediaview.lastedittab = void 0;
        dir = this.documentpath + "/media";
        ext = ["png", "jpg", "gif", "mp3", "ogg", "dae"];
        if ((this.mainview.editorview != null)) {
          this.mainview.editorview.setHidden(true);
        }
        this.mainview.imageview.setHidden(false);
        this.sourceview.setHidden(true);
        this.mediaview.setHidden(false);
        this.addButton = new JSButton(JSRectMake(0, this._frame.size.height - 24, 64, 24));
        this.addButton.setStyle("JSFormButtonStyleImageUpload");
        this.addButton.delegate = this._self;
        this.addSubview(this.addButton);
        this.renameButton = new JSButton(JSRectMake(this.addButton._frame.size.width + 4, this._frame.size.height - 24, 64, 24));
        this.renameButton.setButtonTitle("リネーム");
        this.renameButton.addTarget(function() {
          var alert, fname, num;
          num = _this.mediaview.getSelect();
          fname = _this.mediaview.objectAtIndex(num);
          alert = new JSAlertView("ファイル名変更", "新しいファイル名を入力してください。", ["新ファイル名"]);
          alert.oldfname = fname;
          alert.setData([fname]);
          alert.cancel = true;
          alert.setAlertViewStyle("JSAlertViewStylePlainTextInput");
          alert.delegate = _this._self;
          alert.mode = "IMAGE_RENAME";
          _this.addSubview(alert);
          return alert.show();
        });
        this.addSubview(this.renameButton);
        this.delButton = new JSButton(JSRectMake(this._frame.size.width - 32, this._frame.size.height - 24, 32, 24));
        this.delButton.setButtonTitle("-");
        this.delButton.addTarget(function() {
          var alert, fname;
          fname = _this.mediaview.dispdata[_this.maediaview.lastedittab];
          if ((fname != null)) {
            alert = new JSAlertView("Caution", "Delete '" + fname + "' OK?");
            alert.delegate = _this._self;
            alert.cancel = true;
            alert.mode = "DELETE_IMAGE";
            alert.fname = fname;
            _this.addSubview(alert);
            return alert.show();
          }
        });
        this.addSubview(this.delButton);
        ext = ["png", "jpg", "gif", "mp3", "ogg", "dae"];
        return this.filemanager.fileList(dir, ext, function(data) {
          _this.mediaview.dispdata = JSON.parse(data)['file'];
          _this.mediaview.dispdata.sort(function(a, b) {
            if (a < b) {
              return -1;
            } else if (a > b) {
              return 1;
            } else {
              return 0;
            }
          });
          return _this.mediaview.reloadData();
        });
    }
  };

  SideView.prototype.didImageUpload = function(res) {
    var imgpath, savefile,
      _this = this;
    imgpath = this.picturepath + "/" + res.path;
    savefile = this.documentpath + "/media/" + res.path;
    return this.filemanager.moveItemAtPath(imgpath, savefile, function(err) {
      var ext, path, thumb;
      if (err === 1) {
        path = res.path;
        thumb = path.replace(/\./, "_s.");
        _this.filemanager.removeItemAtPath(_this.picturepath + "/.thumb/" + thumb);
        ext = ["png", "jpg", "gif", "mp3", "ogg", "dae"];
        return _this.filemanager.fileList(_this.documentpath + "/media", ext, function(data) {
          var jdata;
          jdata = JSON.parse(data);
          _this.mediaview.setListData(jdata['file']);
          return _this.mediaview.reload();
        });
      }
    });
  };

  SideView.prototype.clickedButtonAtIndex = function(ret, alert) {
    var ext, fname, jret, newfpath, oldfpath,
      _this = this;
    jret = JSON.parse(ret);
    switch (alert.mode) {
      case "NEW_CLASS":
        return $.post("syslibs/enforce.php", {
          mode: "derive",
          name: jret[0]
        }, function(data) {
          var ext;
          ext = ["coffee"];
          return _this.filemanager.fileList(_this.documentpath + "/src", ext, function(data) {
            var d, datatmp, _i, _len, _ref;
            datatmp = JSON.parse(data);
            _this.dispdata = [];
            _ref = datatmp['file'];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              d = _ref[_i];
              _this.dispdata.push(d);
            }
            _this.dispdata.sort();
            return _this.sourceview.reloadData();
          });
        });
      case "DELETE_FILE":
        if (ret === 1) {
          fname = alert.fname;
          return this.filemanager.removeItemAtPath(this.documentpath + "/src/" + alert.fname, function(err) {
            var ext;
            _this.mainview.editorview.setText("");
            _this.mainview.editorview.setEditable(false);
            _this.mainview.sourceinfo.setText("");
            _this.mainview.editfile = void 0;
            ext = ["coffee"];
            return _this.filemanager.fileList(_this.documentpath + "/src", ext, function(data) {
              var d, datatmp, _i, _len, _ref;
              datatmp = JSON.parse(data);
              _this.dispdata = [];
              _ref = datatmp['file'];
              for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                d = _ref[_i];
                _this.dispdata.push(d);
              }
              _this.dispdata.sort();
              _this.sourceview.reloadData();
              return _this.mainview.editorview.setText("");
            });
          });
        }
        break;
      case "DELETE_IMAGE":
        if (ret === 1) {
          fname = alert.fname;
          return this.filemanager.removeItemAtPath(this.documentpath + "/media/" + alert.fname, function(err) {
            var ext;
            _this.mainview.editorview.setText("");
            _this.mainview.editorview.setEditable(false);
            _this.mainview.sourceinfo.setText("");
            _this.mainview.editfile = void 0;
            ext = ["png", "jpg", "gif", "mp3", "ogg", "dae"];
            return _this.filemanager.fileList(_this.documentpath + "/media", ext, function(data) {
              var jdata;
              jdata = JSON.parse(data);
              _this.mediaview.setListData(jdata['file']);
              _this.mediaview.reload();
              return _this.mainview.imageRefresh();
            });
          });
        }
        break;
      case "IMAGE_RENAME":
        fname = jret[0];
        ext = fname.match(/.*\.(.*)/);
        if (ext === null) {
          alert = new JSAlertView("Caution", "拡張子を指定してください。");
          this.addSubview(alert);
          return alert.show();
        } else {
          oldfpath = this.documentpath + "/media/" + alert.oldfname;
          newfpath = this.documentpath + "/media/" + fname;
          return this.filemanager.moveItemAtPath(oldfpath, newfpath, function(err) {
            ext = ["png", "jpg", "gif", "mp3", "ogg", "dae"];
            return _this.filemanager.fileList(_this.documentpath + "/media", ext, function(data) {
              var jdata;
              jdata = JSON.parse(data);
              _this.mediaview.setListData(jdata['file']);
              return _this.mediaview.reload();
            });
          });
        }
    }
  };

  return SideView;

})(JSView);
