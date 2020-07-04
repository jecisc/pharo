Class {
	#name : #ReGlobalVariableRuleTest,
	#superclass : #TestCase,
	#category : #'GeneralRules-Tests-Migrated'
}

{ #category : #tests }
ReGlobalVariableRuleTest >> applyingCritiques [
	^ self class methods
		select: [ :m | (ReGlobalVariablesUsageRule new check: m) isNotEmpty ]
]

{ #category : #tests }
ReGlobalVariableRuleTest >> methodNotUsesGlobal [
	String streamContents: [ :str | str nextPut: #something ]
]

{ #category : #tests }
ReGlobalVariableRuleTest >> methodNotUsesGlobal2 [
	| x |
	x := '...'.
	1.9.
	#( a b c ).
	{ 1. 2. 3 }.
	#a.
	$a.

	^ x
]

{ #category : #tests }
ReGlobalVariableRuleTest >> methodUsesGlobal [
	Smalltalk version 
]

{ #category : #tests }
ReGlobalVariableRuleTest >> methodUsesGlobal2 [
	Processor activeProcess
]

{ #category : #tests }
ReGlobalVariableRuleTest >> testTheRuleCanCheckMethodsWithDifferentKindsOfLiterals [
	self assertEmpty: (ReGlobalVariablesUsageRule new check: self class >> #methodNotUsesGlobal2)
]

{ #category : #tests }
ReGlobalVariableRuleTest >> testTheRuleOnlyDetect2MethodsWithGlobalVariables [
	self assert: self applyingCritiques size equals: 2
]

{ #category : #tests }
ReGlobalVariableRuleTest >> testTheRuleOnlyMethodUsesGlobal1And2 [
	self assertCollection: (self applyingCritiques collect: [:each | each selector]) hasSameElements: {#methodUsesGlobal . #methodUsesGlobal2}
]
