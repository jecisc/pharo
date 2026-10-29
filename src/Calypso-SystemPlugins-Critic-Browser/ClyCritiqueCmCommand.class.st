"
I am a Commander2 hybrid for the commands on critiques of the critic browser and critic table. I sit under the v1 ClyCritiqueCommand and keep its legacy lifecycle for the table icons, while menus run my subclasses through the Commander2 contract. I am removed together with Commander v1.
"
Class {
	#name : 'ClyCritiqueCmCommand',
	#superclass : 'ClyCritiqueCommand',
	#category : 'Calypso-SystemPlugins-Critic-Browser',
	#package : 'Calypso-SystemPlugins-Critic-Browser'
}

{ #category : 'testing' }
ClyCritiqueCmCommand class >> isAbstract [

	^ self subclasses isEmpty not
]
