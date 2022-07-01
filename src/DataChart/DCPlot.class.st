"
this class is object representing in our case here a Plot in general
The goal is to be able to refactor the Roassal Chart library

 
Internal Representation and Key Implementation Points.

    Instance Variables
	chart:		<Object> represent a chart
	kind:		<Object> represent a kind of plot ( RSLine, RSBox, RSHistogramm etc...)
	settings:		<Object> class represent all the settings of our class
	x:		<Object> X axix data
	y:		<Object>y axix data

"
Class {
	#name : #DCPlot,
	#superclass : #Object,
	#instVars : [
		'settings',
		'x',
		'y',
		'chart',
		'kind',
		'legend',
		'name'
	],
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCPlot >> add: aDCObject [
	"can be a plot or decoration"
	aDCObject addIn: self
]

{ #category : #adding }
DCPlot >> addDecoration: aDCDecoration [
	self settings addDecoration: aDCDecoration
]

{ #category : #building }
DCPlot >> addDecorations [
	self chart decorations removeAll.
	self chart
		spineDecoration: self settings background;
		addDecoration: self settings xtick;
		addDecoration:	self settings ytick;
		extent: self settings extent.
	self settings decorations do: [ :decoration | 
		self chart addDecoration: decoration ].
	self changeTicks.
	self applyProperties.
]

{ #category : #adding }
DCPlot >> addIn: aDCCombinePlot [ 
	aDCCombinePlot addPlot: self
]

{ #category : #building }
DCPlot >> applyProperties [
	self chart
		xlabel: self settings xlabel;
		ylabel: self settings ylabel;
		title: self settings title;
		padding: self settings padding.
	self settings color ifNotNil: [ self kind color: self settings color ]
]

{ #category : #building }
DCPlot >> build [
	self propagateData.
	self chart addPlot: self kind.
	self addDecorations.
	self chart build.
	self buildLegendIfNecessary.
]

{ #category : #building }
DCPlot >> buildLegend [
	self buildLegendData.
	self legend container: self chart canvas.
	self legend build
]

{ #category : #building }
DCPlot >> buildLegendData [
	self legend text: self computeName withBoxColor: self kind computeColor.
]

{ #category : #building }
DCPlot >> buildLegendIfNecessary [
	self settings shouldUseLegend ifFalse: [ ^ self ].
	self buildLegend.
]

{ #category : #building }
DCPlot >> changeTicks [ 
	self settings xtick
		doNotUseNiceLabel
		numberOfTicks: (self generateNumberOfTicks at:'x') -1.
	self settings ytick 
		numberOfTicks: (self generateNumberOfTicks at:'y' ) -1.
]

{ #category : #accessing }
DCPlot >> chart [
	^ chart
]

{ #category : #accessing }
DCPlot >> color [
	^ self settings color.
]

{ #category : #accessing }
DCPlot >> color: aColor [
	self settings color: aColor.
]

{ #category : #accessing }
DCPlot >> computeName [
	^ name ifNil: [ 'serie' ] ifNotNil:[ name ]
]

{ #category : #default }
DCPlot >> defaultKind [
	^ self subclassResponsibility
]

{ #category : #accessing }
DCPlot >> extent: aPoint [
	self settings extent: aPoint
]

{ #category : #building }
DCPlot >> generateNumberOfTicks [
	| xExtends yExtends result |
	xExtends := self chart extent x.
	yExtends := self chart extent y.
	result := Dictionary new.
	self putValue: xExtends in: result at: 'x'.
	self putValue: yExtends in: result  at: 'y'.
	^ result
]

{ #category : #initialization }
DCPlot >> initialize [
	super initialize.
	settings := DCPlotSettings new.
	chart := RSChart new.
	kind := self defaultKind.
	legend := DCLegend new.
]

{ #category : #inspector }
DCPlot >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'Canvas'>
	self build. 
	^ SpRoassal3InspectorPresenter new
		canvas: self chart canvas;
		yourself
]

{ #category : #inspector }
DCPlot >> inspectorCanvasContext: aContext [
	aContext withoutEvaluator
]

{ #category : #accessing }
DCPlot >> kind [
	^ kind
]

{ #category : #accessing }
DCPlot >> legend [
	^ legend
]

{ #category : #legend }
DCPlot >> legendDo: aBlock [
	self settings withLegend.
	aBlock value: self legend
]

{ #category : #'accessing - shapes' }
DCPlot >> mainShapes [
	^ kind createdShapes
]

{ #category : #accessing }
DCPlot >> name [
	^name
]

{ #category : #accessing }
DCPlot >> name: aString [
	name:= aString
]

{ #category : #building }
DCPlot >> propagateData [
	self kind x: self x y: self y
]

{ #category : #accessing }
DCPlot >> putValue: aValue in: aDictionary at: aString [
	
	aValue <= 200 ifTrue: [ aDictionary at:aString put: 5 ].
	(aValue > 200 and: [ aValue < 600 ] )ifTrue: [ aDictionary at:aString put: 10 ].
	aValue>= 600 ifTrue: [ aDictionary at:aString put: 15 ].

]

{ #category : #accessing }
DCPlot >> settings [
	^ settings
]

{ #category : #accessing }
DCPlot >> settings: aDCPlotSettings [ 
	settings := aDCPlotSettings
]

{ #category : #building }
DCPlot >> show [
	self build.
	^ self chart canvas open.
]

{ #category : #accessing }
DCPlot >> title: aString [
	self settings title: aString.
]

{ #category : #building }
DCPlot >> withLegend [
	self legendDo: [ :aRSLegend | aRSLegend location middle; right; offset: 10 ].
	
]

{ #category : #accessing }
DCPlot >> x [
	^ x
]

{ #category : #accessing }
DCPlot >> x: aCollection [ 
	x := aCollection
]

{ #category : #accessing }
DCPlot >> xlabel: aString [
	self settings xlabel: aString.
]

{ #category : #accessing }
DCPlot >> y [
	^ y
]

{ #category : #accessing }
DCPlot >> y: aCollection [ 
	y := aCollection
]

{ #category : #accessing }
DCPlot >> ylabel: aString [
	self settings ylabel: aString.
]
