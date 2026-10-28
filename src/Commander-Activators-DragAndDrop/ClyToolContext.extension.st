Extension { #name : 'ClyToolContext' }

{ #category : '*Commander-Activators-DragAndDrop' }
ClyToolContext >> allowsDropExecutionOf: aCommand [
	^aCommand canBeExecutedInDropContext: self
]

{ #category : '*Commander-Activators-DragAndDrop' }
ClyToolContext >> applyDropResultOf: aCommand [
	aCommand applyDropResultInContext: self
]

{ #category : '*Commander-Activators-DragAndDrop' }
ClyToolContext >> prepareDragActivationOf: aCommand [
	aCommand prepareExecutionInDragContext: self
]

{ #category : '*Commander-Activators-DragAndDrop' }
ClyToolContext >> prepareDropExecutionOf: aCommand [
	aCommand prepareExecutionInDropContext: self
]
