Class {
	#name : #DataChart,
	#superclass : #Object,
	#instVars : [
		'data',
		'chart',
		'color',
		'dataSet',
		'decoration'
	],
	#category : #'Data-Chart-Kind'
}

{ #category : #'instance creation' }
DataChart class >> from: aString [ 
	self withAllSubclassesDo: [ :cls |
		cls kind = aString ifTrue: [ ^ cls new ]
		 ].
	^ nil
]

{ #category : #accessing }
DataChart class >> kind [
	^ ''
]

{ #category : #initialization }
DataChart >> addAll: aCollection [

	self addInDataSet: aCollection.
	self dataSet do: [ :each | self addData: each ].
	
]

{ #category : #'adding-plots' }
DataChart >> addData: aDictionnary [

	| x y |
	self data: aDictionnary.
	y := self data at: 2 ifAbsent: [ self data at: 1 ].
	x := self data at: 1.
	x = y
		ifTrue: [ self chart addPlot: (self yourPlot y: x) ]
		ifFalse: [ self chart addPlot: (self yourPlot x: x y: y) ].
]

{ #category : #initialization }
DataChart >> addInDataSet: aCollection [
	| size |
	size := aCollection size.
	size odd ifTrue: [ |last | last := aCollection at:size.
							self cutTwoByTwo: aCollection with:(size -1). 
								self dataSet add: ({ 1->last} asDictionary)] 
				ifFalse: [ self cutTwoByTwo: aCollection ]
]

{ #category : #accessing }
DataChart >> canvas [
	^ self chart canvas
]

{ #category : #'accessing - attributes' }
DataChart >> chart [ 
	^ chart
]

{ #category : #'accessing - attributes' }
DataChart >> chart: aChart [
	chart := aChart
	
]

{ #category : #initialization }
DataChart >> cutTwoByTwo:aCollection [
	self cutTwoByTwo: aCollection  with: aCollection size
]

{ #category : #initialization }
DataChart >> cutTwoByTwo:aCollection with:size [
	1 to: size by: 2 do: [ :index| | x y |
		x := aCollection at:index. 
		y:= aCollection at:index+1.
		self dataSet add: ({ 1->x. 2->y} asDictionary) ].
]

{ #category : #'accessing - data' }
DataChart >> data [
	^ data
]

{ #category : #'accessing - data' }
DataChart >> data: aData [
	data := aData
]

{ #category : #initialization }
DataChart >> dataSet [
 ^ dataSet
]

{ #category : #initialization }
DataChart >> initialize [ 
	super initialize.
	self chart: RSChart new.
	dataSet := OrderedCollection new.
]

{ #category : #showing }
DataChart >> show [

	^ self chart open
]

{ #category : #showing }
DataChart >> yourPlot [ 
	self subclassResponsibility
]
