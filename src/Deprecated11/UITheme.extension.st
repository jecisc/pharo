Extension { #name : #UITheme }

{ #category : #'*Deprecated11' }
UITheme >> shStyleTableName [

	self deprecated: 'Use #shStyleName instead' transformWith: '`@rcv shStyleTableName' -> '`@rcv shStyleName'.

	^ self shStyleName
]
