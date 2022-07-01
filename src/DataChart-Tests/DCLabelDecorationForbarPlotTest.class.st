Class {
	#name : #DCLabelDecorationForbarPlotTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCLabelDecorationForbarPlotTest >> testAdd [
	| decoration plot x|
	decoration := DCLabelDecorationForBarPlot new.
	x := #(1.33 1.35 0.93 4 6 6).
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			add: decoration;
			build;
			yourself.
			
	self assert: plot settings decorations first class equals: DCLabelDecorationForBarPlot.
	self assert: decoration labels size equals: x size.
	decoration labels with: plot kind bars do: [ :label :bar | 
		self deny: (bar encompassingRectangle containsRect: label encompassingRectangle).
		self assert: bar position x equals: label position x.
		self assert: bar position y > label position y.
		 ]
]

{ #category : #tests }
DCLabelDecorationForbarPlotTest >> testBasic [ 
	| decoration |
	decoration := DCLabelDecorationForBarPlot new.
	self assert: decoration location class equals: RSLocation.
	self assert: decoration class equals: DCLabelDecorationForBarPlot.
]

{ #category : #tests }
DCLabelDecorationForbarPlotTest >> testLocation [
	| decoration plot x|
	decoration := DCLabelDecorationForBarPlot new.
	x := #(1.33 1.35 0.93 4 6 6).
	decoration location inner offset: 0@1.
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			add: decoration;
			build;
			yourself.
	decoration labels with: plot kind bars do: [ :label :bar |
		self assert: (bar encompassingRectangle containsRect: label encompassingRectangle).
		
		 ]
	
]
