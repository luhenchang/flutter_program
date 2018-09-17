/*{
"createBy":null,
"createDate":"2018-07-17 23:16:39",
"delFlag":0,
"deptId":"1",
"deptName":"",
"email":"",
"fullname":"管理员",
"jobNum":"",
"mobileMenuList":[

],
"password":"e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b",
"phone":"",
"photo":null,
"roleIdList":[

],
"roleIds":"",
"roleNames":"",
"salt":"YzcmCZNvbXocrsz9dm8e",
"status":1,
"updateBy":null,
"updateDate":"2018-08-13 19:35:02",
"userId":"1",
"username":"admin",
"workloadCount":null,
"workloadTimeSum":null,
"wxNum":""
}*/
class UserListBean {
  bool isSelected=false;
  String createBy;
  String createDate;
  int delFlag;
  String deptId;
  String deptName;
  String email;
  String fullname;
  String jobNum;
  List<String> mobileMenuList;
  String password;
  String phone;
  String photo;
  List<String> roleIdList;
  String roleIds;
  String roleNames;
  String salt;
  int status;
  String updateBy;
  String updateDate;
  String userId;
  String username;
  String workloadCount;
  String workloadTimeSum;
  String wxNum;

  UserListBean(
      {this.createBy,
        this.createDate,
        this.delFlag,
        this.deptId,
        this.deptName,
        this.email,
        this.fullname,
        this.jobNum,
        this.mobileMenuList,
        this.password,
        this.phone,
        this.photo,
        this.roleIdList,
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
}
