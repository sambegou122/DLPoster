"
This class represent the objet who manage the RSHistogram objet of Roassal-chart
"
Class {
	#name : #DCHistogramPlot,
	#superclass : #DCPlot,
	#instVars : [
		'numberOfBins'
	],
	#category : #'DataChart-Core'
}

{ #category : #default }
DCHistogramPlot >> defaultKind [ 
	^ RSHistogramPlot  new.
]

{ #category : #accessing }
DCHistogramPlot >> numberOfBins [
	^ numberOfBins
]

{ #category : #accessing }
DCHistogramPlot >> numberOfBins: anInteger [ 
	numberOfBins := anInteger
]

{ #category : #building }
DCHistogramPlot >> propagateData [ 
	self kind x: self x.
	self bin isNotNil ifTrue: [  self kind bins: self bin ].
]

{ #category : #accessing }
DCHistogramPlot >> y: aCollection [
	self error: 'this class do not implemente this methode, just use x: aCollection'
]
