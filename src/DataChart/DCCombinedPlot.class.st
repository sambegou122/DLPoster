Class {
	#name : #DCCombinedPlot,
	#superclass : #DCPlot,
	#classInstVars : [
		'chart'
	],
	#category : #'DataChart-Core'
}

{ #category : #initialization }
DCCombinedPlot >> chart [
	^ chart.
]

{ #category : #initialization }
DCCombinedPlot >> initialize [ 
	super initialize.
	chart := RSChart new.
]

{ #category : #accessing }
DCCombinedPlot >> show [
	
	^ self chart open
]

{ #category : #accessing }
DCCombinedPlot >> title: aString [ 
	self chart title: aString.
]

{ #category : #accessing }
DCCombinedPlot >> withAll: aCollectionOfPlots [

	aCollectionOfPlots do:[ : each | self chart addPlot: each plot].
]

{ #category : #accessing }
DCCombinedPlot >> xtitle: aString [ 
	self chart xlabel: aString.
]

{ #category : #accessing }
DCCombinedPlot >> ytitle: aString [ 
	self chart ylabel: aString.
]
