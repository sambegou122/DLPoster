Class {
	#name : #DCExamples,
	#superclass : #Object,
	#category : #'DataChart-Examples'
}

{ #category : #examples }
DCExamples >> exampleDCCombinePlot [
	<script: 'self new exampleDCCombinePlot'>
	| x line1 line2 line3 combined  |

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
		yourself.
	combined add: line3.
	^ combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build; 
		show.
]

{ #category : #examples }
DCExamples >> exampleDCCombinePlotWithVerticalLineDecoration [
	<script: 'self new exampleDCCombinePlotWithVerticalLineDecoration'>
	| x line1 line2 line3 combined decoration |

	x := 0.0 to: 2 count: 100.
	decoration := DCVerticalLineDecoration new.
	decoration x: 1.

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
	
	combined := DCCombinePlot new withAll: { line1. line2. line3 }.
	^ combined 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		add: decoration;
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
		xlabel: 'Axis X';
		ylabel: 'Axis y';
		build;
		show
]

{ #category : #examples }
DCExamples >> exampleDCLineWithLabelDecoration [
	<script: 'self new exampleDCLineWithLabelDecoration'>
	| x y decoration |
	x := 1 to: 100.
	y := x raisedTo: 3.
	decoration := (DCLabelDecoration new
		text: 'Foo bar';
		x: 50;
		y: (50 raisedTo: 3);
    yourself ).

	^ DCLinePlot new
		x: x;
		y: y;
		add: decoration;
		build;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCLineWithVerticalLineDecoration [
	<script: 'self new exampleDCLineWithVerticalLineDecoration'>
	| x decoration |
	decoration := DCVerticalLineDecoration new.
	decoration x: 70.
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		title: 'DCLinePlot';
		xlabel: 'line x';
		ylabel: 'line y';
		add: decoration;
		build;
		show
]

{ #category : #examples }
DCExamples >> exampleDCScatter [
	<script: 'self new exampleDCScatter'>
		| x |

	x := 0.0 to: 2 count: 100.

	^ DCScatterPlot new
		x: x;
		y: (x raisedTo: 2); 
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build;
		show.
]
