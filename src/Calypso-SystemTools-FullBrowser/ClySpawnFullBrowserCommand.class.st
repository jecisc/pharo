"
I am a command to spawn full browser from current browser state.
I simply ask browser #spawnFullBrowser.

By default I am available everywhere using cmd+b shortcut and ""Browse"" context menu item.

Internal Representation and Key Implementation Points.

    Instance Variables
	browser:		<ClyBrowser>

"
Class {
	#name : 'ClySpawnFullBrowserCommand',
	#superclass : 'ClyBrowserMenuCmCommand',
	#category : 'Calypso-SystemTools-FullBrowser-Commands-Queries',
	#package : 'Calypso-SystemTools-FullBrowser',
	#tag : 'Commands-Queries'
}

{ #category : 'activation' }
ClySpawnFullBrowserCommand class >> browserShortcutActivation [
	<classAnnotation>

	^ClyShortcutActivation by: $b meta for: ClySystemBrowserContext
]

{ #category : 'testing' }
ClySpawnFullBrowserCommand class >> canBeExecutedInContext: aToolContext [
	^aToolContext hasSelectedItems
]

{ #category : 'activation' }
ClySpawnFullBrowserCommand class >> fullBrowserDoubleClickMenuActivation [
	<classAnnotation>

	^ClyDoubleClickActivation for: ClyFullBrowserContext
]

{ #category : 'accessing' }
ClySpawnFullBrowserCommand >> defaultMenuIconName [
	^#browse
]

{ #category : 'accessing' }
ClySpawnFullBrowserCommand >> defaultMenuItemName [
	^'Browse'
]

{ #category : 'accessing' }
ClySpawnFullBrowserCommand >> description [

	^ 'Spawn full browser from current browser state.'
]

{ #category : 'execution' }
ClySpawnFullBrowserCommand >> executeRefactorings [

	browser spawnFullBrowser
]

{ #category : 'accessing' }
ClySpawnFullBrowserCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClySpawnFullBrowserCommand >> order [

	^ 1000
]
