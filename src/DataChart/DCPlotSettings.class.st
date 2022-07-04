"
This class represent the settings of our DCPlot object
we have separated the two to better manage the parameters independently of the object
For more Details refere you to the test class
"
Class {
	#name : #DCPlotSettings,
	#superclass : #Object,
	#instVars : [
		'properties',
		'decorations'
	],
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCPlotSettings >> addDecoration: aDCDecoration [ 
	self decorations add: aDCDecoration
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> background [
	^ self propertyAt: #background ifAbsentPut: [ RSChartSpineDecoration new ]
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> background: aRSChartDecoration [ 
	self propertyAt: #background put: aRSChartDecoration
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
	^ decorations ifNil: [ decorations := OrderedCollection new ]
]

{ #category : #defaults }
DCPlotSettings >> defaultExtent [
	^ 300 @ 200
]

{ #category : #defaults }
DCPlotSettings >> defaultPadding [
	^ 10 @ 10
]

{ #category : #defaults }
DCPlotSettings >> defaultTitle [
	^ ' Title '
]

{ #category : #defaults }
DCPlotSettings >> defaultXlabel [
	^ ' xAxis '
]

{ #category : #defaults }
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

{ #category : #public }
DCPlotSettings >> noLegend [
	self propertyAt: #shouldUseLegend put: false
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
DCPlotSettings >> propertyAt: aString ifAbsentPut: aFullBlockClosure [ 
	^ self properties at: aString ifAbsentPut: aFullBlockClosure
]

{ #category : #properties }
DCPlotSettings >> propertyAt: aString put: aPoint [ 
	self properties at: aString put: aPoint
]

{ #category : #testing }
DCPlotSettings >> shouldUseLegend [
	^ self propertyAt: #shouldUseLegend ifAbsent: [ false ]
]

{ #category : #accessing }
DCPlotSettings >> title [
	^ self propertyAt: #title ifAbsent: [ self defaultTitle ]
]

{ #category : #accessing }
DCPlotSettings >> title: aString [
	self propertyAt: #title put: aString
]

{ #category : #public }
DCPlotSettings >> withLegend [
	self propertyAt: #shouldUseLegend put: true
]

{ #category : #accessing }
DCPlotSettings >> xlabel [
	^ self propertyAt: #xlabel ifAbsent: [ self defaultXlabel ]
]

{ #category : #accessing }
DCPlotSettings >> xlabel: aString [
	self propertyAt: #xlabel put: aString
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> xtick [
	^ self propertyAt: #xtick ifAbsentPut: [ RSHorizontalTick new ]
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> xtick: aRSVerticalTick [ 
	self propertyAt: #xtick put: aRSVerticalTick
]

{ #category : #accessing }
DCPlotSettings >> ylabel [
	^ self propertyAt: #ylabel ifAbsent: [ self defaultYlabel ]
]

{ #category : #accessing }
DCPlotSettings >> ylabel: aString [
	self propertyAt: #ylabel put: aString
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> ytick [
	^ self propertyAt: #ytick ifAbsentPut: [ RSVerticalTick new ]
]

{ #category : #'accessing - decorators' }
DCPlotSettings >> ytick: aRSHorizontalTick [ 
	self propertyAt: #ytick put: aRSHorizontalTick
]
