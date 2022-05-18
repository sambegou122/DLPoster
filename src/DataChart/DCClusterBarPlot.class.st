Class {
	#name : #DCClusterBarPlot,
	#superclass : #DCCombinePlot,
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCClusterBarPlot >> addPlot: aDCPlot [ 
	aDCPlot class = DCBarPlot 
		ifTrue: [ plots add: aDCPlot ]
		ifFalse:[ self error: ' you must add a DCBarPlot ']
]

{ #category : #adding }
DCClusterBarPlot >> applyBarSizeAndScale [
	self plots doWithIndex: [ :plot :index |
		plot kind barSize: self defaultBarScale rangeBand.
		plot kind barOffset: (self defaultBarScale scale: index)-(self defaultBarSize / 2).]
]

{ #category : #building }
DCClusterBarPlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self applyBarSizeAndScale.
	self plots do: [ :plot| self chart addPlot: plot kind].
	self plots do: [ :plot| plot kind chart: self chart].
	self changeTicks.
	self addDecorations.
	self applyProperties.
	self chart build.
]

{ #category : #adding }
DCClusterBarPlot >> changeTicks [
	| plot |
	plot := self plots at:1.
	self settings xtick
		doNotUseNiceLabel; 
		integer;
		numberOfTicks: plot y size - 1.
					
	self settings ytick
		doNotUseNiceLabel; 
		integer;
		numberOfTicks: plot y size - 1.
]

{ #category : #adding }
DCClusterBarPlot >> defaultBarScale [

	| barScale |
	barScale := NSOrdinalScale new
        domain: (1 to: self numberOfPlots);
        rangeBands: { 0. self defaultBarSize } padding: 0.07.
	^ barScale.
]

{ #category : #adding }
DCClusterBarPlot >> defaultBarSize [

	| scale |
	scale := NSOrdinalScale new
    domain: (1 to: self numberOfPlots);
    rangeBands: { 0. self chart extent x * self numberOfPlots / self plots first y size } padding: 0.1.
	^ scale rangeBand.
]

{ #category : #adding }
DCClusterBarPlot >> numberOfPlots [
	^ self plots size.
]
