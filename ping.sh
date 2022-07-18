#!/bin/bash
#输入ip段
read -p "shu_ru_ip_duan" ipd 
#输入开始主机位
read -p "kai_shi_wei" ks
#输入结束主机位
read -p "jie_shu_wei" js
#用结束位减去开始位+1，因为包含了开始主机位自己
lb=`seq $js|tail -$[$js-$ks+1]`
#for循环导入lb列表
for i in $lb
do
	ping -c 1 -i 0.1 -W 1 ${ipd}.${i} &>/dev/null
	if [ $? -eq 0 ];then
		echo "${ipd}.${i}通了"
	else
		echo "${ipd}.${i}不通"
	fi
done
