Class {
	#name : #CombinedPlotTest,
	#superclass : #TestCase,
	#instVars : [
		'df',
		'window'
	],
	#category : #'DataChart-Tests-Plots'
}

{ #category : #tests }
CombinedPlotTest >> testBasicCombinedPlot [ 
	
	
	| x line1 line2 line3 combined |

	x := 0.0 to: 2 count: 100.

	line1 := LinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := LinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
		
	line3 := LinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	self skip.
	combined := CombinedPlot new withAll: { line1. line2. line3 }.
	combined 
		title: 'Hello world';
		xtitle: 'X Axis';
		ytitle: 'Y Axis';
		show.
]
