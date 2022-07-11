"
A DCLabelDecorationTest is a test class for testing the behavior of DCLabelDecoration
"
Class {
	#name : #DCLabelDecorationTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Decoration'
}

{ #category : #tests }
DCLabelDecorationTest >> testBasic [ 
	|label |
	label := DCLabelDecoration new.
	self assert: label shape class equals: RSLabel.
	self assert: label text isNil.
	
]

{ #category : #tests }
DCLabelDecorationTest >> testError [
	| x plot decoration |
	decoration := DCLabelDecoration new.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		title: 'DCLinePlot';
		xlabel: 'line x';
		ylabel: 'line y';
		yourself.
	self should: [ plot add: decoration; build ] raise: Error.
]

{ #category : #tests }
DCLabelDecorationTest >> testPositionInsideTheBox [
	| x plot decoration posx box label |
	posx := 30.
	decoration := DCLabelDecoration new
		x: posx;
		y: (posx raisedTo: 2);
		text: 'Max value';
		yourself.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		add: decoration;
		yourself.
	plot build.
	label := decoration label.
	box := plot settings background box.
	
	self assert: (box encompassingRectangle containsRect: label encompassingRectangle).
]

{ #category : #tests }
DCLabelDecorationTest >> testPositionIntersectsTheBox [
	| x plot decoration posx box label |
	posx := 100.
	decoration := DCLabelDecoration new
		x: posx;
		y: (posx raisedTo: 2);
		text: 'Max value';
		yourself.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		add: decoration;
		yourself.
	plot build.
	label := decoration label.
	box := plot settings background box.
	
	self assert: (box encompassingRectangle containsRect: label encompassingRectangle).
]

{ #category : #tests }
DCLabelDecorationTest >> testPositionOutsideTheBox [
	| x plot decoration posx |
	posx := 150.
	decoration := DCLabelDecoration new
		x: posx;
		y: (posx raisedTo: 2);
		text: 'Max value';
		yourself.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		add: decoration;
		yourself.
	self should: [ plot build ] raise: Error.
	
]

{ #category : #tests }
DCLabelDecorationTest >> testRenderIn [
	| label x plot decoration dot |
	decoration := DCLabelDecoration new.
	decoration x: 100;
		y: 100;
		text:' tous '.
	x := 1 to: 100.
	plot := DCLinePlot new
		x: x;
		y: (x raisedTo: 2);
		title: 'DCLinePlot';
		xlabel: 'line x';
		ylabel: 'line y';
		add: decoration;
		build;
		yourself.
	self assert: plot settings decorations size equals: 1.
	self assert: decoration createdShapes size equals: 2.
	dot := decoration createdShapes first.
	self assert: dot class equals: RSEllipse.
	label := decoration createdShapes second.
	self assert: label class equals: RSLabel.
	self assert: label text equals: ' tous '
]

{ #category : #tests }
DCLabelDecorationTest >> testSetter [ 
	|label |
	label := DCLabelDecoration new
	text: 'Invasion of Ukraine';
	x: 55.5;
	y: 100;
	yourself.
	
	self assert: label x equals: 55.5.
	self assert: label y equals: 100.
]
