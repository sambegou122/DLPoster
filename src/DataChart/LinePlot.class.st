Class {
	#name : #LinePlot,
	#superclass : #DataFrameChartDescription,
	#category : #'DataChart-Plots'
}

{ #category : #initialization }
LinePlot >> initialize [ 
	super initialize.
	self kind: #line.
]

{ #category : #accessing }
LinePlot >> line [
	^ (self canvas shapes select: [ :shape | shape class = RSPolyline ]) first
]
