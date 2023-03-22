"
A PrefixTreeTest is a test class for testing the behavior of PrefixTree
"
Class {
	#name : #SymbolsTrieTest,
	#superclass : #TestCase,
	#category : #'Collections-Strings-Tests'
}

{ #category : #tests }
SymbolsTrieTest >> testAdd [

	| tree |
	tree := SymbolsTrie new.
	tree add: 'test'.
	self assert: (tree includes: 'test')
]

{ #category : #tests }
SymbolsTrieTest >> testAllSymbols [

	| tree |
	tree := SymbolsTrie new.
	tree
		add: 'test' asSymbol;
		add: 'foo' asSymbol;
		add: 'testons' asSymbol.
	self assertCollection: tree allSymbols hasSameElements: #( test foo testons )
]

{ #category : #tests }
SymbolsTrieTest >> testIncludes [

	| tree |
	tree := SymbolsTrie new.
	tree
		add: 'test';
		add: 'foo';
		add: 'testons'.
	self assert: (tree includes: 'test').
	self assert: (tree includes: 'testons').
	self assert: (tree includes: 'foo').

	self deny: (tree includes: 'fo').
	self deny: (tree includes: 'testo')
]
