"
this class represents all types of plot combinations that can be found in a chart.

Instance Variables
	dataType:		<Object> Type of our data
	plots:		<Object> the collection of plots
EXEMPLE:
```Smalltalk
 x := 0.0 to: 2 count: 100.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2.}.
	
	line3 := DCScatterPlot new
		x: x;
		y: (x raisedTo: 4);
		color: Color green;
		yourself.
	combined add: line3.
	^ combined 
		title: 'Combined plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build; 
		show. 
```
"
Class {
	#name : #DCCombinePlot,
	#superclass : #DCPlot,
	#instVars : [
		'plots',
		'dataType'
	],
	#category : #'DataChart-Core'
}

{ #category : #'instance creation' }
DCCombinePlot class >> withAll: aCollection [ 
	^ self new
		addAll: aCollection;
		yourself
]

{ #category : #adding }
DCCombinePlot >> addAll: aCollection [ 
	aCollection do: [ :each | self add: each ]
]

{ #category : #adding }
DCCombinePlot >> addPlot: aDCPlot [ 
	self plots add: aDCPlot.
]

{ #category : #default }
DCCombinePlot >> applyColor [
	self plots do: [ :each| each kind color: each color ]
]

{ #category : #building }
DCCombinePlot >> build [
	self plots ifEmpty: [ self error: 'You should to provide at least one plot' ].
	self plots do:[ :plot| plot addAxis ].
	self applyColor.
	self plots do: [ :plot| self chart addPlot: plot kind].
	self addDecorations.
	self chart build.
	"self halt."
	"self computeLegend."

	
]

{ #category : #adding }
DCCombinePlot >> computeLegend [
	self legend container: self chart canvas.
	self plots do:[:plot | self legend text: plot computeName  withBoxColor: plot kind computeColor].
	self legend legendDo: [ :shape | shape withBorder; padding: 10; scaleBy: 0.5 ].
	self legend location middle; right; offset: 10.
	self legend build.
	
]

{ #category : #adding }
DCCombinePlot >> dataType [
	 ^ dataType
]

{ #category : #adding }
DCCombinePlot >> dataType: integerOrFloat [
	dataType := integerOrFloat
	
]

{ #category : #default }
DCCombinePlot >> defaultKind [
	^ nil
]

{ #category : #default }
DCCombinePlot >> generateDataType [

	| num |
	num := self plots first y first.
	dataType := num className = 0.0 className
		            ifTrue: [ 'float' ]
		            ifFalse: [ 'integer' ].
	^ dataType
]

{ #category : #initialization }
DCCombinePlot >> initialize [ 
	super initialize.
	plots := OrderedCollection new.
]

{ #category : #accessing }
DCCombinePlot >> plots [
	^ plots
	
]

{ #category : #'adding-plots' }
DCCombinePlot >> withAll: aCollectionOfPlots [
	"plots := aCollectionOfPlots.
	
	self plots do: [ :plot| self chart addPlot: plot kind ].
	self plots do: [ :plot| plot kind chart: self chart ]:"
	aCollectionOfPlots do: [ :each | self add: each ].
	
]
