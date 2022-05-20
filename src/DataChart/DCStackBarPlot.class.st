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
DCStackBarPlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self applyBottom.
	self plots do: [ :plot| self chart addPlot: plot kind].
	self plots do: [  :plot| plot kind chart: self chart].
	self addDecorations.
	self chart build.

]

{ #category : #building }
DCStackBarPlot >> changeTicks [
	| plot |
	plot := self plots at:1.
	self settings xtick
		doNotUseNiceLabel; 
		numberOfTicks: plot y size - 1.
	self dataType = 'integer' 
		ifTrue: [ self settings xtick labelConversion: [ :val | val asInteger ] ]. 
					
	self settings ytick
		doNotUseNiceLabel; 
		numberOfTicks: plot y size - 1.
		
	self dataType = 'integer' 
		ifTrue: [ self settings ytick labelConversion: [ :val | val asInteger ] ]. 
]

{ #category : #initialization }
DCStackBarPlot >> initialize [ 
	super initialize.
]

{ #category : #accessing }
DCStackBarPlot >> sommeAll: aCollectionOfPlot to: index [
	| yAxix indexCollection size clsz |
	size := (aCollectionOfPlot at:1) y size.
	yAxix := Array new: size.
	clsz := (1 to: size).
	clsz do: [ :i| yAxix at:i put: 0].
	indexCollection := 1 to: index.
	indexCollection do:[ :i| yAxix := yAxix + (aCollectionOfPlot at:i) y].
	^ yAxix
]
