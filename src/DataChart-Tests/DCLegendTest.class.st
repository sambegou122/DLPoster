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
	self skip.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 3);
		color: Color green;
		legendDo: [:legend |
			legend targetAllShapes.
			legend targetOnlyBox.
			legend location inner; left; top; offset: 10@10 ];
		build;
		yourself.
	box := plot settings background box.
	legendShape := plot legend legend.
	self assert: (box encompassingRectangle containsRect: legendShape encompassingRectangle)
]
