/*
print("name$i="+response.data['page']['list'][i]['equipmentName'].toString());
print("name$i="+response.data['page']['list'][i]['equipmentNum'].toString());
print("name$i="+response.data['page']['list'][i]['equipmentNum'].toString());
print("name$i="+response.data['page']['list'][i]['repairSheetNum'].toString());
print("name$i="+response.data['page']['list'][i]['repairSheetNum'].toString());*/
class AlreadyAplayBean{
  //equipmentName=松下贴片机(二手）

  //equipmentNum=NB-TPJ-045
  // specModels=CM402-L
  //createDate=2018-08-30 18:20:28
  //state=-1
  //repairTime=2
  //endTime=2018-09-06 16:17:00
  //repairSheetNum=20180830160106_00000074
  //workloadEndTime=2018-09-06 12:14:33
  //workloadStartTime=2018-09-06 12:14:28
  //equipmentTypeName=下板机
  //deptName=宁波SMT车间
  //installationSite=SMT-2线
 // faultName=测试
  var equipmentName;
  var equipmentNum;
  var createDate;
  var specModels;
  var state;
  var repairTime;
  var endTime;
  var createByName;
  var repairSheetNum;
  var workloadStartTime;
  var workloadEndTime;
  var auditingDate;
  var equipmentTypeName;
  var deptName;
  var installationSite;
  var faultName;
  AlreadyAplayBean(this.equipmentName,this.equipmentNum,this.createDate,this.specModels,this.state,
      [this.repairTime,this.endTime,this.createByName,this.repairSheetNum,this.workloadStartTime,
        this.workloadEndTime,this.auditingDate,this.equipmentTypeName,this.deptName,this.installationSite,this.faultName]);

}
