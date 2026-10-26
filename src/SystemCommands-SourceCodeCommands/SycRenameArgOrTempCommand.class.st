"
I am a command to rename temp variable in given method.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	newName:		<String>
"
Class {
	#name : 'SycRenameArgOrTempCommand',
	#superclass : 'SycSourceCodeRefactoringCmCommand',
	#instVars : [
		'newName',
		'toolContext'
	],
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycRenameArgOrTempCommand class >> canBeExecutedInContext: aSourceCodeContext [

	^ (super canBeExecutedInContext: aSourceCodeContext) and: [
		  aSourceCodeContext isArgOrTempVariableSelected ]
]

{ #category : 'execution' }
SycRenameArgOrTempCommand >> applyResultInContext: aSourceCodeContext [
	super applyResultInContext: aSourceCodeContext.

	aSourceCodeContext showVariableNamed: newName
]

{ #category : 'accessing' }
SycRenameArgOrTempCommand >> defaultMenuIconName [
	^ #edit
]

{ #category : 'accessing' }
SycRenameArgOrTempCommand >> defaultMenuItemName [
	^' (Old refactor) rename temp'
]

{ #category : 'accessing' }
SycRenameArgOrTempCommand >> description [

	^ 'Renames temp variable in given method.'
]

{ #category : 'execution' }
SycRenameArgOrTempCommand >> executeRefactorings [

	^ (ReRenameArgumentOrTemporaryDriver new
		   sourceNode: sourceNode;
		   method: method;
		   scopes: refactoringScopes;
		   yourself) runRefactoring
]

{ #category : 'accessing' }
SycRenameArgOrTempCommand >> order [

	^ 1.2
]
