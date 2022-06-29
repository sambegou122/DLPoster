"
This class represent the objet who manage the RSHistogram objet of Roassal-chart
"
Class {
	#name : #DCHistogramPlot,
	#superclass : #DCPlot,
	#instVars : [
		'bins',
		'bin'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCHistogramPlot >> bin [
	^ bin
]

{ #category : #accessing }
DCHistogramPlot >> bin:aNumber [
	bin := aNumber.
]

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
	self bin isNotNil ifTrue: [  self kind bins: self bin ]  
]

{ #category : #accessing }
DCHistogramPlot >> y: aCollection [
	self error: 'this class do not implemente this methode, just use x: aCollection'
]
