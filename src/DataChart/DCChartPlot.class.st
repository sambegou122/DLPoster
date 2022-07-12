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
	#name : #DCChartPlot,
	#superclass : #DCPlot,
	#instVars : [
		'x',
		'y',
		'chart'
	],
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCChartPlot >> add: aDCObject [
	"can be a plot or decoration"
	aDCObject addIn: self
]

{ #category : #adding }
DCChartPlot >> addDecoration: aDCDecoration [
	"adding decoration in plot"
	self settings addDecoration: aDCDecoration
]

{ #category : #building }
DCChartPlot >> addDecorations [
	"adding all the decoration to the chart"
	
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
DCChartPlot >> addIn: aDCCombinePlot [ 
	aDCCombinePlot addPlot: self
]

{ #category : #building }
DCChartPlot >> applyProperties [
	self chart
		xlabel: self settings xlabel;
		ylabel: self settings ylabel;
		title: self settings title;
		padding: self settings padding.
	self settings color ifNotNil: [ self kind color: self settings color ]
]

{ #category : #building }
DCChartPlot >> build [
	self propagateData.
	self chart addPlot: self kind.
	self addDecorations.
	self chart build.
	self buildLegendIfNecessary.
]

{ #category : #building }
DCChartPlot >> buildLegend [
	self buildLegendData.
	self legend container: self chart canvas.
	self legend build
]

{ #category : #building }
DCChartPlot >> buildLegendData [
	self legend text: self computeName withBoxColor: self kind computeColor.
]

{ #category : #building }
DCChartPlot >> buildLegendIfNecessary [
	" build legend if user put it"
	self settings shouldUseLegend ifFalse: [ ^ self ].
	self buildLegend.
]

{ #category : #building }
DCChartPlot >> changeTicks [ 
	"this method generates the correct number of ticks of  each plot"
	self settings xtick
		doNotUseNiceLabel
		numberOfTicks: (self generateNumberOfTicks at:'x') -1.
	self settings ytick 
		numberOfTicks: (self generateNumberOfTicks at:'y' ) -1.
]

{ #category : #accessing }
DCChartPlot >> chart [
	^ chart
]

{ #category : #default }
DCChartPlot >> defaultKind [
	^ self subclassResponsibility
]

{ #category : #accessing }
DCChartPlot >> extent: aPoint [
	self settings extent: aPoint
]

{ #category : #building }
DCChartPlot >> generateNumberOfTicks [
	"this methode allow to generate the number of ticks"
	| xExtends yExtends result |
	xExtends := self chart extent x.
	yExtends := self chart extent y.
	result := Dictionary new.
	self putValue: xExtends in: result at: 'x'.
	self putValue: yExtends in: result  at: 'y'.
	^ result
]

{ #category : #initialization }
DCChartPlot >> initialize [
	super initialize.
	chart := RSChart new.

	
]

{ #category : #inspector }
DCChartPlot >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'Canvas'>
	self build. 
	^ SpRoassal3InspectorPresenter new
		canvas: self chart canvas;
		yourself
]

{ #category : #inspector }
DCChartPlot >> inspectorCanvasContext: aContext [
	aContext withoutEvaluator
]

{ #category : #'accessing - shapes' }
DCChartPlot >> mainShapes [
	^ kind createdShapes
]

{ #category : #building }
DCChartPlot >> propagateData [
	"this methode put a data in the plot"
	
	self kind x: self x y: self y
]

{ #category : #accessing }
DCChartPlot >> putValue: aValue in: aDictionary at: aString [
	
	aValue <= 200 ifTrue: [ aDictionary at:aString put: 5 ].
	(aValue > 200 and: [ aValue < 600 ] )ifTrue: [ aDictionary at:aString put: 10 ].
	aValue>= 600 ifTrue: [ aDictionary at:aString put: 15 ].

]

{ #category : #showing }
DCChartPlot >> show [
	self build.
	^ self chart canvas open.
]

{ #category : #building }
DCChartPlot >> withLegend [
	self legendDo: [ :aRSLegend | aRSLegend location middle; right; offset: 10 ].
	
]

{ #category : #accessing }
DCChartPlot >> x [
	^ x
]

{ #category : #accessing }
DCChartPlot >> x: aCollection [ 
	x := aCollection
]

{ #category : #accessing }
DCChartPlot >> xlabel: aString [
	self settings xlabel: aString.
]

{ #category : #accessing }
DCChartPlot >> y [
	^ y
]

{ #category : #accessing }
DCChartPlot >> y: aCollection [ 
	y := aCollection
]

{ #category : #accessing }
DCChartPlot >> ylabel: aString [
	self settings ylabel: aString.
]
