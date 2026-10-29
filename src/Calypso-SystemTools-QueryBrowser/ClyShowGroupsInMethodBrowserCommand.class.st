"
I am a command to show all methods in the groups in new method browser.

To show methods I ask the browser to spawn new query browser.

Internal Representation and Key Implementation Points.

    Instance Variables
	browser:		<ClyBrowser>
"
Class {
	#name : 'ClyShowGroupsInMethodBrowserCommand',
	#superclass : 'ClyMethodGroupCommand',
	#category : 'Calypso-SystemTools-QueryBrowser-Commands-Queries',
	#package : 'Calypso-SystemTools-QueryBrowser',
	#tag : 'Commands-Queries'
}

{ #category : 'activation' }
ClyShowGroupsInMethodBrowserCommand class >> fullBrowserDoubleClickMenuActivation [
	<classAnnotation>

	^(ClyDoubleClickActivation for: ClyFullBrowserMethodGroupContext)
		priority: 10000
]

{ #category : 'accessing' }
ClyShowGroupsInMethodBrowserCommand >> defaultMenuIconName [
	^#browse
]

{ #category : 'accessing' }
ClyShowGroupsInMethodBrowserCommand >> defaultMenuItemName [
	^'Show in method browser'
]

{ #category : 'execution' }
ClyShowGroupsInMethodBrowserCommand >> executeRefactorings [

	(Smalltalk tools toolNamed: #messageList) browse: methodGroups first methods
]

{ #category : 'accessing' }
ClyShowGroupsInMethodBrowserCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
ClyShowGroupsInMethodBrowserCommand >> order [

	^ 1000
]
