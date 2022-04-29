Class {
	#name : #DataChartDescription,
	#superclass : #Object,
	#instVars : [
		'kind',
		'dataChart',
		'color',
		'x',
		'y',
		'extent',
		'title',
		'padding'
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
DataChartDescription >> defaultPadding [
	^ 10@10.
]

{ #category : #initialization }
DataChartDescription >> defaultTitle [
	| vs dfTitte |
	vs := ' vs '.
	self xtitle 
		ifNil: [dfTitte := self ytitle] 
		ifNotNil: [ dfTitte := self xtitle, vs , self ytitle ].
	
	^ dfTitte.
	
	
		
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
		extent: self defaultExtent;
		padding: self defaultPadding.
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

{ #category : #accessing }
DataChartDescription >> padding [
	^ padding
]

{ #category : #accessing }
DataChartDescription >> padding: aPoint [
	padding := aPoint
]

{ #category : #showing }
DataChartDescription >> show [
	self dataChart
		addAll: { self x . self y };
		color: self color;
		extent: self extent;
		padding: self padding;
		xlabel: self xtitle;
		ylabel: self ytitle;
		title: self title.
	^ self dataChart show
		setLabel: 'Data Chart'
		yourself.
	
]

{ #category : #accessing }
DataChartDescription >> title [
	^ self dataChart title ifNil: [ self defaultTitle ]
]

{ #category : #accessing }
DataChartDescription >> title: aString [
	self dataChart title: aString.
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
DataChartDescription >> xtitle [
	^ self dataChart xlabel.
]

{ #category : #accessing }
DataChartDescription >> xtitle:aString [
	self dataChart xlabel: aString.
]

{ #category : #accessing }
DataChartDescription >> y [
	^ y
]

{ #category : #accessing }
DataChartDescription >> y: aCollection [
	y := aCollection
	
	
]

{ #category : #accessing }
DataChartDescription >> ytitle [
	^ self dataChart ylabel.
]

{ #category : #accessing }
DataChartDescription >> ytitle:aString [
	 self dataChart ylabel: aString.
]
