Class {
	#name : 'SycTestCommand',
	#superclass : 'SycSourceCodeRefactoringCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycTestCommand class >> canBeExecutedInContext: aToolContext [

	^ (super canBeExecutedInContext: aToolContext) and: [
		  aToolContext isMethodSelected not and: [
			  aToolContext isTestMethodSelected ] ]
]

{ #category : 'testing' }
SycTestCommand class >> isAbstract [

	^ self == SycTestCommand
]
