"
This is a syntax coloring scheme based on the tango desktop icon scheme:
	http://tango.freedesktop.org/Tango_Icon_Theme_Guidelines
"
Class {
	#name : #SHTangoStyle,
	#superclass : #SHBlueStyle,
	#category : #'Shout-Styling'
}

{ #category : #accessing }
SHTangoStyle class >> stylerName [
	^ #tangoStyleTable
]

{ #category : #style }
SHTangoStyle >> argument [
	<shoutStyle: #argument>
	^ { (TextColor color: (Color colorFrom: '555753'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> blockArg [
	<shoutStyle: #blockArg>
	^ { (TextColor color: (Color colorFrom: '555753'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> blockPatternArg [
	<shoutStyle: #blockPatternArg>
	^ { (TextColor color: (Color colorFrom: '888a85'))  . TextEmphasis bold }
]

{ #category : #style }
SHTangoStyle >> blockPatternTempVar [
	<shoutStyle: #blockPatternTempVar>
	^ { (TextColor color: (Color colorFrom: '888a85'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> blockTempVar [
	<shoutStyle: #blockTempVar>
	^ { (TextColor color: (Color colorFrom: '555753'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> character [
	<shoutStyle: #character>
	^ { (TextColor color: (Color colorFrom: 'ce5c00')) }
]

{ #category : #style }
SHTangoStyle >> classVar [
	<shoutStyle: #classVar>
	^ { (TextColor color: (Color colorFrom: 'ad7fa8'))  . TextEmphasis bold }
]

{ #category : #style }
SHTangoStyle >> comment [
	<shoutStyle: #comment>
	^ { (TextColor color: (Color colorFrom: '888a85')) }
]

{ #category : #style }
SHTangoStyle >> false [
	<shoutStyle: #false>
	^ { (TextColor color: (Color colorFrom: '8F5902')) }
]

{ #category : #style }
SHTangoStyle >> globalVar [
	<shoutStyle: #globalVar>
	^ { (TextColor color: (Color colorFrom: '5c3566'))  . TextEmphasis bold }
]

{ #category : #style }
SHTangoStyle >> incompleteSelector [
	<shoutStyle: #incompleteSelector>
	^ { (TextColor color: Color blue)  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> instVar [
	<shoutStyle: #instVar>
	^ { (TextColor color: (Color colorFrom: '204a87')) }
]

{ #category : #style }
SHTangoStyle >> nil [
	<shoutStyle: #nil>
	^ { (TextColor color: (Color colorFrom: '8F5902')) }
]

{ #category : #style }
SHTangoStyle >> number [
	<shoutStyle: #number>
	^ { (TextColor color: (Color colorFrom: '8f5902')) }
]

{ #category : #style }
SHTangoStyle >> patternTempVar [
	<shoutStyle: #patternTempVar>
	^ { (TextColor color: (Color colorFrom: '888a85'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> poolConstant [
	<shoutStyle: #poolConstant>
	^ { (TextColor color: (Color colorFrom: 'ad7fa8'))  . TextEmphasis bold }
]

{ #category : #style }
SHTangoStyle >> return [
	<shoutStyle: #return>
	^ { (TextColor color: Color black)  . TextEmphasis bold }
]

{ #category : #style }
SHTangoStyle >> self [
	<shoutStyle: #self>
	^ { (TextColor color: (Color colorFrom: '4d9a06')) }
]

{ #category : #style }
SHTangoStyle >> string [
	<shoutStyle: #string>
	^ { (TextColor color: (Color colorFrom: 'ce5c00')) }
]

{ #category : #style }
SHTangoStyle >> super [
	<shoutStyle: #super>
	^ { (TextColor color: (Color colorFrom: '4d9a06')) }
]

{ #category : #style }
SHTangoStyle >> symbol [
	<shoutStyle: #symbol>
	^ { (TextColor color: (Color colorFrom: 'c4a000')) }
]

{ #category : #style }
SHTangoStyle >> tempVar [
	<shoutStyle: #tempVar>
	^ { (TextColor color: (Color colorFrom: '555753'))  . TextEmphasis italic }
]

{ #category : #style }
SHTangoStyle >> thisContext [
	<shoutStyle: #thisContext>
	^ { (TextColor color: (Color colorFrom: '4d9a06')) }
]

{ #category : #style }
SHTangoStyle >> true [
	<shoutStyle: #true>
	^ { (TextColor color: (Color colorFrom: '8F5902')) }
]
