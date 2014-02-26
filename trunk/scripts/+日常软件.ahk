﻿;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 一键启动日常必备程序
; 
; gaochao.morgen@gmail.com
; 2013/7/2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#SingleInstance Force	; 跳过对话框并自动替换旧实例
#NoEnv					; 不检查空变量是否为环境变量（建议所有新脚本使用）

; 设置 ErrorLevel 为这个正在运行脚本的 PID
Process, Exist

ExeList := Object()
ExeList.Insert("E:\系统工具\DeskWidget\DeskWidget.exe", 2)
ExeList.Insert("E:\系统工具\Yz Dock 0.83\YzDock.exe", 5)
ExeList.Insert("E:\Program Files\QQ2012\Bin\QQ.exe", 5)

for Target, Seconds in ExeList
{
	SplitPath, Target, ProcName

	CoordMode, ToolTip, Screen  ; 把ToolTips放置在相对于屏幕坐标的位置
	ToolTip, Launching %ProcName%, 640, 400
	Sleep, 500

	; 若进程未启动则启动，若已启动则不作任何改动
	Process, Exist, %ProcName%
	if (ErrorLevel = 0)
	{
		Run, %Target%
		Seconds *= 1000
		Sleep, %Seconds%
	}
}

ExitApp	

