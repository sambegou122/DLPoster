Class {
	#name : #DCCombinePlot,
	#superclass : #DCPlot,
	#instVars : [
		'plots',
		'dataType'
	],
	#category : #'DataChart-Core'
}

{ #category : #'instance creation' }
DCCombinePlot class >> withAll: aCollection [ 
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #adding }
DCCombinePlot >> addAll: aCollection [ 
	aCollection do: [ :each | self add: each ]
]

{ #category : #adding }
DCCombinePlot >> addPlot: aDCPlot [ 
	self plots add: aDCPlot.
]

{ #category : #default }
DCCombinePlot >> applyColor [
	self plots do: [ :each| each kind color: each color ]
]

{ #category : #building }
DCCombinePlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self applyColor.
	self plots do: [ :plot| self chart addPlot: plot kind].
	self addDecorations.
	self chart build.

	
]

{ #category : #adding }
DCCombinePlot >> dataType [
	dataType ifNil: [ dataType := self generateDataType ].
	 ^ dataType
]

{ #category : #adding }
DCCombinePlot >> dataType: integerOrFloat [
	dataType := integerOrFloat
	
]

{ #category : #default }
DCCombinePlot >> defaultKind [
	^ nil
]

{ #category : #default }
DCCombinePlot >> generateDataType [
	
	| num |
	num := self plots first x first.
	num class = 0.0 class
		ifTrue: [  dataType := 'float' ]
		ifFalse: [ dataType := 'integer' ].
	^dataType.
]

{ #category : #initialization }
DCCombinePlot >> initialize [ 
	super initialize.
	plots := OrderedCollection new.
]

{ #category : #accessing }
DCCombinePlot >> plots [
	^ plots
	
]

{ #category : #'adding-plots' }
DCCombinePlot >> withAll: aCollectionOfPlots [
	"plots := aCollectionOfPlots.
	
	self plots do: [ :plot| self chart addPlot: plot kind ].
	self plots do: [ :plot| plot kind chart: self chart ]:"
	aCollectionOfPlots do: [ :each | self add: each ].
	
]
