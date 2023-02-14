//%attributes = {"invisible":true}
// ----------------------------------------------------
// Project method : env_Substitute_font
// Database: runtime
// ID[6D23E29B256F44C4BC6FD96323C48236]
// Created #13-1-2016 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations

#DECLARE($font_name : Text)->$font_substitution : Text


var \
$count_parameters : Integer


If (False:C215)
	C_TEXT:C284(env_Substitute_font; $0)
	C_TEXT:C284(env_Substitute_font; $1)
End if 

// ----------------------------------------------------
// Initialisations
$count_parameters:=Count parameters:C259

If (Asserted:C1132($count_parameters>=0; "Missing parameter"))
	
	//NO PARAMETERS REQUIRED
	
	//Optional parameters
	If ($count_parameters>=1)
		
		//$Txt_fontName:=$1  //{default font if omitted}
		
	Else 
		
		$font_name:=OBJECT Get font:C1069(*; "")
		
	End if 
	
Else 
	
	ABORT:C156
	
End if 

// ----------------------------------------------------
Case of 
		
		//______________________________________________________
	: (Position:C15(".SF NS TEXT"; $font_name)>0)
		
		$font_substitution:=Replace string:C233($font_name; "\".SF NS Text\""; "'Helvetica Neue'")
		$font_substitution:=Replace string:C233($font_name; "'.SF NS Text'"; "'Helvetica Neue'")
		$font_substitution:=Replace string:C233($font_name; ".SF NS Text"; "'Helvetica Neue'")
		
		//______________________________________________________
	: (Position:C15("Lucida Grande UI"; $font_name)>0)
		
		$font_substitution:=Replace string:C233($font_name; "\".Lucida Grande UI\""; "'Lucida Grande'")
		$font_substitution:=Replace string:C233($font_name; "'.Lucida Grande UI'"; "'Lucida Grande'")
		$font_substitution:=Replace string:C233($font_name; ".Lucida Grande UI"; "'Lucida Grande'")
		
		//______________________________________________________
	Else 
		
		$font_substitution:=$font_name
		
		//______________________________________________________
End case 

// ----------------------------------------------------
// Return
//$0:=$Txt_fontSubstituted

// ----------------------------------------------------
// End