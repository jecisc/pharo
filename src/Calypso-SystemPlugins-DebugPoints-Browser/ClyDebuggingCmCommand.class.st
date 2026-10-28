"
I am a Commander2 hybrid for the debug point commands applied to the source node under the cursor. I sit under the v1 ClyDebuggingPointsCommand and keep its legacy lifecycle for the source menus, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyDebuggingCmCommand',
	#superclass : 'ClyDebuggingPointsCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'testing' }
ClyDebuggingCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]

{ #category : 'initialization' }
ClyDebuggingCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'execution' }
ClyDebuggingCmCommand >> prepareFullExecution [

	self readParametersFromContext: self context
]

{ #category : 'execution' }
ClyDebuggingCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
