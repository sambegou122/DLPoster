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

{ #category : #building }
DCPlot >> addAxis [
	self kind x: self x y: self y
]

{ #category : #adding }
DCPlot >> addDecoration: aDCDecoration [
	self settings addDecoration: aDCDecoration
]

{ #category : #building }
DCPlot >> addDecorations [
	self chart decorations removeAll.
	self chart
		addDecoration: self settings background;
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
	self addAxis.
	self chart
		addPlot: self kind.
	self addDecorations.
	self chart build.
	self computeLegend.
	self manageLabelDecoration.
]

{ #category : #adding }
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

{ #category : #adding }
DCPlot >> computeLegend [
	self legend container: self chart canvas.
	self legend text: self computeName withBoxColor: self kind computeColor.
	self legend location middle; right; offset: 10.
	self legend build
]

{ #category : #accessing }
DCPlot >> computeName [
	^ name ifNil: [ self className ] ifNotNil:[ name ]
]

{ #category : #default }
DCPlot >> defaultKind [
	^ self subclassResponsibility
]

{ #category : #accessing }
DCPlot >> extent: aPoint [
	self settings extent: aPoint
]

{ #category : #adding }
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
	legend := RSLegend new.
]

{ #category : #inspector }
DCPlot >> inspectorCanvas [
	<inspectorPresentationOrder: 90 title: 'Canvas'>
	self build. 
	^ SpRoassal3InspectorPresenter new
		canvas: self chart canvas;
		yourself
]

{ #category : #accessing }
DCPlot >> kind [
	^ kind
]

{ #category : #adding }
DCPlot >> legend [
	^legend
]

{ #category : #'accessing - shapes' }
DCPlot >> mainShapes [
	^ kind createdShapes
]

{ #category : #accessing }
DCPlot >> manageLabelDecoration [
	| labels |
	labels := self settings decorations select:[:deco| deco class = DCLabelDecoration].
	labels ifNotEmpty: [ :label| label do:[:l| l changeYourPosition: self] ].
	
	
]

{ #category : #accessing }
DCPlot >> name [
	^name
]

{ #category : #accessing }
DCPlot >> name: aString [
	name:= aString
]

{ #category : #accessing }
DCPlot >> putValue: aValue in: aDictionnary [
	
	aValue <= 200 ifTrue: [ aDictionnary at:'x' put:5. ].
	(aValue > 200 and: [ aValue < 600 ] )ifTrue: [ aDictionnary at:'x' put: 10 ].
	aValue>= 600 ifTrue: [ aDictionnary at:'x' put: 15 ].

]

{ #category : #accessing }
DCPlot >> putValue: aValue in: aDictionnary at: aString [
	
	aValue <= 200 ifTrue: [ aDictionnary at:aString put:5. ].
	(aValue > 200 and: [ aValue < 600 ] )ifTrue: [ aDictionnary at:aString put: 10 ].
	aValue>= 600 ifTrue: [ aDictionnary at:aString put: 15 ].

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
	^ self chart canvas open.
]

{ #category : #accessing }
DCPlot >> title: aString [
	self settings title: aString.
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
