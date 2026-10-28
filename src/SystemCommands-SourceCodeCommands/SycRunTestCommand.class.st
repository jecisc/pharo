Class {
	#name : 'SycRunTestCommand',
	#superclass : 'SycSourceCodeRefactoringCmCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycRunTestCommand class >> canBeExecutedInContext: aToolContext [

	^ aToolContext isMethodSelected not and: [ aToolContext isTestMethodSelected ]
]

{ #category : 'activation' }
SycRunTestCommand class >> methodEditorShorcutActivation [

	<classAnnotation>
	^ ClyShortcutActivation
		  by: $e meta , $t meta
		  for: ClyTextEditorContext
]

{ #category : 'converting' }
SycRunTestCommand >> asRefactorings [

	^ {  }
]

{ #category : 'accessing' }
SycRunTestCommand >> defaultMenuItemName [
	^ 'Run test'
]

{ #category : 'accessing' }
SycRunTestCommand >> description [

	^ 'Runs test.'
]

{ #category : 'execution' }
SycRunTestCommand >> executeRefactorings [

	| selector testClasses |
	selector := method selector.
	testClasses := method methodClass isAbstract
					   ifTrue: [ method methodClass allSubclasses ]
					   ifFalse: [ { method methodClass } ].

	testClasses do: [ :concreteClass |
		| testResult |
		testResult := concreteClass debug: selector.
		testResult updateResultsInHistory.
		GrowlMorph showTestResult: testResult with: selector ]
]

{ #category : 'accessing' }
SycRunTestCommand >> order [

	^ 1.4
]
