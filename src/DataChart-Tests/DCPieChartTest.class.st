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
	self assert: plot label class equals: RSLabel.
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
	shapes  with: data do:  [ :shape :aNumber|  self assert: shape model equals:aNumber] 
]

{ #category : #running }
DCPieChartTest >> testChangeColors [
	| shapes 	colors |
		colors:= { 'red'. 'blue'. 'black'. 'yellow'. 'green'. 'orange' }.

	plot 
		data: data;
		colors: colors;
		build.
	plot show.
	shapes:= plot mainShapes.
	self assert: plot colors equals: colors.
]
