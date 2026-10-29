Class {
	#name : 'SycSingleClassMenuCmCommand',
	#superclass : 'SycSingleClassCommand',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> orderInContext: aToolContext [

	^ aToolContext isFullBrowserClassContext
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycSingleClassMenuCmCommand >> prepareFullExecution [

	targetClass := self context lastSelectedClass
]
