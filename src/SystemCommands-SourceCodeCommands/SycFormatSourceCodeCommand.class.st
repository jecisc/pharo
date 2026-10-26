"
I am a command to format source code in given code editor.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	sourceCodeEditor:		<Object>
"
Class {
	#name : 'SycFormatSourceCodeCommand',
	#superclass : 'SycSourceCodeCmCommand',
	#category : 'SystemCommands-SourceCodeCommands',
	#package : 'SystemCommands-SourceCodeCommands'
}

{ #category : 'testing' }
SycFormatSourceCodeCommand class >> canBeExecutedInContext: aToolContext [

	^ true
]

{ #category : 'execution' }
SycFormatSourceCodeCommand >> applyResultInContext: aToolContext [

	"Nothing"
]

{ #category : 'accessing' }
SycFormatSourceCodeCommand >> description [

	^ 'Formats source code in given code editor'
]

{ #category : 'execution' }
SycFormatSourceCodeCommand >> execute [

	self context editor formatSourceCode
]

{ #category : 'accessing' }
SycFormatSourceCodeCommand >> icon [

	^ self iconNamed: #smallJustified
]

{ #category : 'testing' }
SycFormatSourceCodeCommand >> isComplexRefactoring [

	^ false
]

{ #category : 'accessing' }
SycFormatSourceCodeCommand >> name [

	^ 'Format code'
]

{ #category : 'accessing' }
SycFormatSourceCodeCommand >> order [

	^ 100000
]

{ #category : 'execution' }
SycFormatSourceCodeCommand >> prepareFullExecutionInContext: aToolContext [

	"Nothing"
]

{ #category : 'execution' }
SycFormatSourceCodeCommand >> readParametersFromContext: aToolContext [

	self context: aToolContext
]
