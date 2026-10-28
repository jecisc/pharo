"
I am the activator of a command which is dragged and dropped. I keep the drop context where the command is executed, and I run the drag preparation before the drop preparation, so the command has the state of both the drag and the drop.
"
Class {
	#name : 'ClyDragAndDropCommandActivator',
	#superclass : 'ClyCommandActivator',
	#instVars : [
		'dropContext'
	],
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'instance creation' }
ClyDragAndDropCommandActivator class >> createCommand: aCommandClass inContext: aToolContext [
	| command |
	command := super createCommand: aCommandClass inContext: aToolContext.
	command prepareExecutionInDragContext: aToolContext.
	^ command
]

{ #category : 'executing' }
ClyDragAndDropCommandActivator >> applyCommandResult [
	command applyResultInContext: context.
	command applyDropResultInContext: dropContext
]

{ #category : 'testing' }
ClyDragAndDropCommandActivator >> canExecuteCommand [

	^super canExecuteCommand and: [ self canExecuteDropInContext: dropContext ]
]

{ #category : 'testing' }
ClyDragAndDropCommandActivator >> canExecuteDropInContext: aToolContext [

	^(activationStrategy isDropActiveInContext: aToolContext)
		and: [  aToolContext allowsDropExecutionOf: command ]
]

{ #category : 'executing' }
ClyDragAndDropCommandActivator >> executeCommand [
	[ self prepareCommandForExecution.
		command context: context.
		command execute.
		self applyCommandResult ]
	on: Exception do: [ :exc | context processFailure: exc of: command ]
]

{ #category : 'execution' }
ClyDragAndDropCommandActivator >> executeDropInContext: aToolContext [
	dropContext := aToolContext.
	self executeCommand
]

{ #category : 'executing' }
ClyDragAndDropCommandActivator >> prepareCommandForExecution [
	command prepareExecutionInDragContext: context.
	command prepareExecutionInDropContext: dropContext
]
