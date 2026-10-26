"
I am a command to show all variable references.

To show references I ask the browser to spawn new query browser.

Internal Representation and Key Implementation Points.

    Instance Variables
	browser:		<ClyBrowser>
"
Class {
	#name : 'ClyShowVariableRefCommand',
	#superclass : 'SycVariableNavigationCmCommand',
	#instVars : [
		'browser'
	],
	#category : 'Calypso-SystemTools-QueryBrowser-Commands-Queries',
	#package : 'Calypso-SystemTools-QueryBrowser',
	#tag : 'Commands-Queries'
}

{ #category : 'activation' }
ClyShowVariableRefCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $n meta for: ClyFullBrowserVariableContext
]

{ #category : 'accessing' }
ClyShowVariableRefCommand >> defaultMenuItemName [
	^'References'
]

{ #category : 'accessing' }
ClyShowVariableRefCommand >> description [

	^ 'Show all variable references.'
]

{ #category : 'execution' }
ClyShowVariableRefCommand >> executeRefactorings [

	(Smalltalk tools toolNamed: #messageList) browseReferencesToVariables: variables 
]

{ #category : 'accessing' }
ClyShowVariableRefCommand >> fullBrowserOrder [

	^ 2000
]

{ #category : 'accessing' }
ClyShowVariableRefCommand >> order [

	^ 1000
]

{ #category : 'execution' }
ClyShowVariableRefCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.

	browser := aToolContext browser
]
