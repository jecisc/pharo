"
I am a Commander2 hybrid for the rename and deprecate message commands, which show in the method item menu and in the source code menu. I sit under the v1 SycChangeMessageSignatureCommand, so the Refactorings submenu (SycMessageCmCommand) does not receive them. I am removed together with Commander v1.
"
Class {
	#name : 'SycChangeMessageMenuCmCommand',
	#superclass : 'SycChangeMessageSignatureCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'initialization' }
SycChangeMessageMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'preparation' }
SycChangeMessageMenuCmCommand >> prepareFullExecution [

	self setUpModelFromContext: self context.
	refactoredClass := self context lastSelectedMessage methodClass.
	refactoringScopes := self context refactoringScopes.
	originalMessage := self context lastSelectedMessage
]

{ #category : 'preparation' }
SycChangeMessageMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	super prepareFullExecutionInContext: aToolContext.
	prepared := true
]
