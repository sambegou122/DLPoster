"
This class is a kind of Combined plots, but just for StackBarPlots, so we can just add a BarPlot
"
Class {
	#name : #DCStackBarPlot,
	#superclass : #DCCombinePlot,
	#category : #'DataChart-Core'
}

{ #category : #adding }
DCStackBarPlot >> addPlot: aDCPlot [ 
	aDCPlot class = DCBarPlot
	"aDCPlot isBarPlot"
		ifTrue: [ plots add: aDCPlot ]
		ifFalse:[ self error: ' you must add a DCBarPlot ']
]

{ #category : #initialization }
DCStackBarPlot >> applyBottom [
	| size index arrayOfy |
	arrayOfy := #().
	size := self plots size.
	index := 2 to: size.
	index do: [ :i| (self plots at:i) kind bottom: (self sommeAll: self plots to:i-1) ]
]

{ #category : #building }
DCStackBarPlot >> buildPlots [
	super buildPlots.
	self applyBottom.
]

{ #category : #adding }
DCStackBarPlot >> changeTicks [
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

{ #category : #initialization }
DCStackBarPlot >> initialize [ 
	super initialize.
]

{ #category : #accessing }
DCStackBarPlot >> padding: aNumber [
	"aNumber between 0 and 1"
	self plots do: [ :plot | plot kind gapRatio: aNumber ].
]

{ #category : #accessing }
DCStackBarPlot >> sommeAll: aCollectionOfPlot to: index [
	| yAxix size |
	size := aCollectionOfPlot first y size.
	yAxix := Array new: size withAll: 0.
	1 to: index do:[ :i| yAxix := yAxix + (aCollectionOfPlot at: i) y].
	^ yAxix
]
