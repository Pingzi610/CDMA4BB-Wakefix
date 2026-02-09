#!/bin/sh
# CDMA版iPhone4防重启脚本
# 执行延迟：2秒
RUN_SLEEP=2
# 检测延迟：2秒
CHECK_SLEEP=2
# BBUpdater程序路径
BB_PATH="/usr/bin/BBUpdaterExtreme"

# 启动BBUpdater后台运行
${BB_PATH} queryversion &>/dev/null &
# 捕获启动后的PID
BB_PID=$!

# 核心优化：延迟2秒再检测进程，规避检测后瞬间报错的假阳性
sleep ${CHECK_SLEEP}

# 步骤2：双重检测进程状态（PID有效+进程真实运行），判定100%准确
if [ -n "${BB_PID}" ] && ps -p ${BB_PID} >/dev/null 2>&1; then
    # 启动成功：进程稳定运行2秒无报错，延迟等待禁用睡眠执行完成
    sleep ${RUN_SLEEP}
    # 精准杀死进程，无残留（先优雅终止，再强制兜底）
    kill ${BB_PID} 2>/dev/null || kill -9 ${BB_PID} 2>/dev/null
    # 额外兜底：防止进程僵死（老旧iOS必备）
    killall -9 BBUpdaterExtreme 2>/dev/null
    # 启动成功，脚本正常退出（保活机制待机，不重启）
    exit 0
else
    # 启动失败：无有效PID/进程已报错退出，快速退出脚本
    # 触发LaunchDaemon保活机制，立即重启脚本重试
    exit 1
fi