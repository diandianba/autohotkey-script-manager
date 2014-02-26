﻿;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 一键启动服务窗口
; 
; gaochao.morgen@gmail.com
; 2014/2/4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include ../lib/SystemCursor.ahk

#SingleInstance Force		; 跳过对话框并自动替换旧实例
#NoTrayIcon					; 不显示托盘图标
#NoEnv						; 不检查空变量是否为环境变量（建议所有新脚本使用）

OnExit, ShowCursor			; 确保到脚本退出时鼠标光标是显示的.

Run, services.msc			; Max参数不能最大化
Sleep, 1000
Send {Alt Down}{Space}x		; 测试"!{Space}x"不行，只能让Alt按下
Send {Alt Up}				; 再把Alt弹起
SystemCursor("Off")
MouseMove, 471, 121			; 标题栏
Send {LButton 2}			; 双击，长度最大化
MouseMove, 670, 393			; 内容区域
Send {LButton}
SystemCursor("On")
Return

ShowCursor:
	SystemCursor("On")
ExitApp

