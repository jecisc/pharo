Class {
	#name : 'MetacelloProjectRegistry',
	#superclass : 'Object',
	#instVars : [
		'projectSpecsRegistry'
	],
	#category : 'Metacello-Core-Registry',
	#package : 'Metacello-Core',
	#tag : 'Registry'
}

{ #category : 'baselines' }
MetacelloProjectRegistry >> baselineNameFrom: baseName [
	"Return the fully-qualified configuration class name."

	^ (baseName indexOfSubCollection: 'BaselineOf') > 0
		  ifTrue: [ baseName ]
		  ifFalse: [ 'BaselineOf' , baseName ]
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> isEmpty [

	^ self baselineProjectSpecs isEmpty
]

{ #category : 'copying' }
MetacelloProjectRegistry >> postCopy [

	super postCopy.
	projectSpecsRegistry := self projectSpecsRegistry copy
]

{ #category : 'querying' }
MetacelloProjectRegistry >> projectSpecForClassNamed: aClassName ifAbsent: absentBlock [

	^ (self projectSpecsRegistry at: aClassName ifAbsent: [ ^ absentBlock value ]) projectSpec
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> projectSpecs [

	^ self projectSpecsRegistry values collect: [ :registration | registration projectSpec ]
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> projectSpecsRegistry [

	^ projectSpecsRegistry ifNil: [ projectSpecsRegistry := Dictionary new ]
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registerProjectRegistration: aMetacelloProjectRegistration [
	"unconditionally register <newRegistration> ... use with care"

	| spec |
	spec := aMetacelloProjectRegistration projectSpec.
	self projectSpecsRegistry at: spec className ifPresent: [ :existing |
			existing projectSpec className = spec className ifFalse: [
				MetacelloNotification signal: 'REGISTRATION OF INCOMPATABLE PROJECTS: ' , existing printString , ' REPLACED BY ' , aMetacelloProjectRegistration printString ] ].
	aMetacelloProjectRegistration ensureVersionString: spec repositoryVersionString.
	self projectSpecsRegistry at: spec className put: aMetacelloProjectRegistration
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationFor: aMetacelloProjectSpec ifPresent: presentBlock ifAbsent: absentBlock [

	^ self registrationForClassNamed: aMetacelloProjectSpec className ifPresent: presentBlock ifAbsent: absentBlock
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationForClassNamed: aClassName ifAbsent: absentBlock [

	^ self registrationForClassNamed: aClassName ifPresent: [ :registration | ^ registration ] ifAbsent: absentBlock
]

{ #category : 'registration' }
MetacelloProjectRegistry >> registrationForClassNamed: aClassName ifPresent: aBlock ifAbsent: absentBlock [

	^ self projectSpecsRegistry
		  at: (self baselineNameFrom: aClassName)
		  ifPresent: aBlock
		  ifAbsent: absentBlock value
]

{ #category : 'accessing' }
MetacelloProjectRegistry >> registrations [

	^ self projectSpecsRegistry values
]

{ #category : 'registration' }
MetacelloProjectRegistry >> unregisterProjectRegistration: aMetacelloProjectRegistration [

	self projectSpecsRegistry removeKey: aMetacelloProjectRegistration projectSpec className ifAbsent: [ self error: 'unexpectedly missing project registration' ]
]
