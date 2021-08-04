library JNStopwatch
static if not REFORGED_MODE then
    native JNStopwatchCreate takes nothing returns integer
    native JNStopwatchStart takes integer id returns nothing
    native JNStopwatchPause takes integer id returns nothing
    native JNStopwatchReset takes integer id returns nothing
    native JNStopwatchDestroy takes integer id returns nothing
    native JNStopwatchElapsedMS takes integer id returns integer
    native JNStopwatchElapsedSecond takes integer id returns integer
    native JNStopwatchElapsedMinute takes integer id returns integer
    native JNStopwatchElapsedHour takes integer id returns integer
    native JNStopwatchTick takes integer id returns real
endif
endlibrary