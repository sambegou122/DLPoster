Class {
	#name : #DCPieChartTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'data'
	],
	#category : #'DataChart-Tests-Core'
}

{ #category : #running }
DCPieChartTest >> setUp [
	super setUp.
	
	plot := DCPieChart new.
	data  := 0 to: 50 by:10.
	
]

{ #category : #running }
DCPieChartTest >> testBasic [

	self assert: plot kind class equals: RSPie.
	self assert: plot kind sliceShape class equals: RSPieSlice.
	self assert: plot colors isNil.
	self assert: plot explodes isNil.
	self assert: plot labels isNil.
	self assert: plot legend class equals: DCLegend.
	self assert: plot data isNil.
]

{ #category : #running }
DCPieChartTest >> testBuild [
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
DCPieChartTest >> testChangeColors [
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
DCPieChartTest >> testExplodes [
	| shapes 	explodes |
	explodes:= { 0. 3.5. 0. 0.2. 2.5. 6 }.

	plot 
		data: data;
		explodes: explodes;
		build.
	plot show.
	shapes:= plot mainShapes.
	self assert: plot explodes equals: explodes.
	
	

]

{ #category : #running }
DCPieChartTest >> testLabels [
	| shapes 	 labels |
	self assert: plot labels isNil. 
	labels:= { 'papa'. 'mama'. 'tanta'. 'oncle'. 'frere'. 'soeur' }.

	plot 
		data: data;
		labels: labels;
		build.
	plot show.
	shapes:= plot mainShapes.
	self assert: plot labels equals:labels.
]

{ #category : #running }
DCPieChartTest >> testSize [
	
	self assert: plot size equals: plot defaultExternalRadius.
	plot 
		data: data;
		size: 100;
		build.
	self assert: plot size equals: 100.
]
