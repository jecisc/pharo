"
I am a command to move browser focus to previous (left) navigation pane
"
Class {
	#name : 'ClySwitchFocusToPreviousBrowserPaneCommand',
	#superclass : 'ClyBrowserMenuCmCommand',
	#category : 'Calypso-Browser-Commands',
	#package : 'Calypso-Browser',
	#tag : 'Commands'
}

{ #category : 'testing' }
ClySwitchFocusToPreviousBrowserPaneCommand class >> canBeExecutedInContext: aBrowserContext [
	^aBrowserContext browser isNavigationPanelFocused
]

{ #category : 'execution' }
ClySwitchFocusToPreviousBrowserPaneCommand >> executeRefactorings [
	browser switchFocusToPreviousPane
]
