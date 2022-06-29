"
This class represent the objet who manage the RSHistogram objet of Roassal-chart
"
Class {
	#name : #DCHistogramPlot,
	#superclass : #DCPlot,
	#instVars : [
		'bins'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCHistogramPlot >> bins [
	^ bins 
]

{ #category : #accessing }
DCHistogramPlot >> bins:aNumber [
	bins := aNumber.
]

{ #category : #default }
DCHistogramPlot >> defaultKind [ 
	^ RSHistogramPlot  new.
]

{ #category : #accessing }
DCHistogramPlot >> initialize [ 
	super initialize.
	bins := OrderedCollection new.
]

{ #category : #building }
DCHistogramPlot >> propagateData [ 
	self kind x: self x.
	self bins isNotNil ifTrue: [  self kind bins: self bins ]  
]

{ #category : #accessing }
DCHistogramPlot >> y: aCollection [
	self error: 'this class do not implemente this methode, just use x: aCollection'
]
