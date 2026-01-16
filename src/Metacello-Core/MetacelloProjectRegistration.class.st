Class {
	#name : 'MetacelloProjectRegistration',
	#superclass : 'Object',
	#instVars : [
		'loadedInImage',
		'locked',
		'versionString',
		'projectSpec'
	],
	#category : 'Metacello-Core-Registry',
	#package : 'Metacello-Core',
	#tag : 'Registry'
}

{ #category : 'instance creation' }
MetacelloProjectRegistration class >> projectSpec: aProjectSpec [

	^ self new
		  projectSpec: aProjectSpec;
		  yourself
]

{ #category : 'querying' }
MetacelloProjectRegistration class >> projectSpecForClassNamed: aClassName ifAbsent: absentBlock [

	^ MetacelloProjectRegistry registry projectSpecForClassNamed: aClassName ifAbsent: absentBlock
]

{ #category : 'accessing' }
MetacelloProjectRegistration class >> projectSpecs [

	^ MetacelloProjectRegistry registry projectSpecs
]

{ #category : 'registration' }
MetacelloProjectRegistration class >> registrationForClassNamed: aClassName ifAbsent: absentBlock [

	^ MetacelloProjectRegistry registry registrationForClassNamed: aClassName ifAbsent: absentBlock
]

{ #category : 'querying' }
MetacelloProjectRegistration class >> registrationForProjectSpec: aProjectSpec ifPresent: presentBlock [

	^ self registrationForProjectSpec: aProjectSpec ifPresent: presentBlock ifAbsent: [ ]
]

{ #category : 'querying' }
MetacelloProjectRegistration class >> registrationForProjectSpec: aProjectSpec ifPresent: presentBlock ifAbsent: absentBlock [

	^ MetacelloProjectRegistry registry registrationFor: aProjectSpec ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'comparing' }
MetacelloProjectRegistration >> = aRegistration [

	aRegistration class == self class ifFalse: [ ^ false ].
	^ projectSpec className = aRegistration className
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> baseName [
	^ self projectSpec baseName
]

{ #category : 'testing' }
MetacelloProjectRegistration >> canUpgradeTo: aProjectRegistration [

	^ projectSpec canUpgradeTo: aProjectRegistration projectSpec
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> currentVersionString [

	^ projectSpec repositoryVersionString
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> currentlyLoadedClassesInProject [
	"Used by SmalltalkCI."

	^ self projectSpec currentlyLoadedClassesInVersion asSet
]

{ #category : 'initialization' }
MetacelloProjectRegistration >> ensureVersionString: anObject [
	"set versionString, only if it does not already have avalue"

	versionString ifNil: [ self versionString: anObject ]
]

{ #category : 'testing' }
MetacelloProjectRegistration >> hasLoadConflicts: aProjectRegistration [

	^ aProjectRegistration projectSpec hasLoadConflicts: self projectSpec
]

{ #category : 'comparing' }
MetacelloProjectRegistration >> hash [

	^ String
		  stringHash: (projectSpec
				   ifNil: [ nil hash ]
				   ifNotNil: [ :project | project metacelloRegistrationHash ])
		  initialHash: 0
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> loadedInImage [

	^ loadedInImage ifNil: [ loadedInImage := false ]
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> loadedInImage: anObject [

	loadedInImage := anObject
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> locked [
    locked ifNil: [ locked := false ].
    ^ locked
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> locked: anObject [

	locked := anObject
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> merge: aProjectRegistration [
	" ... merge is done when a spec has been loaded into the image"

	projectSpec := aProjectRegistration projectSpec.
	versionString := projectSpec repositoryVersionString
]

{ #category : 'printing' }
MetacelloProjectRegistration >> printOn: aStream [

	| descriptions |
	aStream
		nextPutAll: self projectSpec className;
		space;
		nextPutAll: '[baseline]'.
	(descriptions := self repositoryDescriptions) isEmpty ifTrue: [ ^ self ].
	aStream nextPutAll: ' from '.
	descriptions size = 1
		ifTrue: [ aStream nextPutAll: descriptions first ]
		ifFalse: [
				aStream nextPut: ${.
				descriptions do: [ :description | aStream nextPutAll: description ].
				aStream nextPut: $} ]
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> projectName [

	^ self projectSpec name
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> projectSpec [

	^ projectSpec
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> projectSpec: anObject [

	projectSpec := anObject
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> projectVersion [

	^ self projectSpec version
]

{ #category : 'registration' }
MetacelloProjectRegistration >> registerProject [
	"unconditionally register <newRegistration> ... use with care"

	MetacelloProjectRegistry registry registerProjectRegistration: self
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> repositoryDescriptions [

	^ self projectSpec repositoryDescriptions
]

{ #category : 'registration' }
MetacelloProjectRegistration >> unregisterProject [

	MetacelloProjectRegistry registry unregisterProjectRegistration: self
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> versionInfo [
	"Deprecated in Pharo 14"
	^ self
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> versionString [

	^ versionString
]

{ #category : 'accessing' }
MetacelloProjectRegistration >> versionString: anObject [

	versionString := anObject
]
