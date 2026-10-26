"
I am a command to convert a temp variable in instance variable.
"
Class {
	#name : 'SycConvertTempToInstVarCommand',
	#superclass : 'SycSourceCodeRefactoringCmCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycConvertTempToInstVarCommand class >> canBeExecutedInContext: aSourceCodeContext [
	^(super canBeExecutedInContext: aSourceCodeContext) and: [aSourceCodeContext isTempVariableSelected]
]

{ #category : 'execution' }
SycConvertTempToInstVarCommand >> executeRefactorings [

	^ ((ReConvertTemporaryToInstanceVariableDriver newApplication: self application)
		   scopes: refactoringScopes
		   class: method origin
		   selector: method selector
		   variable: sourceNode name) runRefactoring
]

{ #category : 'accessing' }
SycConvertTempToInstVarCommand >> icon [

	^ self iconNamed: #smallRedo
]

{ #category : 'accessing' }
SycConvertTempToInstVarCommand >> name [

	^ '(R) Convert to Instance Var'
]

{ #category : 'accessing' }
SycConvertTempToInstVarCommand >> order [

	^ 1.4
]
