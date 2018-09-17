class SparePartEntities {
  var changeRepertoryQuantity;
  String code;
  var createBy;
  String createDate;
  int currRepertory;
  int delFlag;
  var deptId;
  String deptName;
  String equipmentId;
  List<String> equipmentList;
  String equipmentName;
  String equipmentTypeIds;
  List<String> equipmentTypeList;
  String equipmentTypeNames;
  String factory;
  String fileId;
  String firmId;
  List<String> firmInfoList;
  String firmName;
  var money;
  String name;
  String number;
  var quantity;
  int repertoryMax;
  int repertoryMin;
  String sparePartId;
  String specModels;
  List<String> systemFileList;
  var type;
  String typeName;
  var unit;
  String unitName;
  int unitPrice;
  String updateBy;
  String updateDate;
  var useDeptId;
  String useDeptName;
  String warehouse;
  var isSelected=false;

  SparePartEntities(
      {this.changeRepertoryQuantity,
      this.code,
      this.createBy,
      this.createDate,
      this.currRepertory,
      this.delFlag,
      this.deptId,
      this.deptName,
      this.equipmentId,
      this.equipmentList,
      this.equipmentName,
      this.equipmentTypeIds,
      this.equipmentTypeList,
      this.equipmentTypeNames,
      this.factory,
      this.fileId,
      this.firmId,
      this.firmInfoList,
      this.firmName,
      this.money,
      this.name,
      this.number,
      this.quantity,
      this.repertoryMax,
      this.repertoryMin,
      this.sparePartId,
      this.specModels,
      this.systemFileList,
      this.type,
      this.typeName,
      this.unit,
      this.unitName,
      this.unitPrice,
      this.updateBy,
      this.updateDate,
      this.useDeptId,
      this.useDeptName,
      this.warehouse});
}
