Class {
	#name : #DataChartDescription,
	#superclass : #Object,
	#instVars : [
		'kind',
		'dataChart',
		'color',
		'x',
		'y',
		'extent'
	],
	#category : #'DataChart-Description'
}

{ #category : #accessing }
DataChartDescription >> canvas [
	^ dataChart canvas
]

{ #category : #accessing }
DataChartDescription >> color [
	^ color
]

{ #category : #accessing }
DataChartDescription >> color: anObject [
	color := Color colorFrom: anObject.
]

{ #category : #accessing }
DataChartDescription >> dataChart [
	^ dataChart
]

{ #category : #default }
DataChartDescription >> defaultExtent [
	^ 300 @ 200
]

{ #category : #default }
DataChartDescription >> defaultKind [
	^ #line
]

{ #category : #accessing }
DataChartDescription >> extent [
	^ extent
]

{ #category : #accessing }
DataChartDescription >> extent: aPoint [
	extent := aPoint
]

{ #category : #initialization }
DataChartDescription >> initialize [
	super initialize.
	self 
		kind: self defaultKind;
		extent: self defaultExtent
]

{ #category : #accessing }
DataChartDescription >> kind [
	^ kind
]

{ #category : #accessing }
DataChartDescription >> kind: aString [ 
	kind := aString.
	dataChart := DataChart from: kind.
	dataChart extent: self extent.
]

{ #category : #showing }
DataChartDescription >> show [
	self dataChart
		addAll: { self x . self y };
		color: self color;
		extent: self extent.
	^ self dataChart show
		setLabel: 'Data Chart'
		yourself.
	
]

{ #category : #accessing }
DataChartDescription >> x [
	^ x
	
	
]

{ #category : #accessing }
DataChartDescription >> x: aCollection [
	x := aCollection
	
	
]

{ #category : #accessing }
DataChartDescription >> y [
	^ y
]

{ #category : #accessing }
DataChartDescription >> y: aCollection [
	y := aCollection
	
	
]
