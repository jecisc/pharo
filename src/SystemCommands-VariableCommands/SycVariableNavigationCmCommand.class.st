"
I am a Commander2 hybrid for the variable navigation commands (references, writers, inspect value, browse). I sit directly under the v1 SycVariableCommand, so unlike the refactoring hybrid I accept global variables. My menu group is the Query group. I am removed together with Commander v1.
"
Class {
	#name : 'SycVariableNavigationCmCommand',
	#superclass : 'SycVariableCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'initialization' }
SycVariableNavigationCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> menuGroup [

	^ ClyQueryMenuGroup
]

{ #category : 'accessing' }
SycVariableNavigationCmCommand >> orderInContext: aToolContext [

	^ aToolContext isFullBrowserVariableContext
		ifTrue: [ self fullBrowserOrder ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycVariableNavigationCmCommand >> prepareFullExecution [

	variables := self context selectedVariables.
	toolContext := self context
]

{ #category : 'execution' }
SycVariableNavigationCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
