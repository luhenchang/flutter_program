/*
routingInspectionNumber=20180820180502_00000004
name=松下点胶机
equipmentTypeName=点胶机
number=SB-DJJ-033
specModels=HDPV
planStartTime=2018-08-20 15:00:00
planEndTime=2018-08-20 16:00:00

deptName=宁波SMT车间
operationStaff=李友德
installationSite=SMT-闲置区
routingInspectionLevelName=巡检类型
isStoped=0
stopTime=(null)
createDate=2018-08-20 18:05:02
workloadEndTime=2018-09-06 12:14:33
workloadStartTime=2018-09-06 12:14:28
*/
class FiveBaseBean {
  String actualEndTime;
  String actualStartTime;
  String assessContent;
  String checkItemList;
  String createBy;
  String createDate;
  int delFlag;
  String deptId;
  String deptName;
  String equipmentId;
  String equipmentTypeId;
  String equipmentTypeName;
  String fileList;
  List<String> imgFileEntities;
  String installationSite;
  int isStoped;
  String limitDeptId;
  String name;
  String number;
  String operationStaff;
  String photoList;
  String planEndTime;
  String planStartTime;
  String routingInspectionId;
  String routingInspectionLevel;
  String routingInspectionLevelName;
  String routingInspectionNumber;
  String routingInspectionPlanId;
  String routingInspectionPlanName;
  String sendee;
  String sendeeDeptId;
  String sendeeName;
  String sparePartGrid;
  String sparePartList;
  String specModels;
  int state;
  String stopTime;
  List<String> sysFileEntities;
  String taskScore;
  String updateBy;
  String updateDate;
  String userList;
  List<String> userListData;
  List<String> workSheetHistoryData;
  String workloadGrid;
  String workloadList;

  FiveBaseBean(
      {this.actualEndTime,
        this.actualStartTime,
        this.assessContent,
        this.checkItemList,
        this.createBy,
        this.createDate,
        this.delFlag,
        this.deptId,
        this.deptName,
        this.equipmentId,
        this.equipmentTypeId,
        this.equipmentTypeName,
        this.fileList,
        this.imgFileEntities,
        this.installationSite,
        this.isStoped,
        this.limitDeptId,
        this.name,
        this.number,
        this.operationStaff,
        this.photoList,
        this.planEndTime,
        this.planStartTime,
        this.routingInspectionId,
        this.routingInspectionLevel,
        this.routingInspectionLevelName,
        this.routingInspectionNumber,
        this.routingInspectionPlanId,
        this.routingInspectionPlanName,
        this.sendee,
        this.sendeeDeptId,
        this.sendeeName,
        this.sparePartGrid,
        this.sparePartList,
        this.specModels,
        this.state,
        this.stopTime,
        this.sysFileEntities,
        this.taskScore,
        this.updateBy,
        this.updateDate,
        this.userList,
        this.userListData,
        this.workSheetHistoryData,
        this.workloadGrid,
        this.workloadList});
}
