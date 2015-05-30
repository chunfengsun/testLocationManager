//
//  AppConfigure.h
//  HttpRequest
//
//  Created by rang on 12-11-8.
//
//
//

//webservice配置
//http://10.58.174.94:1003
//http://10.58.174.95:81/LSHD.Presentation.WebServices
//登录、注册、
#define defaultWebServiceUrl @"http://140.207.46.14:8021/VIPUserInfoWebService.asmx"

#define onloginMethodName @"OnLogin"//登录
#define onregisterMethodName @"OnRegister"//注册
#define updatePassMethodName @"UpdatePass"//修改密码
#define onUploading @"OnUploading"//上传头像
#define getUserInfo @"GetUserInfo"//获取用户信息
#define getPSArry @"GetPSArryByUserId"//获取所属电站
#define getPSTaskByPSId @"GetPSTaskByPSId"//今日任务/未完成任务

//意见反馈
#define FeedbackWebServiceUrl @"http://140.207.46.14:8021/FeedbackWebService.asmx"
#define AddFeedbackMethodName @"AddFeedback"//意见反馈

//问题反馈、任务搜索列表
#define TaskInfoWebServiceUrl @"http://140.207.46.14:8021/TaskInfoWebService.asmx"
#define AddTaskInfoMethodName @"AddTaskInfo"//问题反馈
#define GetTaskInfoMethodName @"GetTaskInfo"//获取任务详情接口


//维护记录
#define MaintainWebServiceUrl @"http://140.207.46.14:8021/MaintainWebService.asmx"
#define AddMaintainMethodName @"AddMaintain"//维护记录
#define getMaintainByTidMethodName @"GetMaintainByTid" // 获取维修记录

//任务搜索列表
#define GetTaskArryByWhereMethodName @"GetTaskArryByWhere"//任务搜索列表


//签到
#define signInWebServiceUrl @"http://140.207.46.14:8021/SignInWebService.asmx"
#define onSignInMethodName @"OnSignIn"//签到

//任务相关
#define taskInfoWebServiceUrl @"http://140.207.46.14:8021/TaskInfoWebService.asmx"
#define getTaskArryByUserIdMethodName @"GetTaskArryByUserId"// 获取个人任务列表接口
#define getWarningTaskMethodName @"GetAlarmByUserId"// 获取报警任务列表接口
#define onTaskMethodName @"OnTask"// 领取任务
#define onTaskStateMethodName @"OnTaskState" // 任务处理接口

//任务解决方案
#define solutionWebServiceUrl @"http://140.207.46.14:8021/SolutionWebService.asmx"
#define getSolutionArryAllMethodName @"GetSolutionArryAll" // 获取任务解决方案列表接口


#define powerStationWebServiceUrl @"http://140.207.46.14:8021/PowerStationWebService.asmx"
#define getPSArryByUserIdMethodName @"GetPSArryByUserId"//获取个人电站列表
#define getPSArryAllMethodName @"GetPSArryAll"//获取附近电站列表
#define getPSInfoMethodName @"GetPSInfo"//获取附近电站列表

// 更新
#define versionsWebServiceUrl @"http://140.207.46.14:8021/VersionsWebService.asmx"
#define isNewVersionsMethodName @"IsNewVersions"

//客户电站详情接口
#define getPSInfoWebServiceUrl @"http://pvmon.enn.cn/AppWebService/AppWebService.asmx"
#define ShowInTimeMethodName @"ShowInTime"

//添加当前位置
#define LocationWebServiceUrl @"http://140.207.46.14:8021/LocationWebService.asmx"
#define AddLocationMethodName @"AddLocation"


//命名空间
#define defaultWebServiceNameSpace @"http://tempuri.org/"
