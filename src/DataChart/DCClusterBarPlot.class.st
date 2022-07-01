"
This class is a kind of Combined plots, but just for clusterBarPlots, so we can just add a BarPlot
"
Class {
	#name : #DCClusterBarPlot,
	#superclass : #DCCombinePlot,
	#instVars : [
		'outerPadding',
		'innerPadding'
	],
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCClusterBarPlot >> addPlot: aDCPlot [ 
	aDCPlot class = DCBarPlot 
		ifTrue: [ plots add: aDCPlot ]
		ifFalse:[ self error: ' you must add a DCBarPlot ']
]

{ #category : #private }
DCClusterBarPlot >> applyBarSizeAndScale [
	| barScale barSize |
	barScale := self computeBarScale.
	barSize := self computeBarSize.
	self plots doWithIndex: [ :plot :index |
		plot kind barSize: barScale rangeBand.
		plot kind barOffset: (barScale scale: index)-(barSize / 2).]
]

{ #category : #building }
DCClusterBarPlot >> buildPlots [
	super buildPlots.
	self applyBarSizeAndScale.
]

{ #category : #building }
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

{ #category : #private }
DCClusterBarPlot >> computeBarScale [

	| barScale |
	barScale := NSOrdinalScale new
        domain: (1 to: self numberOfPlots);
        rangeBands: { 0. self computeBarSize } padding: self innerPadding.
	^ barScale.
]

{ #category : #private }
DCClusterBarPlot >> computeBarSize [

	| scale |
	scale := NSOrdinalScale new
    domain: (1 to: self numberOfPlots);
    rangeBands: { 0. self chart extent x * self numberOfPlots / self plots first y size }
		padding: self outerPadding.
	^ scale rangeBand.
]

{ #category : #private }
DCClusterBarPlot >> innerPadding [
	^ innerPadding ifNil: [ innerPadding := 0.07 ]
]

{ #category : #private }
DCClusterBarPlot >> innerPadding: aNumber [
	"aNumber between 0 and 1"
	innerPadding := aNumber
]

{ #category : #accessing }
DCClusterBarPlot >> outerPadding [
	^ outerPadding ifNil: [ outerPadding := 0.2 ]
]

{ #category : #accessing }
DCClusterBarPlot >> outerPadding: aNumber [
	"aNumber should be between 0 and 1"
	outerPadding := aNumber
]
