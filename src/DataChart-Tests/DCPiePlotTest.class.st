Class {
	#name : #DCPiePlotTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'data'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCPiePlotTest >> setUp [
	super setUp.
	
	plot := DCPiePlot new.
	data  := 0 to: 50 by:10.
	
]

{ #category : #running }
DCPiePlotTest >> testBasic [

	self assert: plot kind class equals: RSPie.
	self assert: plot kind sliceShape class equals: RSPieSlice.
	self assert: plot colors isNil.
	self assert: plot explodes isNil.
	self assert: plot labels isNil.
	self assert: plot legend class equals: DCLegend.
	self assert: plot data isNil.
]

{ #category : #running }
DCPiePlotTest >> testBuild [
	| shapes |

	plot 
		data: data;
		build.
	shapes:= plot mainShapes.
	self assert: plot defaultColors class equals: NSOrdinalScale.
	self assert: shapes size equals: data size.
	shapes with: data do: [ :shape :aNumber| self assert: shape model equals: aNumber ] 
]

{ #category : #running }
DCPiePlotTest >> testChangeColors [
	| shapes 	colors |
	colors:= { 'red'. 'blue'. 'black'. 'yellow'. 'green'. 'orange' }.
	plot 
		data: data;
		colors: colors;
		build.
	shapes:= plot mainShapes.
	self assert: plot colors equals: colors.
	shapes with: colors do: [:shape :color|
		self assert: shape  color equals: (Color colorFrom:color) ]
	

]

{ #category : #running }
DCPiePlotTest >> testExplodes [
	| shapes 	explodes |
	explodes:= { 0. 5. 0. 0. 10. 0 }.

	plot 
		data: data;
		explodes: explodes;
		build.
	shapes:= plot mainShapes.
	self assert: plot explodes equals: explodes.
	
	

]

{ #category : #running }
DCPiePlotTest >> testLabels [
	| shapes 	 labels |
	self assert: plot labels isNil. 
	labels:= { 'papa'. 'mama'. 'tanta'. 'oncle'. 'frere'. 'soeur' }.

	plot 
		data: data;
		labels: labels;
		build.
	shapes:= plot mainShapes.
	self assert: plot labels equals:labels.
]

{ #category : #running }
DCPiePlotTest >> testLabelsOut [
	| shapes 	 labels |
	self assert: plot labels isNil. 
	labels:= { 'papa'. 'mama'. 'tanta'. 'oncle'. 'frere'. 'soeur' }.

	plot 
		data: data;
		labels: labels;
		useLabelOut;
		build.
	shapes:= plot mainShapes.
	self assert: plot labels equals:labels.
]

{ #category : #running }
DCPiePlotTest >> testSize [
	
	self assert: plot size equals: plot defaultExternalRadius.
	plot 
		data: data;
		size: 100;
		build.
	self assert: plot size equals: 100.
]
