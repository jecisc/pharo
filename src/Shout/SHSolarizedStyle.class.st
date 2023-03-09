"
This style is based on old theme and other old environments.
"
Class {
	#name : #SHSolarizedStyle,
	#superclass : #SHBlueStyle,
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHSolarizedStyle class >> stylerName [
	^ #solarizedStyleTable
]

{ #category : #style }
SHSolarizedStyle >> argument [
	<shoutStyle: #argument>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> blockArg [
	<shoutStyle: #blockArg>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> blockPatternArg [
	<shoutStyle: #blockPatternArg>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> blockPatternTempVar [
	<shoutStyle: #blockPatternTempVar>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> blockTempVar [
	<shoutStyle: #blockTempVar>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> cascadeSeparator [
	<shoutStyle: #cascadeSeparator>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> character [
	<shoutStyle: #character>
	^ { (TextColor color: (Color colorFrom: #('268BD2' #lighter))) }
]

{ #category : #style }
SHSolarizedStyle >> classVar [
	<shoutStyle: #classVar>
	^ { (TextColor color: (Color colorFrom: #('D33682')))  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> comment [
	<shoutStyle: #comment>
	^ { (TextColor color: (Color colorFrom: '586E75')) }
]

{ #category : #style }
SHSolarizedStyle >> default [
	<shoutStyle: #default>
	^ { (TextColor color: (Color colorFrom: #('657A81' #muchDarker))) }
]

{ #category : #style }
SHSolarizedStyle >> false [
	<shoutStyle: #false>
	^ { (TextColor color: (Color colorFrom: #('CB4B16' #darker))) }
]

{ #category : #style }
SHSolarizedStyle >> globalVar [
	<shoutStyle: #globalVar>
	^ { (TextColor color: (Color colorFrom: #('268BD2' #muchDarker)))  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> incompleteIdentifier [
	<shoutStyle: #incompleteIdentifier>
	^ { (TextColor color: (Color colorFrom: 'D33682'))  . TextEmphasis italic }
]

{ #category : #style }
SHSolarizedStyle >> instVar [
	<shoutStyle: #instVar>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> invalid [
	<shoutStyle: #invalid>
	^ { (TextColor color: Color red) }
]

{ #category : #style }
SHSolarizedStyle >> methodTempBar [
	<shoutStyle: #methodTempBar>
	^ { (TextColor color: Color black) }
]

{ #category : #style }
SHSolarizedStyle >> nil [
	<shoutStyle: #nil>
	^ { (TextColor color: (Color colorFrom: #('CB4B16' #darker))) }
]

{ #category : #style }
SHSolarizedStyle >> number [
	<shoutStyle: #number>
	^ { (TextColor color: (Color colorFrom: #('2AA198'))) }
]

{ #category : #style }
SHSolarizedStyle >> patternSelector [
	<shoutStyle: #patternSelector>
	^ { (TextColor color: (Color colorFrom: '657A81'))  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> patternTempVar [
	<shoutStyle: #patternTempVar>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> poolConstant [
	<shoutStyle: #poolConstant>
	^ { (TextColor color: (Color colorFrom: #('D33682')))  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> pragma [
	<shoutStyle: #pragma>
	^ { (TextColor color: Color cyan muchDarker) }
]

{ #category : #style }
SHSolarizedStyle >> return [
	<shoutStyle: #return>
	^ { (TextColor color: (Color colorFrom: 'B58900'))  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> selector [
	<shoutStyle: #selector>
	^ { }
]

{ #category : #style }
SHSolarizedStyle >> self [
	<shoutStyle: #self>
	^ { (TextColor color: (Color colorFrom: 'B58900')) }
]

{ #category : #style }
SHSolarizedStyle >> statementSeparator [
	<shoutStyle: #statementSeparator>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHSolarizedStyle >> string [
	<shoutStyle: #string>
	^ { (TextColor color: (Color colorFrom: #('268BD2'))) }
]

{ #category : #style }
SHSolarizedStyle >> super [
	<shoutStyle: #super>
	^ { (TextColor color: (Color colorFrom: 'B58900')) }
]

{ #category : #style }
SHSolarizedStyle >> symbol [
	<shoutStyle: #symbol>
	^ { (TextColor color: (Color colorFrom: #('268BD2'))) }
]

{ #category : #style }
SHSolarizedStyle >> tempVar [
	<shoutStyle: #tempVar>
	^ { (TextColor color: (Color colorFrom: #('D33682'))) }
]

{ #category : #style }
SHSolarizedStyle >> thisContext [
	<shoutStyle: #thisContext>
	^ { (TextColor color: (Color colorFrom: 'B58900')) }
]

{ #category : #style }
SHSolarizedStyle >> true [
	<shoutStyle: #true>
	^ { (TextColor color: (Color colorFrom: #('CB4B16' #darker))) }
]
