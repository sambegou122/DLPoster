Class {
	#name : #DCExamples,
	#superclass : #Object,
	#category : #'DataChart-Examples'
}

{ #category : #examples }
DCExamples >> exampleDCCombinePlot [
	<script: 'self new exampleDCCombinePlot'>
	| x line1 line2 line3 combined |

	x := 0.0 to: 2 count: 100.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	line3 := DCScatterPlot new
		x: x;
		y: (x raisedTo: 4);
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2. line3}.
	combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
	build;
	show.
]

{ #category : #examples }
DCExamples >> exampleDCLine [
	<script: 'self new exampleDCLine'>
	| x |
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		title: 'DCLinePlot';
		xlabel: ' line x';
		ylabel: 'line y';
		build;
		show
]

{ #category : #examples }
DCExamples >> exampleDCScatter [
	<script: 'self new exampleDCScatter'>
		| x line1 line2 line3 combined |

	x := 0.0 to: 2 count: 100.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	line3 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2. line3 }.
	combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
	build;
	show.
]