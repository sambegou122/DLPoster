Class {
	#name : #DCCombinePlot,
	#superclass : #DCPlot,
	#instVars : [
		'plots'
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

{ #category : #building }
DCCombinePlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self plots do: [ :plot| self chart addPlot: plot kind].
	self plots do: [  :plot| plot kind chart: self chart].
	self addDecorations.
	self applyProperties.
	self chart build.

	
]

{ #category : #default }
DCCombinePlot >> defaultKind [
	^ nil
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
