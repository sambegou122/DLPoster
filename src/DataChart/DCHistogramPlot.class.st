Class {
	#name : #DCHistogramPlot,
	#superclass : #DCPlot,
	#instVars : [
		'bins'
	],
	#category : #'DataChart-Core'
}

{ #category : #building }
DCHistogramPlot >> addAxis [ 
	self kind x: self x.
	self bins isNotEmpty ifTrue: [  self kind bins: self bins ]  
]

{ #category : #building }
DCHistogramPlot >> bins [
	^ bins 
]

{ #category : #accessing }
DCHistogramPlot >> bins: aCollection [
	bins := aCollection.
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

{ #category : #accessing }
DCHistogramPlot >> y: aCollection [
	self error: ' this class do not implemente this methode, just use x: aCollection'
]
