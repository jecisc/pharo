"
I am a Commander2 hybrid for the commands that run tests from the browsers. I sit under the v1 ClyTestCommand and keep its legacy lifecycle for the table icons and shortcuts, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyTestCmCommand',
	#superclass : 'ClyTestCommand',
	#category : 'Calypso-SystemPlugins-SUnit-Browser',
	#package : 'Calypso-SystemPlugins-SUnit-Browser'
}

{ #category : 'testing' }
ClyTestCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]
