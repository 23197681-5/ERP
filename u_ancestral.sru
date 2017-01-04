$PBExportHeader$_textopadrao.sru
forward
global type _textopadrao from userobject
end type
type sle_padrao from singlelineedit within _textopadrao
end type
type r_status from rectangle within _textopadrao
end type
end forward

global type _textopadrao from userobject
integer width = 2601
integer height = 128
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_padrao sle_padrao
r_status r_status
end type
global _textopadrao _textopadrao

type variables
String is_textopadrao
Int li_limit
Boolean ib_tiposenha
end variables

forward prototypes
public function string get_text ()
end prototypes

public function string get_text ();return sle_padrao.text
end function

on _textopadrao.create
this.sle_padrao=create sle_padrao
this.r_status=create r_status
this.Control[]={this.sle_padrao,&
this.r_status}
end on

on _textopadrao.destroy
destroy(this.sle_padrao)
destroy(this.r_status)
end on

event constructor;sle_padrao.text = is_textopadrao

end event

type sle_padrao from singlelineedit within _textopadrao
integer width = 2601
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = oem!
fontpitch fontpitch = variable!
fontfamily fontfamily = modern!
string facename = "Modern"
long textcolor = 134217738
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

event getfocus;sle_padrao.TextColor = RGB(99,99,99)
if (sle_padrao.text = is_textopadrao) then
	sle_padrao.text = ""
end if
//sle_padrao.color = black
r_status.fillcolor = RGB(200,200,0)
r_status.show()
end event

event losefocus;sle_padrao.TextColor = RGB(159,159,159)
if (sle_padrao.text = "") then
	sle_padrao.text = is_textopadrao
end if
r_status.hide()
end event

event constructor;sle_padrao.text = is_textopadrao
sle_padrao.password = ib_tiposenha
end event

type r_status from rectangle within _textopadrao
boolean visible = false
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 16777215
integer x = 5
integer y = 88
integer width = 2615
integer height = 68
end type

