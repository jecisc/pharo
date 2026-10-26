"
I am a command to push up given variables
"
Class {
	#name : 'SycPushUpVariableCommand',
	#superclass : 'SycVariableCmCommand',
	#category : 'SystemCommands-VariableCommands',
	#package : 'SystemCommands-VariableCommands'
}

{ #category : 'execution' }
SycPushUpVariableCommand >> defaultMenuIconName [
	^ #up
]

{ #category : 'accessing' }
SycPushUpVariableCommand >> defaultMenuItemName [
	^'(R) Push up'
]

{ #category : 'accessing' }
SycPushUpVariableCommand >> executeRefactorings [

	^ ((RePushUpVariableDriver newApplication: self application)
		   scopes: refactoringScopes
		   variables: (variables collect: [ :v | v actualVariable ])
		   to: variables first definingClass superclass) runRefactoring
]

{ #category : 'accessing' }
SycPushUpVariableCommand >> order [

	^ 1.3
]
