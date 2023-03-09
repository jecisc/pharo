"
## Description 

I am an abstract class to define a syntax highlight style.

I should return a dictionary of the style symbols and associated text attributes to apply with #textAttributes.

By default I'll use the pragma #shoutStyle: to collect the styles.

## Migration

To migrate the styles of previous style table:

```st
new := #SHVintageStyle.
styleName := #vintageStyleTable.

new := (SHStyle << new
	slots: {};
	tag: 'Styling';
	package: 'Shout') install.

new class compile: ('stylerName
	^ #' , styleName) classified: #accessing.

(SHRBTextStyler perform: styleName ) do: [ :array | 
	new compile: ('{1}
	<shoutStyle: #{1}>
	^ {2}' format: { array first . 
	
String streamContents: [ :s | 		
		s nextPutAll: '{ '.
		
		(array at: 2) ifNotNil: [ :c | s nextPutAll: '(TextColor color: '.
			
			c isArray ifTrue: [ 
				(Color respondsTo: c first asSymbol) 
					ifTrue: [ 
						s nextPutAll: 'Color '; nextPutAll: c first. (c at: 2 ifAbsent: [ nil ]) ifNotNil: [ :c2 | s space; nextPutAll: c2 ]. s nextPutAll: ') '
						 ] ifFalse: [ 
							s nextPutAll: '(Color colorFrom: '; print: c; nextPutAll: ')) '
						 ]
				 ] ifFalse: [ 
				(Color respondsTo: c asSymbol) 
					ifTrue: [ 
						s nextPutAll: 'Color '; nextPutAll: c; nextPutAll: ') '
						 ] ifFalse: [ 
							s nextPutAll: '(Color colorFrom: '; print: c; nextPutAll: ')) '
						 ]
					
				].
			
			 ].
		
		(array at: 3 ifAbsent: [ nil ]) ifNotNil: [ :e |  s nextPutAll: ' . TextEmphasis '; nextPutAll: e; nextPutAll: ' ' ].
		
		s nextPutAll: '}'
		
		
		 ].}) classified: #style
	
	 ]
```
"
Class {
	#name : #SHStyle,
	#superclass : #Object,
	#category : #'Shout-Styling'
}

{ #category : #testing }
SHStyle class >> isAbstract [

	^ self == SHStyle
]

{ #category : #accessing }
SHStyle class >> styleName [

	^ (self name withoutPrefix: 'SH') withoutSuffix: 'Style'
]

{ #category : #accessing }
SHStyle class >> styleNamed: aString [

	^ self stylers
		  detect: [ :class | class stylerName = aString ]
		  ifNone: [ self error: 'No style named ' , aString ]
]

{ #category : #accessing }
SHStyle class >> stylerName [

	^ self subclassResponsibility
]

{ #category : #accessing }
SHStyle class >> stylers [

	^ self allSubclasses reject: #isAbstract
]

{ #category : #accessing }
SHStyle >> textAttributes [

	^ ((self class allMethods select: [ :m | m hasPragmaNamed: #shoutStyle: ]) collect: [ :method |
		   ((method pragmaAt: #shoutStyle:) argumentAt: 1) -> (self perform: method selector) ]) as: IdentityDictionary
]
