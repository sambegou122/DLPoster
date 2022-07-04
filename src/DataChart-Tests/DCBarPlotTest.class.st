"
A DCBarPlotTest is a test class for testing the behavior of DCBarPlot
"
Class {
	#name : #DCBarPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'x',
		'y'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCBarPlotTest >> setUp [
	super setUp.
	
	plot := DCBarPlot new.
	x := 0 to: 100.
	y := (x raisedTo: 3).
]

{ #category : #tests }
DCBarPlotTest >> testAddAxis [ 
	
	plot y: y.
	
	self assert: plot x size equals: y size.
	self assert: plot y equals: y.
	 
]

{ #category : #tests }
DCBarPlotTest >> testBasic [ 
	
	self assert: plot settings class equals: DCPlotSettings.
	self assert: plot x isNil.
	self assert: plot y isNil.
	self assert: plot chart class equals: RSChart.
	self assert: plot kind class equals: RSBarPlot.
]

{ #category : #tests }
DCBarPlotTest >> testBasicY [
	| bars ticks |
	plot := DCBarPlot new
		y: (1 to: 10);
		build;
		yourself.
	bars := plot kind bars.
	ticks := plot settings xtick ticks.
	self assert: bars size equals: ticks size.
	bars with: ticks do: [ :bar :tick | 
		self assert: tick position x closeTo: bar position x.
		 ].
	
]

{ #category : #tests }
DCBarPlotTest >> testCustomX [
	self should: [ DCBarPlot new
		x: #(1.33 1.35 0.93 1.08 1.28 1 1.5 1.93 8 2.8);
		y: (1 to: 10);
		build ] raise: Error.
	plot 
		x: #(1.33 1.35 0.93 1.08 1.28 1 1.5 1.93 8 2.8) sorted;
		y: (1 to: 10);
		build.
	self  assert: plot x equals: #(1.33 1.35 0.93 1.08 1.28 1 1.5 1.93 8 2.8) sorted.

]

{ #category : #tests }
DCBarPlotTest >> testStringDatatX [
	self should: [ DCBarPlot new
		x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
		y: (1 to: 10);
		build ] raise: Error.
	plot 
		x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
		y: (1 to: 6);
		build.
	self  assert: plot x size equals: plot stringData size.
	self assert: plot y size equals: plot settings xtick ticks size.

]
