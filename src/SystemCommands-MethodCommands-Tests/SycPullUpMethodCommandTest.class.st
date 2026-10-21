Class {
	#name : 'SycPullUpMethodCommandTest',
	#superclass : 'TestCase',
	#category : 'SystemCommands-MethodCommands-Tests',
	#package : 'SystemCommands-MethodCommands-Tests'
}

{ #category : 'helpers' }
SycPullUpMethodCommandTest >> contextOn: aClass selector: aSelector [
	^ SycMockMethodContext new
		  selectedMethods: { aClass >> aSelector };
		  yourself
]

{ #category : 'tests' }
SycPullUpMethodCommandTest >> testGroupContainsPullUpCommand [

	| group |
	group := ClyCommandGroupBuilder buildFor: SycMethodCmCommand context: (self contextOn: Fraction selector: #numerator).
	self assert: (group commands anySatisfy: [ :each | each class = SycPullUpMethodCommand ])
]

{ #category : 'tests' }
SycPullUpMethodCommandTest >> testPullUpIsExecutableForNonObjectSubclass [

	self assert: (SycPullUpMethodCommand canBeExecutedInContext: (self contextOn: Fraction selector: #numerator))
]
