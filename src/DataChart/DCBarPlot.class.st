Class {
	#name : #DCBarPlot,
	#superclass : #DCPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCBarPlot >> applyBarSizeAndScale [
	
		self kind barSize: self computeBarScale rangeBand.
		self kind barOffset: (self computeBarScale scale: 1)-(self computeBarSize / 2)
]

{ #category : #building }
DCBarPlot >> build [
	self addAxis.
	self applyBarSizeAndScale.
	self chart addPlot: self kind.
	self addDecorations.
	self chart build.
]

{ #category : #adding }
DCBarPlot >> changeTicks [ 
	self settings xtick
		doNotUseNiceLabel 
		numberOfTicks: self y size  -1.
	self settings ytick 
		doNotUseNiceLabel
		numberOfTicks: self x size  -1.
]

{ #category : #default }
DCBarPlot >> computeBarScale [

	| barScale |
	barScale := NSOrdinalScale new
        domain: (1 to: 1);
        rangeBands: { 0. self computeBarSize } padding: 0.07.
	^ barScale.
]

{ #category : #default }
DCBarPlot >> computeBarSize [

	| scale |
	scale := NSOrdinalScale new
    domain: (1 to: 1);
    rangeBands: { 0. self chart extent x * 1 / self y size } padding: 0.1.
	^ scale rangeBand.
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
