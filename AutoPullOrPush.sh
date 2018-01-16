#!/bin/bash
# author:wang
# url:wangjiawei.wang

echo " "
echo "------ 输入 ctrl+c 退出当前shell脚本 ------"
echo " "

# 项目选择：
echo "请选择您要操作的项目："
echo "1. 助手"
echo "2. 其它"
read paramWhich
echo "-----------------------------------------"

# 操作的文件的路径
filePath_quanzheng="${pwd}quanzheng"
filePath_newzhuanzhuan="${pwd}newzhuanzhuan"

# 判读用户是否有输入
while :
do
	if test -n "$paramWhich"
	then
    	case $paramWhich in
    		1 ) echo "您选择了助手"
				# currentPath="$filePath_quanzheng"
				cd ${filePath_quanzheng}
				break
    		;;
    		2 ) echo "你选择了其它"
				# currentPath="$filePath_newzhuanzhuan"
				cd ${filePath_newzhuanzhuan}
				break
			;;
			*) echo "无效的选项"
			;;
    	esac
	fi
done

echo " "

# 分支选择：
echo "请输入您要操作的分支："
read whichBranch
echo "切换到对应分支..."
git checkout $whichBranch
echo "👏👏👏：已切换到对应分支!!!"

echo "-----------------------------------------"

# 操作选项：
echo "请选择您要进行的操作："
echo "1. 上传代码："
echo "2. 同步代码："
read codeUse
echo "-----------------------------------------"

case $codeUse in
    	1) echo "正在为您执行上传代码操作..."
				# 上传代码：查看本地 - 添加修改 - 添加到本地
				git status
				git add .
				git pull origin $whichBranch

				echo "请输入您修改的内容："
				read changeInfo
				git commit -m $changeInfo

				echo "正在为您上传代码："
				git push origin $whichBranch
				echo "👏👏👏：您的代码已经推送到coding的对应分支！！！"
				echo "-----------------------------------------"
    		;;
    	2) echo "正在为您执行同步代码操作..."
				# 下拉代码：
				git status

				# 先传我的现在的内容
				git add .
				git commit -m "同步代码之前把我的改变保存在本地库内"

				echo "正在为您拉取代码"
				git pull origin $whichBranch
				echo "👏👏👏：本地代码已经同步到最新的版本！！！"
				echo "-----------------------------------------"
			;;
			*) echo "无效的选项"
			;;
		esac


