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
DCPlotSettings >> background [
	^ self decorationsAt: #background ifAbsent: [ nil ]
]

{ #category : #accessing }
DCPlotSettings >> background: aRSChartDecoration [ 
	self decorationsAt: #background put: aRSChartDecoration.
]

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
	^ decorations ifNil: [ decorations := Dictionary new ]
]

{ #category : #assecing }
DCPlotSettings >> decorationsAt: aString [ 
	^ self decorationsAt: aString ifAbsent: [ nil  ]
]

{ #category : #accessing }
DCPlotSettings >> decorationsAt: aString ifAbsent: aFullBlockClosure [ 
	^ self decorations at: aString ifAbsent: aFullBlockClosure
]

{ #category : #properties }
DCPlotSettings >> decorationsAt: aString put: aPoint [ 
	self decorations at: aString put: aPoint
]

{ #category : #defaults }
DCPlotSettings >> defaultExtent [
	^ 300 @ 200
]

{ #category : #defaults }
DCPlotSettings >> defaultPadding [
	^ 10 @ 10
]

{ #category : #default }
DCPlotSettings >> defaultTitle [
	^ ' Title '
]

{ #category : #default }
DCPlotSettings >> defaultXlabel [
	^ ' xAxis '
]

{ #category : #default }
DCPlotSettings >> defaultYlabel [
	^ ' yAxis '
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
	^ self propertyAt: #title ifAbsent: [ self defaultTitle ]
]

{ #category : #accessing }
DCPlotSettings >> title: aString [
	self propertyAt: #title put: aString
]

{ #category : #accessing }
DCPlotSettings >> xlabel [
	^ self propertyAt: #xlabel ifAbsent: [ self defaultXlabel ]
]

{ #category : #accessing }
DCPlotSettings >> xlabel: aString [
	self propertyAt: #xlabel put: aString
]

{ #category : #accessing }
DCPlotSettings >> xtick [
	^ self decorationsAt: #xtick ifAbsent: [ RSHorizontalTick new ].
]

{ #category : #accessing }
DCPlotSettings >> xtick: aRSVerticalTick [ 
	self decorationsAt: #xtick put: aRSVerticalTick.
]

{ #category : #accessing }
DCPlotSettings >> ylabel [
	^ self propertyAt: #ylabel ifAbsent: [ self defaultYlabel ]
]

{ #category : #accessing }
DCPlotSettings >> ylabel: aString [
	self propertyAt: #ylabel put: aString
]

{ #category : #accessing }
DCPlotSettings >> ytick [
	^ self decorationsAt: #ytick ifAbsent: [ RSVerticalTick new ].
]

{ #category : #accessing }
DCPlotSettings >> ytick: aRSHorizontalTick [ 
	self decorationsAt: #ytick put: aRSHorizontalTick.
]
