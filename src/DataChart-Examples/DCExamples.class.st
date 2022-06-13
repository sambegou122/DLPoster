Class {
	#name : #DCExamples,
	#superclass : #Object,
	#category : #'DataChart-Examples'
}

{ #category : #examples }
DCExamples >> exampleDCBarPlotCustomStringDataX [
	<script: 'self new exampleDCBarPlotCustomStringDataX'>
	| x plot  window |
	x := #(1.33 1.35 0.93 4 6 6).
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			yourself.
	plot build.
	window := plot show.
	^ window
]

{ #category : #examples }
DCExamples >> exampleDCBarPlotCustomX [
	<script: 'self new exampleDCBarPlotCustomX'>
		| x plot bars window |
	x := #(1.33 1.35 0.93 4 6 6).
	plot := DCBarPlot new
			x: #('mama' 'papa' 'oncle' 'pipoune' 'tata' 'toto');
			y: x;
			yourself.
	plot build.
	window := plot show.
	^ window.
	
]

{ #category : #examples }
DCExamples >> exampleDCClusterBarPlot [
	<script: 'self new exampleDCClusterBarPlot'>
	| x y plots perlin |
	perlin := NSPerlinNoise3 new octaves: 7.
	
	x := 0.0 to: 2 count: 10.
	plots := (1 to: 4) collect: [ :index | 
		y := x collect: [ :n | (perlin noise: n and: index) ].
		DCBarPlot new
			y: y;
			yourself ].
	
	^ (DCClusterBarPlot withAll: plots)
		title: 'Cluster Bar Plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCClusterBarPlotWithDecoration [
	<script: 'self new exampleDCClusterBarPlotWithDecoration'>
	| x y y2 plot1  plot2 y3 plot3 y4 plot4 decoration |

	x := 0.0 to: 2 count: 10.
	y := x raisedTo: 2.
	y2 := x raisedTo: 3.
	y3 := x raisedTo: 4.
	y4 := (x raisedTo: 5) +3.
	decoration := (DCLabelDecoration new
		text: 'Maximum value: ', ((2 raisedTo: 5) +3) asString;
		color: Color black;
		x: 2;
		y: (2 raisedTo: 5) +3;
    yourself ).
	plot1 := DCBarPlot new x:x ;y: y.
	plot2 := DCBarPlot new x:x;y: y2.
	plot3 := DCBarPlot new x:x; y: y3.
	plot4 := DCBarPlot new x:x; y: y4.
	 ^ DCClusterBarPlot new withAll: { plot1. plot2 };
		add: plot3;
		add: plot4;
		title: 'Cluster bar plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		add: decoration;
		build;
		show.
]

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
		name: 'covid evolution';
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
		legendDo: [ : legend|
			legend location inner top offset: 10];
		build;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCCombinePlotWithVerticalLineDecoration [
	<script: 'self new exampleDCCombinePlotWithVerticalLineDecoration'>
	| x line1 line2 line3 combined decoration |

	x := 0 to: 100.
	decoration := DCVerticalLineDecoration new color: Color blue.
	decoration x: 70.

	line1 := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		yourself.

	line2 := DCLinePlot new
		x: x;
		y: (x raisedTo: 3.8);
		yourself.
	
	line3 := DCScatterPlot new
		x: x;
		y: (x raisedTo: 4);
		color: Color green;
		yourself.
	
	combined := DCCombinePlot new withAll: { line1. line2. line3 }.
	^ combined 
		title: 'Line decoration';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		add: decoration;
		extent: 400@400;
		build;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCHistogram [
	<script: 'self new exampleDCHistogram'>
	| x |
	x :=  self randomValues.
	^ DCHistogramPlot new
		x: x;
		title: 'Histogram';
		xlabel: 'Axis X';
		ylabel: 'Axis y';
		build;
		show
]

{ #category : #examples }
DCExamples >> exampleDCHistogramWithDecoration [
	<script: 'self new exampleDCHistogramWithDecoration'>
	| x decoration |
	x := self randomValues.
	decoration := (DCLabelDecoration new
		text: 'Middle area';
		x: 175;
		y: 80;
    yourself ).
	^ DCHistogramPlot new
		x: x;
		xlabel: 'Axis X';
		ylabel: 'Axis y';
		add: decoration;
		build;
		show
]

{ #category : #examples }
DCExamples >> exampleDCLine [
	<script: 'self new exampleDCLine'>
	| x |
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 2); 
		color: Color green;
		build;
		show.
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

{ #category : #examples }
DCExamples >> exampleDCStackBarPlot [
	<script: 'self new exampleDCStackBarPlot'>
	| x y plots perlin |
	perlin := NSPerlinNoise3 new octaves: 7.
	
	x := 0.0 to: 2 count: 10.
	plots := (1 to: 4) collect: [ :index | 
		y := x collect: [ :n | (perlin noise: n and: index) ].
		DCBarPlot new
			y: y;
			yourself ].

	 ^ (DCStackBarPlot withAll: plots)
		title: 'Stack Bar Plot';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build;
		show.
]

{ #category : #examples }
DCExamples >> exampleDCStackBarPlotWithDecoration [
	<script: 'self new exampleDCStackBarPlotWithDecoration'>
	| x y y2 plot1  plot2 y3 plot3 decoration |

	x := 0.0 to: 2 count: 10.
	y := x raisedTo: 2.
	y2 := x raisedTo: 3.
	y3 := x raisedTo: 4.
	decoration := (DCLabelDecoration new
		text: 'Foo bar';
		x: 5;
		y: (5 + 3);
    yourself ).
	
	plot1 := DCBarPlot new.
	plot1 y: y.
	plot2 := DCBarPlot new.
	plot2 y: y2.
	plot3 := DCBarPlot new y:y3.
	
"combined := DCCombinePlot new."

	 ^ DCStackBarPlot new withAll: { plot1. plot2. decoration };
		add: plot3;
		title: 'Hello world';
		xlabel: 'X Axis';
		ylabel: 'Y Axis';
		build;
		show.
]

{ #category : #examples }
DCExamples >> normal: x mean: mean stdDev: std [
	^ (-0.5 * Float twoPi log - std log -
		 ( ((x - mean) raisedTo: 2) / (2 * std * std))) exp
]

{ #category : #examples }
DCExamples >> randomValues [
	<script: 'self new randomValues inspect'>
	^ self randomValues: 170 scale: 10 size: 250.
]

{ #category : #examples }
DCExamples >> randomValues: loc scale: scale size: size [
	| low upp mean stdDev r |
	"TODO generate a new method to creatte random values with normal distribution"
	low := 0.
	upp := 100.
	mean := (low + upp) / 2.
	stdDev := (upp - low)/4.
	r := Random new.
	r seed: 44.
	
	^ ((1 to: size ) collectWithIndex: [ :i :index | 
		| val sign rval |
		rval := r rsNext:0-mean and: upp + mean.
		val := self normal: rval mean: mean stdDev: stdDev.
		sign := index < (size / 2) ifTrue: [ -1 ] ifFalse: [ 1 ].
		
		loc +(size * val * sign)
		 ]) shuffled.
]
