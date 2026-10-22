"
Tests for SycPushDownMethodInSomeClassesCommand.
"
Class {
	#name : 'SycPushDownMethodInSomeClassesCommandTest',
	#superclass : 'TestCase',
	#category : 'SystemCommands-MethodCommands-Tests',
	#package : 'SystemCommands-MethodCommands-Tests'
}

{ #category : 'helpers' }
SycPushDownMethodInSomeClassesCommandTest >> contextOn: aClass selector: aSelector [

	^ SycMockMethodContext new
		  selectedMethods: { (aClass >> aSelector) };
		  yourself
]

{ #category : 'tests' }
SycPushDownMethodInSomeClassesCommandTest >> testGroupContainsCommand [

	| group |
	group := ClyCommandGroupBuilder buildSortedForAll: { SycMethodCmCommand } context: (self contextOn: Fraction selector: #numerator).
	self assert: (group commands anySatisfy: [ :each | each class = SycPushDownMethodInSomeClassesCommand ])
]

{ #category : 'tests' }
SycPushDownMethodInSomeClassesCommandTest >> testIsExecutableForSelectedMethod [

	self assert: (SycPushDownMethodInSomeClassesCommand canBeExecutedInContext: (self contextOn: Fraction selector: #numerator))
]

{ #category : 'tests' }
SycPushDownMethodInSomeClassesCommandTest >> testIsNotExecutableWithoutSelection [

	self deny: (SycPushDownMethodInSomeClassesCommand canBeExecutedInContext: SycMockMethodContext new)
]
