"
I am a temporary bridge between the legacy CmdCommand API and Commander2. I keep the v1 execution lifecycle working while commands are migrated. I will be removed once Commander v1 is gone.
"
Class {
	#name : 'SycLegacyCmCommand',
	#superclass : 'SycCmCommand',
	#category : 'SystemCommands-RefactoringSupport',
	#package : 'SystemCommands-RefactoringSupport'
}

{ #category : 'accessing' }
SycLegacyCmCommand >> application [

	^ StPharoApplication current
]

{ #category : 'execution' }
SycLegacyCmCommand >> applyCommandResult [

	self applyResultInContext: self context
]

{ #category : 'execution' }
SycLegacyCmCommand >> applyResultInContext: aToolContext [

	
]

{ #category : 'ui requests' }
SycLegacyCmCommand >> confirm: aString [

	^ self application confirm: aString
]

{ #category : 'execution' }
SycLegacyCmCommand >> execute [

	prepared
		ifTrue: [ self executeRefactorings ]
		ifFalse: [
				[
					prepared := true.
					self prepareFullExecution.
					self executeRefactoring.
					self applyCommandResult ]
					on: Exception
					do: [ :exception | self processCommandFailure: exception ] ]
]

{ #category : 'execution' }
SycLegacyCmCommand >> executeRefactoring [

	^ self executeRefactorings
]

{ #category : 'execution' }
SycLegacyCmCommand >> executeRefactorings [

	self asRefactorings do: [ :each | each execute ]
]

{ #category : 'testing' }
SycLegacyCmCommand >> isComplexRefactoring [

	^ false
]
