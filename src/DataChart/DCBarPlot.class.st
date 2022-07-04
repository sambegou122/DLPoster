"
This class represent the objet who manage the RSBar objet of Roassal-chart
"
Class {
	#name : #DCBarPlot,
	#superclass : #DCPlot,
	#instVars : [
		'isStringData',
		'stringData'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCBarPlot >> changeTicks [ 
	isStringData ifNotNil:[
		self settings xtick
			fromNames: self stringData.
		self settings ytick
			numberOfTicks: self x size  -1].
	isStringData ifNil: [   
		self settings xtick
			doNotUseNiceLabel
			numberOfTicks: self y size  -1.
		self settings ytick
			numberOfTicks: self x size  -1].
]

{ #category : #default }
DCBarPlot >> defaultKind [
	^ RSBarPlot new.
]

{ #category : #adding }
DCBarPlot >> stringData [
	^stringData
]

{ #category : #accessing }
DCBarPlot >> x: aCollection [
	aCollection first isString 
	ifTrue:[ isStringData := true.  stringData:= aCollection ]
	ifFalse: [  
	aCollection isSorted 
		ifTrue: [ super x: aCollection  ] 
		ifFalse: [ self error: 'the collection must be sorted' ]. ]
	
]

{ #category : #accessing }
DCBarPlot >> y: aCollection [
	self x ifNil: [ self x: (1 to: aCollection size) ].
	isStringData 
		ifNotNil:[ self stringData size = aCollection size 
			ifFalse:[ self error:'the two collectionn must have the same size' ]].
	super y: aCollection
	
]
