#!/bin/bash



#***********配置项
HCProjectName="TestDemo"			
HCScheme="TestDemo"
#HCTestScheme="TestDemoTests"
HCBranchName="master"
HCCodeSignIdentity="iPhone Developer: nannan ji (8W2YJ2NKMC)"
HCProvisioningProFile="af34fd65-a148-43d7-821c-0bc0404e19bd"
HCConfiguration="Release"
#*****--------------------


#拉代码
git reset --hard 										#清除未提交的改变
git pull origin $HCBranchName							#拉代码
git checkout $HCBranchName								#切分支


cd ..												#回到项目根目录
HCProjectDir=`pwd`						            #项目路径
HCDate=`date +%Y%m%d_%H%M%S` 								#日期
HCWorkspace=$HCProjectDir/TestDemo1					#Workspace路径
HCWorkspaceFile="$HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace"
echo "workspace=$HCWorkspace-----------------------"
cd ..												#回到项目根目录上一级
HCBuildDir=`pwd`/HCTestDemo_build			 				#build路径
HCBuildTempDir="$HCBuildDir/temp/$HCBranchName/$HCDate"	  #构建过程中的文件
HCIpaDir="$HCBuildDir/ipa/$HCProjectName-$HCBranchName-$HCDate"	#生成ipa文件路径
HCArchivePath="$HCBuildTempDir/${HCProjectName}.xcarchive"  
HCOptionsPlistFile="$HCProjectDir/Script/OptionsPlist.plist"  
echo "HCBiuldDir=$HCBuildDir"



#创建构建和输出的路径
mkdir -p $HCBuildTempDir
mkdir -p $HCIpaDir



# #*********xcode7构建
# xcodebuild \
# -workspace $HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace \
# -scheme $HCScheme \
# -configuration "Release" \
# CODE_SIGN_IDENTITY="$HCCodeSignIdentity"  \
# PROVISIONING_PROFILE="$HCProvisioningProFile" \
# clean \
# build \
# -derivedDataPath $HCBuildTempDir

# #生成ipa
# xcrun -sdk iphoneos \
# -v PackageApplication $HCBuildTempDir/Build/Products/$HCConfiguration-iphoneos/$HCProjectName.app \
# -o "$HCIpaDir/$HCProjectName-$HCBranchName-$HCDate.ipa"
# #*********xcode7构建结束


# #**********xcode8构建
# xcodebuild -workspace "$HCWorkspaceFile" -scheme "$HCScheme" -sdk iphoneos archive -configuration "$HCConfiguration" ONLY_ACTIVE_ARCH=NO -archivePath ${HCArchivePath} PROVISIONING_PROFILE="$HCProvisioningProFile" CODE_SIGN_IDENTITY="$HCCodeSignIdentity" clean -derivedDataPath "$HCBuildTempDir"

# # 导出ipa到本地包目录
# xcodebuild -exportArchive -archivePath "$HCArchivePath" -exportPath "$HCIpaDir" -exportOptionsPlist "$HCOptionsPlistFile"
# #**********xcode8构建结束

#清除构建的临时文件
rm -rf $HCBuildDir/temp

echo "$HCTestScheme---------------------"

xcodebuild clean test \
-workspace $HCWorkspaceFile \
-scheme $HCScheme \
-sdk iphonesimulator9.3 \
-configuration "Debug" \
-destination platform='iOS Simulator',name='iPhone 5s'


## 单元测试
#xctool clean build-tests \
#-workspace $HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace \
#-scheme $HCScheme \
#-sdk iphonesimulator9.3 \
#
#array=( TestDemoTests )
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



# open "$HCIpaDir"									#打开SDK文件夹



