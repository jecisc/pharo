Class {
	#name : 'SycScopesCmCommandTest',
	#superclass : 'SycAbstractCommandTest',
	#category : 'SystemCommands-ClassCommands-Tests-Tests',
	#package : 'SystemCommands-ClassCommands-Tests',
	#tag : 'Tests'
}

{ #category : 'tests' }
SycScopesCmCommandTest >> testClassScopeCommandCanBeExecuted [

	| command |
	command := SycAddClassesScopeCommand new
		           context: self contextOnPoint;
		           yourself.
	self assert: command canBeExecuted
]

{ #category : 'tests' }
SycScopesCmCommandTest >> testGroupContainsClassScopeCommand [

	| group |
	group := ClyCommandGroupBuilder buildFor: SycScopesCmCommand context: self contextOnPoint.
	self assert: (group commands anySatisfy: [ :command | command class = SycAddClassesScopeCommand ])
]

{ #category : 'tests' }
SycScopesCmCommandTest >> testGroupContainsCommands [

	| group |
	group := ClyCommandGroupBuilder buildFor: SycScopesCmCommand context: self contextOnPoint.
	self denyEmpty: group commands.
	self assert: (group commands noneSatisfy: [ :command | command class isAbstract ])
]
