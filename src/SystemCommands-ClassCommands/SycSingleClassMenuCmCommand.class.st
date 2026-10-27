Class {
	#name : 'SycSingleClassMenuCmCommand',
	#superclass : 'SycSingleClassCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-ClassCommands',
	#package : 'SystemCommands-ClassCommands'
}

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> fullBrowserOrder [

	^ self order
]

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> icon [

	^ self defaultMenuIcon
]

{ #category : 'initialization' }
SycSingleClassMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> menuGroup [

	^ CmdRootMenuGroup
]

{ #category : 'accessing' }
SycSingleClassMenuCmCommand >> name [

	^ self defaultMenuItemName
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

{ #category : 'preparation' }
SycSingleClassMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]
