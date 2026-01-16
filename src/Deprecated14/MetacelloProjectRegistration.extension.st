Extension { #name : 'MetacelloProjectRegistration' }

{ #category : '*Deprecated14' }
MetacelloProjectRegistration >> baselineProjectSpec [

	self deprecated: 'Use #projectSpec instead.' transformWith: '`@rcv baselineProjectSpec' -> '`@rcv projectSpec'.
	^ self projectSpec
]

{ #category : '*Deprecated14' }
MetacelloProjectRegistration class >> baselineProjectSpecs [

	self deprecated: 'Use #projectSpecs instead.' transformWith: '`@rcv baselineProjectSpecs' -> '`@rcv projectSpecs'.
	^ self projectSpecs
]

{ #category : '*Deprecated14' }
MetacelloProjectRegistration class >> registry [

	self
		deprecated: 'The registry should be accessed via MetacelloProjectRegistry and not MetacelloProjectRegistration.'
		transformWith: '`@rcv registry' -> 'MetacelloProjectRegistry registry'.
	^ MetacelloProjectRegistry registry
]

{ #category : '*Deprecated14' }
MetacelloProjectRegistration class >> registry: aMetacelloProjectRegistry [

	self
		deprecated: 'The registry should be accessed via MetacelloProjectRegistry and not MetacelloProjectRegistration.'
		transformWith: '`@rcv registry: `@arg' -> 'MetacelloProjectRegistry registry: `@arg'.
	MetacelloProjectRegistry registry: aMetacelloProjectRegistry
]
