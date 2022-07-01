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

{ #category : #accessing }
DCHistogramPlot >> binSize: anInteger [ 
	self kind binSize: anInteger
]

{ #category : #accessing }
DCHistogramPlot >> bins [
	^ self kind bins
]

{ #category : #accessing }
DCHistogramPlot >> bins: aColloection [
	self kind bins: aColloection
]

{ #category : #default }
DCHistogramPlot >> defaultKind [ 
	^ RSHistogramPlot  new.
]

{ #category : #accessing }
DCHistogramPlot >> numberOfBins [
	^ self kind numberOfBins
]

{ #category : #accessing }
DCHistogramPlot >> numberOfBins: aNumber [
	self kind numberOfBins: aNumber
]

{ #category : #building }
DCHistogramPlot >> propagateData [
	
]

{ #category : #accessing }
DCHistogramPlot >> x: aCollection [
	super x: aCollection.
	self kind x: aCollection
]

{ #category : #accessing }
DCHistogramPlot >> y: aCollection [
	self error: 'this class do not implemente this methode, just use x: aCollection'
]
