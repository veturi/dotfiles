#!/usr/bin/env bash
# Rectangle settings. Quit Rectangle before running, it overwrites prefs on exit.
d="defaults write com.knollsoft.Rectangle"
$d alternateDefaultShortcuts -bool true   # Spectacle style shortcuts
$d allowAnyShortcut -bool true
$d launchOnLogin -bool true
$d subsequentExecutionMode -int 1
$d unsnapRestore -bool true
$d hapticFeedbackOnSnap -int 2
$d footprintAnimationDurationMultiplier -float 0
$d footprintBlur -bool false
$d missionControlDragging -bool true
$d landscapeSnapAreas -string '[1,{"action":15},7,{"compound":-4},8,{"action":14},6,{"action":13},4,{"compound":-2},3,{"action":16},2,{"action":2},5,{"compound":-3}]'
