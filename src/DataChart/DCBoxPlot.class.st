Class {
	#name : #DCBoxPlot,
	#superclass : #DCChartPlot,
	#category : #'DataChart-Core'
}

{ #category : #building }
DCBoxPlot >> changeTicks [ 
	self settings xtick
		numberOfTicks: self y size.
	self settings ytick 
		numberOfTicks: (self generateNumberOfTicks at:'y' ) -1.
]

{ #category : #default }
DCBoxPlot >> defaultKind [
	^ RSBoxPlot new.
]

{ #category : #accessing }
DCBoxPlot >> y: aCollection [
	self x ifNil: [ self x: (1 to: aCollection size) ].
	super y: aCollection
]
