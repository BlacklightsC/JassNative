library JAPIDisplayChat
globals
    constant integer CHAT_RECIPIENT_ALL       = 0
    constant integer CHAT_RECIPIENT_ALLIES    = 1
    constant integer CHAT_RECIPIENT_OBSERVERS = 2
    constant integer CHAT_RECIPIENT_PRIVATE   = 3
endglobals

static if REFORGED_MODE then
    native BlzDisplayChatMessage takes player whichPlayer, integer recipient, string message returns nothing
else
    native EXDisplayChat takes player p, integer chat_recipient, string message returns nothing
endif

function JNDisplayChatMessage takes player whichPlayer, integer recipient, string message returns nothing
static if REFORGED_MODE then
    call BlzDisplayChatMessage(whichPlayer, recipient, message)
else
    call EXDisplayChat(whichPlayer, recipient, message)
endif
endfunction
endlibrary