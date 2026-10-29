"
I am a Commander2 hybrid for the debug point commands applied to the variables of the full browser. I sit under the v1 ClyDebugVariableCommand and keep its legacy lifecycle for the shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyDebugVariableCmCommand',
	#superclass : 'ClyDebugVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'testing' }
ClyDebugVariableCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]

{ #category : 'execution' }
ClyDebugVariableCmCommand >> prepareFullExecution [

	variables := self context selectedVariables
]
