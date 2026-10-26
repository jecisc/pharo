"
I am a command to extract setUp method and then replaces its occurrences
"
Class {
	#name : 'SycExtractSetUpCommand',
	#superclass : 'SycSourceCodeRefactoringCmCommand',
	#instVars : [
		'selectedTextInterval'
	],
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycExtractSetUpCommand class >> canBeExecutedInContext: aToolContext [

	^ aToolContext isMethodSelected not and: [ aToolContext isTestMethodSelected ]
]

{ #category : 'executing' }
SycExtractSetUpCommand >> asRefactorings [
	| selectedInterval refactoring |
	selectedInterval := selectedTextInterval ifEmpty: [
		                    sourceNode sourceInterval ].
	refactoring := RBExtractSetUpMethodAndOccurrences
		extract: selectedInterval
		from: method selector
		in: method origin.
	
	^ { refactoring }
]

{ #category : 'accessing' }
SycExtractSetUpCommand >> icon [

	^ self iconNamed: #restart
]

{ #category : 'accessing' }
SycExtractSetUpCommand >> name [

	^ 'Extract setUp'
]

{ #category : 'accessing' }
SycExtractSetUpCommand >> order [

	^ 1.4
]

{ #category : 'execution' }
SycExtractSetUpCommand >> prepareFullExecution [

	super prepareFullExecution.
	selectedTextInterval := self context selectedTextInterval
]
