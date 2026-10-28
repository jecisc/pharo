"
I am a command to install watchpoints on variables of a class.
"
Class {
	#name : 'ClyDebugWatchOnVariableCommand',
	#superclass : 'ClyDebugVariableCmCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableCommand class >> debugPointClass [

	^ WatchDebugPoint
]
