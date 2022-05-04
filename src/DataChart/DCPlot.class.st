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

{ #category : #accessing }
DCPlot >> addPropreties: aDictionnaryOfPropreties [
	settings := 	DCPlotSettings new.
	aDictionnaryOfPropreties keysAndValuesDo: [ :k :v | self settings propertyAt: k put:v ].
]

{ #category : #building }
DCPlot >> applyPropreties [
	self chart xlabel: (self settings propertyAt: #xlabel);
				ylabel: (self settings propertyAt: #ylabel);
				title: (self settings propertyAt: #title);
				padding: (self settings propertyAt: #padding);
				extent:  (self settings propertyAt: #extent)
				yourself.
]

{ #category : #building }
DCPlot >> build [
	self kind
		x: self x y: self y.
	self chart
		addPlot: self kind.
	self applyPropreties.
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
DCPlot >> x [
	^ x
]

{ #category : #accessing }
DCPlot >> x: aCollection [ 
	x := aCollection
]

{ #category : #accessing }
DCPlot >> y [
	^ y
]

{ #category : #accessing }
DCPlot >> y: aCollection [ 
	y := aCollection
]
