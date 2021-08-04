library JAPIMisc
static if not REFORGED_MODE then
    native EXExecuteScript takes string script returns string
    native EXDclareButtonIcon takes string path returns nothing
    native EXBlendButtonIcon takes string input_a, string intput_b, string output returns boolean
endif
endlibrary