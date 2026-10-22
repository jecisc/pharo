"
Tests for SycPushDownMethodCommand.
"
Class {
	#name : 'SycPushDownMethodCommandTest',
	#superclass : 'TestCase',
	#category : 'SystemCommands-MethodCommands-Tests',
	#package : 'SystemCommands-MethodCommands-Tests'
}

{ #category : 'helpers' }
SycPushDownMethodCommandTest >> contextOn: aClass selector: aSelector [

	^ SycMockMethodContext new
		  selectedMethods: { (aClass >> aSelector) };
		  yourself
]

{ #category : 'tests' }
SycPushDownMethodCommandTest >> testGroupContainsPushDownCommand [

	| group |
	group := ClyCommandGroupBuilder buildSortedFor: SycMethodCmCommand context: (self contextOn: Fraction selector: #numerator).
	self assert: (group commands anySatisfy: [ :each | each class = SycPushDownMethodCommand ])
]

{ #category : 'tests' }
SycPushDownMethodCommandTest >> testPushDownIsExecutableForSelectedMethod [

	self assert: (SycPushDownMethodCommand canBeExecutedInContext: (self contextOn: Fraction selector: #numerator))
]

{ #category : 'tests' }
SycPushDownMethodCommandTest >> testPushDownIsNotExecutableWithoutSelection [

	self deny: (SycPushDownMethodCommand canBeExecutedInContext: SycMockMethodContext new)
]
