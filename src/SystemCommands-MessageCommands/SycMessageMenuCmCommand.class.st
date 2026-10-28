"
I am a Commander2 hybrid for the message commands that browse senders (hierarchical senders). I sit under the v1 SycMessageCommand and keep its legacy lifecycle for the shortcuts, while the menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'SycMessageMenuCmCommand',
	#superclass : 'SycMessageCommand',
	#traits : 'TCommanderMigrationHybridCommand',
	#classTraits : 'TCommanderMigrationHybridCommand classTrait',
	#category : 'SystemCommands-MessageCommands',
	#package : 'SystemCommands-MessageCommands'
}

{ #category : 'initialization' }
SycMessageMenuCmCommand >> initialize [

	super initialize.
	prepared := false
]

{ #category : 'accessing' }
SycMessageMenuCmCommand >> orderInContext: aToolContext [

	^ aToolContext isMethodSourceContext
		ifTrue: [ 1.2 ]
		ifFalse: [ self order ]
]

{ #category : 'preparation' }
SycMessageMenuCmCommand >> prepareFullExecution [

	messages := self context selectedMessages
]

{ #category : 'execution' }
SycMessageMenuCmCommand >> prepareFullExecutionInContext: aToolContext [

	self context: aToolContext.
	self prepareFullExecution.
	prepared := true
]
