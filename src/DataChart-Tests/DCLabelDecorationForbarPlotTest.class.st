Class {
	#name : #DCLabelDecorationForbarPlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCLabelDecorationForbarPlotTest >> testAdd [
	| decoration plot x|
	decoration := DCLabelDecorationForbarPlot new.
	x := #(1.33 1.35 0.93 4 6 6).
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			add: decoration;
			build;
			yourself.
			
	self assert: plot settings decorations first class equals: DCLabelDecorationForbarPlot.
	self assert: decoration labels size equals: x size.
]

{ #category : #tests }
DCLabelDecorationForbarPlotTest >> testBasic [ 
	| decoration |
	decoration := DCLabelDecorationForbarPlot new.
	self assert: decoration class equals: DCLabelDecorationForbarPlot.
]
