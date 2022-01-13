#!/usr/bin/env bash
#***********************************************************************************
# **  文件名称:start-ads-city-tourist-msk-d.sh
# **  创建日期: 2021年7月29日
# **  编写人员: qinxiao
# **  输入信息: 停留表，用户画像表，行政区配置表
# **  输出信息: 市游客表
# **
# **  功能描述: 市游客表
# **  处理过程:
# **  Copyright(c) 2016 TianYi Cloud Technologies (China), Inc.
# **  All Rights Reserved.
#***********************************************************************************

#***********************************************************************************
#==修改日期==|===修改人=====|======================================================|
#
#***********************************************************************************

#获取脚本所在目录
shell_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#进入脚本目录
cd $shell_home


day_id=$1


spark-submit \
--master yarn-client \
--class ads.ADSCityTouristMskDay \
--num-executors 1 \
--executor-cores 1 \
--executor-memory 2G \
--conf spark.sql.shuffle.partitions=10 \
--jars common-1.0-SNAPSHOT.jar \
ads-1.0-SNAPSHOT.jar $day_id




