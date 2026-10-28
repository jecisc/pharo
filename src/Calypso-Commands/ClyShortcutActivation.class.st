"
I am the shortcut of a Commander2 command. I keep the keyboard shortcut annotation of the v1 CmdShortcutActivation, and when the key combination completely matches I run the command through the Commander2 contract (prepare, execute, apply the result, report failures to the context). I am removed together with Commander v1.
"
Class {
	#name : 'ClyShortcutActivation',
	#superclass : 'CmdShortcutActivation',
	#category : 'Calypso-Commands',
	#package : 'Calypso-Commands'
}

{ #category : 'accessing' }
ClyShortcutActivation class >> registeredInstances [

	^ self registry allInstancesOf: self
]

{ #category : 'executing' }
ClyShortcutActivation >> executeCommandInContext: aToolContext [

	self commandClass new
		context: aToolContext;
		execute
]

{ #category : 'executing' }
ClyShortcutActivation >> tryExecuteCommandInContext: aToolContext byEvents: anEventBuffer [

	(keyCombination matches: anEventBuffer) ifFalse: [ ^ false ].

	(self isActiveInContext: aToolContext) ifFalse: [ ^ false ].

	(keyCombination matchesCompletely: anEventBuffer)
		ifTrue: [
				KMBuffer uniqueInstance completeMatch.
				self executeCommandInContext: aToolContext ]
		ifFalse: [ KMBuffer uniqueInstance partialMatch ].
	^ true
]
