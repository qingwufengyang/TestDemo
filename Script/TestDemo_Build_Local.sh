#!/bin/bash



#***********配置项
HCProjectName="TestDemo"			
HCScheme="TestDemo"
HCTestScheme="TestDemoAutoTests"
#HCBranchName="master"
HCCodeSignIdentity="iPhone Developer: nannan ji (8W2YJ2NKMC)"
HCProvisioningProFile="af34fd65-a148-43d7-821c-0bc0404e19bd"
#HCConfiguration="Release"
#*****--------------------


cd ..												#回到项目根目录
HCProjectDir=`pwd`						            #项目路径
HCWorkspace=$HCProjectDir				#Workspace路径
HCWorkspaceFile="$HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace"
echo "workspaceFile=$HCWorkspaceFile-----------------------"

echo "$HCTestScheme---------------------"
# 单元测试
xcodebuild clean test \
-workspace $HCWorkspaceFile \
-scheme $HCScheme \
-configuration "Debug" \
-sdk iphonesimulator \
-destination platform='iOS Simulator',name='iPhone 5s'

#真机
# xcodebuild clean test \
# -workspace $HCWorkspaceFile \
# -scheme $HCScheme \
# -configuration "Debug" \
# -sdk iphoneos \
# CODE_SIGN_IDENTITY="$HCCodeSignIdentity"  \
# PROVISIONING_PROFILE="$HCProvisioningProFile" \
# -destination platform='iOS',name='陈俊俊'


# -only-testing:TestDemoAutoTests \

#xctool clean build-tests \
#-workspace $HCWorkspaceFile \
#-scheme $HCScheme \
#-sdk iphonesimulator9.3 \
#
#array=( TestDemoAutoTests )
#
#for data in ${array}
#do 
#        xctool  \
#        -workspace $HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace \
#        -scheme $HCTestScheme \
#        run-tests -only $HCTestScheme:${data}\
#        -sdk iphonesimulator9.3 \
#        -configuration "Debug" \
#        -destination platform='iOS Simulator',OS=9.3,name='iPhone 6'
#done






