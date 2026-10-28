Extension { #name : 'RBRefactoringError' }

{ #category : '*Commander2' }
RBRefactoringError >> notifyUserOfCommand: aCommand [

	InformativeNotification signal: messageText
]
