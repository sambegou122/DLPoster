Class {
	#name : #DCLegendTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCLegendTest >> testBasic [
	| x plot box legendShape |
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		color: Color green;
		legendDo: [:legend | 
			legend location bottom ];
		build;
		yourself.
	self assert: plot legend class equals: DCLegend.
	box := plot settings background box.
	legendShape := plot legend legend.
	self deny: (box encompassingRectangle containsRect: legendShape encompassingRectangle)
]

{ #category : #tests }
DCLegendTest >> testInnerLegend [
	| x plot box legendShape |
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		color: Color green;
		legendDo: [:legend |
			self assert: legend location class equals: DCLocation.
			legend location
				inner;
				top;
				center;
				offset: 0@ 10 ];
		build;
		yourself.
	box := plot settings background box.
	legendShape := plot legend legend.
	self assert: (box encompassingRectangle containsRect: legendShape encompassingRectangle)
]
