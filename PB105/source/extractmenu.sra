$PBExportHeader$extractmenu.sra
$PBExportComments$Generated Application Object
forward
global type extractmenu from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type extractmenu from application
string appname = "extractmenu"
end type
global extractmenu extractmenu

on extractmenu.create
appname="extractmenu"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on extractmenu.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_main)
end event

