Class {
	#name : #DCBarPlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCBarPlot >> applyBarSizeAndScale [
	"
	self kind
		barSize: self computeBarScale rangeBand;
		barOffset: (self computeBarScale scale: 1)-(self computeBarSize / 2)"
]

{ #category : #adding }
DCBarPlot >> changeTicks [ 
	self settings xtick
		doNotUseNiceLabel
		numberOfTicks: self y size  -1.
	self settings ytick
		numberOfTicks: self x size  -1.
]

{ #category : #default }
DCBarPlot >> defaultKind [
	^ RSBarPlot new.
]

{ #category : #accessing }
DCBarPlot >> y: aCollection [
	
	self x ifNil: [ self x: (1 to: aCollection size) ].
	super y: aCollection
	
]
