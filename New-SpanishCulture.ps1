<#
.SYNOPSIS
    This script creates a Spanish cultureinfo object with a tradidional
     sort and another with an international sort. The script then compares them.
.DESCRIPTION
    This script re-implements an MSDN sample. 
.NOTES
    File Name  : New-SpanishCulture.ps1
    Author     : Thomas Lee - tfl@psp.co.uk
    Requires   : PowerShell Version 2.0
.LINK
    This script posted to:
        http://www.pshscripts.blogspot.com
    MSDN sample posted to:
         http://msdn.microsoft.com/en-us/library/system.globalization.cultureinfo.aspx   
.EXAMPLE
    C:\foo> .\Show-ChineeseParentCulture.ps1
        PROPERTY                       INTERNATIONAL                                  TRADITIONAL              
    CompareInfo                    CompareInfo - es-ES                            CompareInfo - es-ES_tradnl
    DisplayName                    Spanish (Spain)                                Spanish (Spain)          
    EnglishName                    Spanish (Spain, International Sort)            Spanish (Spain, Traditional Sort)
    IsNeutralCulture               False                                          False                    
    IsReadOnly                                                                    False                    
    LCID                           3082                                           1034                     
    Name                           es-ES                                          es-ES                    
    NativeName                     Español (España, alfabetización internacional) Español (España, alfabetización tradicional)
    Parent                         es                                             es                       
    TextInfo                       TextInfo - es-ES                               TextInfo - es-ES_tradnl  
    ThreeLetterISOLanguageName     spa                                            spa                      
    ThreeLetterWindowsLanguageName ESN                                            ESP                      
    TwoLetterISOLanguageName       es                                             es                       

    Comparing [llegar] and [lugar]
       With myCIintl.CompareInfo.Compare: -1
       With myCItrad.CompareInfo.Compare: 1
#>

# Create and initialize the CultureInfo which uses the international sort
$myCIintl = New-Object System.Globalization.CultureInfo "es-ES", $false

# Create and initialize the CultureInfo which uses the traditional sort
$myCItrad = New-Object System.Globalization.CultureINfo 0x040A, $false

# Display the properties of each culture.
"{0,-31}{1,-47}{2,-25}" -f "PROPERTY", "INTERNATIONAL", "TRADITIONAL"
"{0,-31}{1,-47}{2,-25}" -f "CompareInfo", $myCIintl.CompareInfo, $myCItrad.CompareInfo
"{0,-31}{1,-47}{2,-25}" -f "DisplayName", $myCIintl.DisplayName, $myCItrad.DisplayName
"{0,-31}{1,-47}{2,-25}" -f "EnglishName", $myCIintl.EnglishName, $myCItrad.EnglishName
"{0,-31}{1,-47}{2,-25}" -f "IsNeutralCulture", $myCIintl.IsNeutralCulture, $myCItrad.IsNeutralCulture
"{0,-31}{1,-47}{2,-25}" -f "IsReadOnly", $myCIintl.$IsReadOnly, $myCItrad.IsReadOnly
"{0,-31}{1,-47}{2,-25}" -f "LCID", $myCIintl.LCID, $myCItrad.LCID
"{0,-31}{1,-47}{2,-25}" -f "Name", $myCIintl.Name, $myCItrad.Name
"{0,-31}{1,-47}{2,-25}" -f "NativeName", $myCIintl.NativeName, $myCItrad.NativeName
"{0,-31}{1,-47}{2,-25}" -f "Parent", $myCIintl.Parent, $myCItrad.Parent
"{0,-31}{1,-47}{2,-25}" -f "TextInfo", $myCIintl.TextInfo, $myCItrad.TextInfo
"{0,-31}{1,-47}{2,-25}" -f "ThreeLetterISOLanguageName", $myCIintl.ThreeLetterISOLanguageName, $myCItrad.ThreeLetterISOLanguageName
"{0,-31}{1,-47}{2,-25}" -f "ThreeLetterWindowsLanguageName",$myCIintl.ThreeLetterWindowsLanguageName, $myCItrad.ThreeLetterWindowsLanguageName
"{0,-31}{1,-47}{2,-25}" -f "TwoLetterISOLanguageName", $myCIintl.TwoLetterISOLanguageName, $myCItrad.TwoLetterISOLanguageName
""

# Compare two strings using myCIintl
"Comparing [llegar] and [lugar]"
"   With myCIintl.CompareInfo.Compare: {0}" -f $myCIintl.CompareInfo.Compare("llegar", "lugar")
"   With myCItrad.CompareInfo.Compare: {0}" -f $myCItrad.CompareInfo.Compare("llegar", "lugar")