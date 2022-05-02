Class {
	#name : #CombinedPlot,
	#superclass : #Object,
	#instVars : [
		'chart'
	],
	#classInstVars : [
		'chart'
	],
	#category : #'DataChart-Plots'
}

{ #category : #initialization }
CombinedPlot >> chart [
	^ chart.
]

{ #category : #initialization }
CombinedPlot >> initialize [ 
	super initialize.
	chart := RSChart new.
]

{ #category : #accessing }
CombinedPlot >> show [
	
	^ self chart open
]

{ #category : #accessing }
CombinedPlot >> title: aString [ 
	self chart title: aString.
]

{ #category : #accessing }
CombinedPlot >> withAll: aCollectionOfPlots [

	aCollectionOfPlots do:[ : each | self chart addPlot: each plot].
]

{ #category : #accessing }
CombinedPlot >> xtitle: aString [ 
	self chart xlabel: aString.
]

{ #category : #accessing }
CombinedPlot >> ytitle: aString [ 
	self chart ylabel: aString.
]
