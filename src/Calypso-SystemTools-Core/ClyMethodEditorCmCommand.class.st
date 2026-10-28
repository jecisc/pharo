"
I am a Commander2 hybrid for the method editor commands (classify method, select method package, unclassify method). I sit under the v1 ClyMethodEditorCommand and take the editor tool from the context in prepareFullExecution. I am removed together with Commander v1.
"
Class {
	#name : 'ClyMethodEditorCmCommand',
	#superclass : 'ClyMethodEditorCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'Calypso-SystemTools-Core',
	#package : 'Calypso-SystemTools-Core'
}

{ #category : 'initialization' }
ClyMethodEditorCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
ClyMethodEditorCmCommand >> orderInContext: aToolContext [

	^ self order
]

{ #category : 'preparation' }
ClyMethodEditorCmCommand >> prepareFullExecution [

	methodEditor := self context tool
]

{ #category : 'execution' }
ClyMethodEditorCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
