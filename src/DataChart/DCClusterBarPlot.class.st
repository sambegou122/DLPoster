"
This class is a kind of Combined plots, but just for clusterBarPlots, so we can just add a BarPlot
"
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
		plot kind barSize: self computeBarScale rangeBand.
		plot kind barOffset: (self computeBarScale scale: index)-(self computeBarSize / 2).]
]

{ #category : #building }
DCClusterBarPlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self applyBarSizeAndScale.
	self plots do: [ :plot| self chart addPlot: plot kind].
	self plots do: [ :plot| plot kind chart: self chart].
	self addDecorations.
	self chart build.
]

{ #category : #adding }
DCClusterBarPlot >> changeTicks [
	| plot |
	plot := self plots at:1.
	self settings xtick
		doNotUseNiceLabel; 
		numberOfTicks: plot y size - 1.
	self dataType = 'integer' 
		ifTrue: [ self settings xtick labelConversion: [ :val | val asInteger ] ]. 
					
	self settings ytick
		numberOfTicks: plot y size - 1.
		
	self dataType = 'integer' 
		ifTrue: [ self settings ytick labelConversion: [ :val | val asInteger ] ]. 
]

{ #category : #adding }
DCClusterBarPlot >> computeBarScale [

	| barScale |
	barScale := NSOrdinalScale new
        domain: (1 to: self numberOfPlots);
        rangeBands: { 0. self computeBarSize } padding: 0.07.
	^ barScale.
]

{ #category : #adding }
DCClusterBarPlot >> computeBarSize [

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
