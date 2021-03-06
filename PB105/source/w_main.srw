$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_menu from datawindow within w_main
end type
type ddlb_1 from dropdownlistbox within w_main
end type
type cb_1 from commandbutton within w_main
end type
end forward

global type w_main from window
integer width = 2478
integer height = 1228
boolean titlebar = true
string title = "Extract Menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_menu dw_menu
ddlb_1 ddlb_1
cb_1 cb_1
end type
global w_main w_main

forward prototypes
public function boolean wf_extract (menu am_menu, integer ai_from, integer ai_level, string as_parent)
end prototypes

public function boolean wf_extract (menu am_menu, integer ai_from, integer ai_level, string as_parent);//====================================================================
// Function: w_main.wf_extract()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	value	menu   	am_menu  	
// 	value	integer	ai_from  	
// 	value	integer	ai_level 	
// 	value	string 	as_parent	
//--------------------------------------------------------------------
// Returns:  boolean
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/01/26
//--------------------------------------------------------------------
// Usage: w_main.wf_extract()
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String     ls_text, ls_code
Integer li_loop, li_count
Long ll_row
li_count = UpperBound(am_menu.Item[])
For li_loop = ai_from To li_count
	ls_code = as_parent + String(li_loop,"00")
	ls_text = am_menu.Item[li_loop].Text
	ll_row = dw_menu.InsertRow(0)
	dw_menu.SetItem(ll_row,"menu_id", ls_code)
	dw_menu.SetItem(ll_row,"label_menu", ls_text)
	dw_menu.SetItem(ll_row,"level_id", ai_level)
	dw_menu.SetItem(ll_row,"parent_id", as_parent)
	wf_extract(am_menu.Item[li_loop],1, ai_level + 1, ls_code)
Next
Return True

end function

on w_main.create
this.dw_menu=create dw_menu
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.Control[]={this.dw_menu,&
this.ddlb_1,&
this.cb_1}
end on

on w_main.destroy
destroy(this.dw_menu)
destroy(this.ddlb_1)
destroy(this.cb_1)
end on

type dw_menu from datawindow within w_main
integer x = 37
integer y = 152
integer width = 2363
integer height = 916
integer taborder = 30
string title = "none"
string dataobject = "d_menu2"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_1 from dropdownlistbox within w_main
integer x = 41
integer y = 24
integer width = 878
integer height = 400
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string item[] = {"m_main","m_popup_menu"}
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_main
integer x = 937
integer y = 24
integer width = 384
integer height = 92
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Extract Menu"
end type

event clicked;menu lm_main

If ddlb_1.Text = "" Then Return

lm_main = Create Using ddlb_1.Text

dw_menu.Reset()
wf_extract(lm_main,1,0,'')
Destroy lm_main



end event

