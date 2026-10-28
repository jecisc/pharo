"
I am a command to move browser focus to next (right) navigation pane
"
Class {
	#name : 'ClySwitchFocusToNextBrowserPaneCommand',
	#superclass : 'ClyBrowserMenuCmCommand',
	#category : 'Calypso-Browser-Commands',
	#package : 'Calypso-Browser',
	#tag : 'Commands'
}

{ #category : 'testing' }
ClySwitchFocusToNextBrowserPaneCommand class >> canBeExecutedInContext: aBrowserContext [
	^aBrowserContext browser isNavigationPanelFocused
]

{ #category : 'execution' }
ClySwitchFocusToNextBrowserPaneCommand >> executeRefactorings [
	browser switchFocusToNextPane
]
