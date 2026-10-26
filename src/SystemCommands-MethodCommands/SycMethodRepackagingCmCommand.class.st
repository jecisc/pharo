Class {
	#name : 'SycMethodRepackagingCmCommand',
	#superclass : 'SycMethodCmCommand',
	#category : 'SystemCommands-MethodCommands',
	#package : 'SystemCommands-MethodCommands'
}

{ #category : 'testing' }
SycMethodRepackagingCmCommand class >> isAbstract [

	^ self = SycMethodRepackagingCmCommand
]

{ #category : 'categories' }
SycMethodRepackagingCmCommand >> classifyMethod: aMethod [

	aMethod protocol: (self newProtocolFor: aMethod)
]

{ #category : 'categories' }
SycMethodRepackagingCmCommand >> newProtocolFor: aMethod [

	^ StProtocolNameChooserPresenter requestProtocolNameConfiguring: [ :presenter :dialog |
			  dialog title: 'New protocol name for: ' , aMethod name.
			  presenter
				  protocolName: (MethodClassifier suggestProtocolFor: aMethod);
				  concernedClass: aMethod methodClass ]
]
