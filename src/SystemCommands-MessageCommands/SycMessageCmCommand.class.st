"
I am a temporary Commander2 bridge for message/signature commands. I subclass the legacy message command to keep its dialogs and refactoring behavior, and add the Commander2 execution lifecycle on top. I will be removed when Commander v1 is gone.
"
Class {
	#name : 'SycMessageCmCommand',
	#superclass : 'SycChangeMessageSignatureCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'initialization' }
SycMessageCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycMessageCmCommand >> menuGroup [

	^ CmdRootMenuGroup
]

{ #category : 'accessing' }
SycMessageCmCommand >> orderInContext: aToolContext [

	^ aToolContext isMethodSourceContext
		ifTrue: [ 1.3 ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycMessageCmCommand >> prepareFullExecution [

	self setUpModelFromContext: self context.
	refactoredClass := self context lastSelectedMessage methodClass.
	refactoringScopes := self context refactoringScopes.
	originalMessage := self context lastSelectedMessage
]

{ #category : 'preparation' }
SycMessageCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]
