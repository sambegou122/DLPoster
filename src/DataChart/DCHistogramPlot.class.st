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
DCHistogramPlot >> bins: aColloection [
	bins := aColloection.
]

{ #category : #default }
DCHistogramPlot >> defaultKind [ 
	^ RSHistogramPlot  new.
]

{ #category : #initialization }
DCHistogramPlot >> initialize [
	super initialize.
	bins := #().
]

{ #category : #building }
DCHistogramPlot >> propagateBins [
	| canvas |
	canvas := self chart canvas.
		self bins ifNotEmpty: [ : b| |plot|
		plot := self.
		plot propagateData.
		plot addDecorations.
		plot bin: b.
		canvas add: plot.
	]
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
