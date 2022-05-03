Class {
	#name : #DCPlotSettings,
	#superclass : #Object,
	#instVars : [
		'properties',
		'decorations'
	],
	#category : #'DataChart-Core'
}

{ #category : #accessing }
DCPlotSettings >> color [
	^ self propertyAt: #color
]

{ #category : #accessing }
DCPlotSettings >> color: aColor [
	self propertyAt: #color put: aColor
]

{ #category : #accessing }
DCPlotSettings >> dataFrame [
	^ self propertyAt: #dataFrame ifAbsent: [ nil ]
]

{ #category : #accessing }
DCPlotSettings >> dataFrame: aDataFrame [
	self propertyAt: #dataFrame put: aDataFrame
	
]

{ #category : #accessing }
DCPlotSettings >> decorations [
	^ decorations ifNil: [ #() ]
]

{ #category : #defaults }
DCPlotSettings >> defaultExtent [
	^ 300 @ 200
]

{ #category : #defaults }
DCPlotSettings >> defaultPadding [
	^ 10 @ 10
]

{ #category : #accessing }
DCPlotSettings >> extent [
	^ self propertyAt: #extent ifAbsent: [ self defaultExtent ]
]

{ #category : #accessing }
DCPlotSettings >> extent: aPoint [
	self propertyAt: #extent put: aPoint
]

{ #category : #accessing }
DCPlotSettings >> padding [
	^ self propertyAt: #padding ifAbsent: [ self defaultPadding ]
]

{ #category : #accessing }
DCPlotSettings >> padding: aPoint [
	self propertyAt: #padding put: aPoint
]

{ #category : #properties }
DCPlotSettings >> properties [
	^ properties ifNil: [ properties := Dictionary new ]
]

{ #category : #properties }
DCPlotSettings >> propertyAt: aString [ 
	^ self propertyAt: aString ifAbsent: [ nil ]
]

{ #category : #properties }
DCPlotSettings >> propertyAt: aString ifAbsent: aFullBlockClosure [ 
	^ self properties at: aString ifAbsent: aFullBlockClosure
]

{ #category : #properties }
DCPlotSettings >> propertyAt: aString put: aPoint [ 
	self properties at: aString put: aPoint
]

{ #category : #accessing }
DCPlotSettings >> title [
	^ self propertyAt: #title
]

{ #category : #accessing }
DCPlotSettings >> title: aString [
	self propertyAt: #title put: aString
]

{ #category : #accessing }
DCPlotSettings >> xlabel [
	^ self propertyAt: #xlabel
]

{ #category : #accessing }
DCPlotSettings >> xlabel: aString [
	self propertyAt: #xlabel put: aString
]

{ #category : #accessing }
DCPlotSettings >> ylabel [
	^ self propertyAt: #ylabel
]

{ #category : #accessing }
DCPlotSettings >> ylabel: aString [
	self propertyAt: #ylabel put: aString
]
