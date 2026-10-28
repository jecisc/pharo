Class {
	#name : 'ClyClassDefinitionContext',
	#superclass : 'ClySourceCodeContext',
	#category : 'Calypso-SystemTools-Core-Editors-Classes',
	#package : 'Calypso-SystemTools-Core',
	#tag : 'Editors-Classes'
}

{ #category : 'testing' }
ClyClassDefinitionContext >> isArgOrTempVariableSelected [

	^ false
]

{ #category : 'testing' }
ClyClassDefinitionContext >> isClassDefinitionContext [

	^ true
]
