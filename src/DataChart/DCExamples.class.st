Class {
	#name : #DCExamples,
	#superclass : #Object,
	#category : #'DataChart-Examples'
}

{ #category : #examples }
DCExamples >> exampleDCLine [
	<script: 'self new exampleDCLine'>
	| x |
	x := 1 to: 100.
	^ DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		build;
		show
]
