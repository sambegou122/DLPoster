Class {
	#name : #DCPlot,
	#superclass : #Object,
	#instVars : [
		'settings',
		'x',
		'y',
		'chart',
		'kind'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCPlot >> addDecorations [
	self chart 
			addDecoration: self settings xtick;
			addDecoration:	self settings ytick.
]

{ #category : #building }
DCPlot >> addPropreties: aDictionnaryOfPropreties [
	aDictionnaryOfPropreties keysAndValuesDo: [ :k :v | self settings propertyAt: k put:v ].
]

{ #category : #building }
DCPlot >> applyProperties [
	self chart
		xlabel: self settings xlabel;
		ylabel: self settings ylabel;
		title: self settings title;
		padding: self settings padding;
		extent: self settings extent.
]

{ #category : #building }
DCPlot >> build [
	self kind
		x: self x y: self y.
	self chart
		addPlot: self kind.
	self addDecorations.
	self applyProperties.
	
	"self chart addDecoration: self settings xtick."
	"self chart addDecoration: self settings ytick."
	self chart build.
]

{ #category : #accessing }
DCPlot >> chart [
	^ chart
]

{ #category : #default }
DCPlot >> defaultKind [
	^ self subclassResponsibility
]

{ #category : #initialization }
DCPlot >> initialize [
	super initialize.
	settings := DCPlotSettings new.
	chart := RSChart new.
	kind := self defaultKind.
]

{ #category : #accessing }
DCPlot >> kind [
	^ kind
]

{ #category : #'accessing - shapes' }
DCPlot >> mainShapes [
	^ kind createdShapes
]

{ #category : #accessing }
DCPlot >> settings [
	^ settings
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
