"
I am a command to show all variable writers (the methods which assigns new value to the variables).

To show writers I ask the browser to spawn new query browser.

Internal Representation and Key Implementation Points.

    Instance Variables
	browser:		<ClyBrowser>
"
Class {
	#name : 'ClyShowVariableWriterCommand',
	#superclass : 'SycVariableNavigationCmCommand',
	#instVars : [
		'browser'
	],
	#category : 'Calypso-SystemTools-QueryBrowser-Commands-Queries',
	#package : 'Calypso-SystemTools-QueryBrowser',
	#tag : 'Commands-Queries'
}

{ #category : 'activation' }
ClyShowVariableWriterCommand class >> fullBrowserShortcutActivation [
	<classAnnotation>

	^CmdShortcutActivation by: $m meta for: ClyFullBrowserVariableContext
]

{ #category : 'accessing' }
ClyShowVariableWriterCommand >> defaultMenuItemName [
	^'Writers'
]

{ #category : 'accessing' }
ClyShowVariableWriterCommand >> description [

	^ 'Show all variable writers.'
]

{ #category : 'execution' }
ClyShowVariableWriterCommand >> executeRefactorings [

	(Smalltalk tools toolNamed: #messageList) browseWritersOfVariables: variables 
]

{ #category : 'accessing' }
ClyShowVariableWriterCommand >> fullBrowserOrder [

	^ 2001
]

{ #category : 'accessing' }
ClyShowVariableWriterCommand >> order [

	^ 1000
]

{ #category : 'execution' }
ClyShowVariableWriterCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.

	browser := aToolContext browser
]
