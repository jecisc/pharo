Class {
	#name : 'SycSingleClassMenuCmCommand',
	#superclass : 'SycSingleClassCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'initialization' }
SycSingleClassMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

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

{ #category : 'execution' }
SycSingleClassMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
