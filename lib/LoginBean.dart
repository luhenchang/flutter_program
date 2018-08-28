class LoginBean {
  String msg;
  int code;
  Data data;

  LoginBean({this.msg, this.code, this.data});

  LoginBean.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Null createBy;
  Null createDate;
  int delFlag;
  String deptId;
  String deptName;
  String email;
  String fullname;
  String jobNum;
  List<MobileMenulists> mobileMenulists;
  String password;
  String phone;
  Null photo;
  List<String> roleIdlists;
  String roleIds;
  String roleNames;
  String salt;
  int status;
  Null updateBy;
  Null updateDate;
  String userId;
  String username;
  Null workloadCount;
  Null workloadTimeSum;
  String wxNum;

  Data(
      {this.createBy,
        this.createDate,
        this.delFlag,
        this.deptId,
        this.deptName,
        this.email,
        this.fullname,
        this.jobNum,
        this.mobileMenulists,
        this.password,
        this.phone,
        this.photo,
        this.roleIdlists,
        this.roleIds,
        this.roleNames,
        this.salt,
        this.status,
        this.updateBy,
        this.updateDate,
        this.userId,
        this.username,
        this.workloadCount,
        this.workloadTimeSum,
        this.wxNum});

  Data.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createDate = json['createDate'];
    delFlag = json['delFlag'];
    deptId = json['deptId'];
    deptName = json['deptName'];
    email = json['email'];
    fullname = json['fullname'];
    jobNum = json['jobNum'];
    if (json['mobileMenulists'] != null) {
      mobileMenulists = new List<MobileMenulists>();
      json['mobileMenulists'].forEach((v) {
        mobileMenulists.add(new MobileMenulists.fromJson(v));
      });
    }
    password = json['password'];
    phone = json['phone'];
    photo = json['photo'];
    roleIdlists = json['roleIdlists'].cast<String>();
    roleIds = json['roleIds'];
    roleNames = json['roleNames'];
    salt = json['salt'];
    status = json['status'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
    userId = json['userId'];
    username = json['username'];
    workloadCount = json['workloadCount'];
    workloadTimeSum = json['workloadTimeSum'];
    wxNum = json['wxNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['delFlag'] = this.delFlag;
    data['deptId'] = this.deptId;
    data['deptName'] = this.deptName;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['jobNum'] = this.jobNum;
    if (this.mobileMenulists != null) {
      data['mobileMenulists'] =
          this.mobileMenulists.map((v) => v.toJson()).toList();
    }
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['roleIdlists'] = this.roleIdlists;
    data['roleIds'] = this.roleIds;
    data['roleNames'] = this.roleNames;
    data['salt'] = this.salt;
    data['status'] = this.status;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['workloadCount'] = this.workloadCount;
    data['workloadTimeSum'] = this.workloadTimeSum;
    data['wxNum'] = this.wxNum;
    return data;
  }
}

class MobileMenulists {
  String code;
  Null createBy;
  Null createDate;
  int delFlag;
  List<Lists> lists;
  String menuId;
  String name;
  Null open;
  String parentId;
  String parentName;
  String perms;
  Null updateBy;
  String updateDate;

  MobileMenulists(
      {this.code,
        this.createBy,
        this.createDate,
        this.delFlag,
        this.lists,
        this.menuId,
        this.name,
        this.open,
        this.parentId,
        this.parentName,
        this.perms,
        this.updateBy,
        this.updateDate});

  MobileMenulists.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    createBy = json['createBy'];
    createDate = json['createDate'];
    delFlag = json['delFlag'];
    if (json['lists'] != null) {
      lists = new List<Lists>();
      json['lists'].forEach((v) {
        lists.add(new Lists.fromJson(v));
      });
    }
    menuId = json['menuId'];
    name = json['name'];
    open = json['open'];
    parentId = json['parentId'];
    parentName = json['parentName'];
    perms = json['perms'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['delFlag'] = this.delFlag;
    if (this.lists != null) {
      data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    data['menuId'] = this.menuId;
    data['name'] = this.name;
    data['open'] = this.open;
    data['parentId'] = this.parentId;
    data['parentName'] = this.parentName;
    data['perms'] = this.perms;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    return data;
  }
}

class Lists {
  String code;
  Null createBy;
  Null createDate;
  int delFlag;
  List<Null> lists;
  String menuId;
  String name;
  Null open;
  String parentId;
  String parentName;
  String perms;
  Null updateBy;
  Null updateDate;

  Lists(
      {this.code,
        this.createBy,
        this.createDate,
        this.delFlag,
        this.lists,
        this.menuId,
        this.name,
        this.open,
        this.parentId,
        this.parentName,
        this.perms,
        this.updateBy,
        this.updateDate});

  Lists.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    createBy = json['createBy'];
    createDate = json['createDate'];
    delFlag = json['delFlag'];
    if (json['lists'] != null) {
      lists = new List<Null>();
      json['lists'].forEach((v) {
       // lists.add(new Null.fromJson(v));
      });
    }
    menuId = json['menuId'];
    name = json['name'];
    open = json['open'];
    parentId = json['parentId'];
    parentName = json['parentName'];
    perms = json['perms'];
    updateBy = json['updateBy'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['createBy'] = this.createBy;
    data['createDate'] = this.createDate;
    data['delFlag'] = this.delFlag;
    if (this.lists != null) {
      //data['lists'] = this.lists.map((v) => v.toJson()).toList();
    }
    data['menuId'] = this.menuId;
    data['name'] = this.name;
    data['open'] = this.open;
    data['parentId'] = this.parentId;
    data['parentName'] = this.parentName;
    data['perms'] = this.perms;
    data['updateBy'] = this.updateBy;
    data['updateDate'] = this.updateDate;
    return data;
  }
}