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
DCPlot >> build [
	self kind
		x: self x y: self y.
	self chart
		addPlot: self kind;
		build.
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