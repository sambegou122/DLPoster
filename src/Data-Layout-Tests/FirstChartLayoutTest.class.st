"
A FirstChartLayoutTest is a test class for testing the behavior of FirstChartLayout
"
Class {
	#name : #FirstChartLayoutTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-layout'
}

{ #category : #tests }
FirstChartLayoutTest >> testChart [
	| chartLayout |
	chartLayout := FirstChartLayout new.
	self assert: chartLayout chart class equals: RSChart 
	
]

{ #category : #tests }
FirstChartLayoutTest >> testPlot [
	| chartLayout plot |
	plot := RSLinePlot new.
	chartLayout := FirstChartLayout new.
	chartLayout plot: plot.
	self assert: chartLayout plot equals: plot 
	
]

{ #category : #tests }
FirstChartLayoutTest >> testXYPlotDimension [
	| chartLayout plot x y |
	x := -3.14 to: 3.14 by: 0.01.
	y := x sin * 0.22 + 0.5.
	plot := RSLinePlot new. 
	chartLayout := FirstChartLayout new.
	chartLayout plot: plot.
	chartLayout xPlotDimention: x yPlotDimension: y.
	self assert: chartLayout plot xValues  equals: x.
	self assert: chartLayout plot yValues  equals: y. 
	
]
