/*
maintainNumber=20180820180502_00000004
name=松下点胶机
equipmentTypeName=点胶机
number=SB-DJJ-033
specModels=HDPV
planStartTime=2018-08-20 15:00:00
planEndTime=2018-08-20 16:00:00

deptName=宁波SMT车间
operationStaff=李友德
installationSite=SMT-闲置区
maintainLevelName=巡检类型
isStoped=0
stopTime=(null)
createDate=2018-08-20 18:05:02
workloadEndTime=2018-09-06 12:14:33
workloadStartTime=2018-09-06 12:14:28
*/
class FiveBaseBean2 {
  /*
  * {"actualEndTime":null,"actualStartTime":null,"assessContent":"",
  * "checkItemList":"1002,1025,1039,1085","createBy":"0","createDate":"2018-08-20 18:05:02",
  * "delFlag":0,"deptId":"103","deptName":"宁波SMT车间","equipmentId":"125","equipmentTypeId":"109",
  * "equipmentTypeName":"接驳台","fileList":"","imgFileEntities":[],"installationSite":"SMT-3线","isStoped":0,
  * "limitDeptId":"103","lineMaintainPlanId":null,"maintainPlanId":"102","maintainPlanName":"保养计划01",
  * "maintainWorkorderId":"105","maintainWorkorderNumber":"20180820180502_00000005","maintenanceLevel":"35",
  * "maintenanceLevelName":"保养类型","name":"接驳台","number":"NB-JBT-080","operationStaff":"郭志国","photoList":"",
  * "planEndTime":"2018-08-20 16:00:00","planStartTime":"2018-08-20 08:00:00","sendee":"105","sendeeDeptId":"103",
  * "sendeeName":"李友德","sparePartGrid":"[]","sparePartList":"","specModels":"0.6M","state":2,"stopTime":null,
  * "sysFileEntities":[],"taskScore":null,"updateBy":null,"updateDate":null,"userList":"105,106,107,108,109,110,111,
  * 112,113,114,115,116,117,118,119,120,121,122","userListData":Array[0],"workloadGrid":"[]","workloadList":"",
  * "workorderHistoryData":[]}
  *
  * */
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
  String maintainId;
  String maintainLevel;
  String maintainLevelName;
  String maintainNumber;
  String maintainPlanId;
  String maintainPlanName;
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

  FiveBaseBean2(
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
        this.maintainId,
        this.maintainLevel,
        this.maintainLevelName,
        this.maintainNumber,
        this.maintainPlanId,
        this.maintainPlanName,
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
