"
I am a command to add new protocol top the class 

Internal Representation and Key Implementation Points.

    Instance Variables
	protocol:		<String>
	targetClass:		<Class>
"
Class {
	#name : 'SycAddNewProtocolCommand',
	#superclass : 'SycClassCommand',
	#instVars : [
		'targetClass',
		'protocol'
	],
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'execution' }
SycAddNewProtocolCommand >> applyCommandResult [
	super applyCommandResult.
	self context showProtocol: protocol
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> defaultMenuIconName [

	^ #add
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> defaultMenuItemName [

	^ 'New protocol'
]

{ #category : 'execution' }
SycAddNewProtocolCommand >> executeRefactoring [

	targetClass addProtocol: protocol
]

{ #category : 'testing' }
SycAddNewProtocolCommand >> isAvailableInMenuOf: aToolContext [

	^ aToolContext isFullBrowserMethodGroupContext
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> order [

	^ 2
]

{ #category : 'execution' }
SycAddNewProtocolCommand >> prepareFullExecution [

	super prepareFullExecution.
	protocol := StProtocolNameChooserPresenter requestProtocolNameConfiguring: [ :presenter | presenter concernedClass: self context lastSelectedClass ].
	targetClass := self requestClassInContext: self context.
	targetClass := self context currentMetaLevelOf: targetClass
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> protocol [
	^ protocol
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> protocol: protocolName [
	protocol := protocolName
]

{ #category : 'execution' }
SycAddNewProtocolCommand >> requestClassInContext: aToolContext [

	| classes |
	classes := aToolContext selectedClasses.
	classes size = 1 ifTrue: [ ^ classes first ].

	^ aToolContext requestSingleClass: 'In what class you want a protocol?' from: classes
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> targetClass [
	^ targetClass
]

{ #category : 'accessing' }
SycAddNewProtocolCommand >> targetClass: anObject [
	targetClass := anObject
]
