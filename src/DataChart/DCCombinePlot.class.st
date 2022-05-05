Class {
	#name : #DCCombinePlot,
	#superclass : #DCPlot,
	#instVars : [
		'plots'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCCombinePlot >> build [
	self plots do:[ :plot| plot addAxis].
	self applyProperties.
	self chart build.

	
]

{ #category : #default }
DCCombinePlot >> defaultKind [
	^ {  }
]

{ #category : #default }
DCCombinePlot >> initialize [ 
	super initialize.
	plots := self defaultKind
	
]

{ #category : #accessing }
DCCombinePlot >> plots [
	^ plots
	
]

{ #category : #'adding-plots' }
DCCombinePlot >> withAll: aCollectionOfPlots [
	plots := aCollectionOfPlots.
	self plots do: [ :plot| self chart addPlot: plot kind ].
	self plots do: [ :plot| plot kind chart: self chart ]
]
