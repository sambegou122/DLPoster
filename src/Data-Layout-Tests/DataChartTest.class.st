"
A DataChartTest is a test class for testing the behavior of DataChart
"
Class {
	#name : #DataChartTest,
	#superclass : #TestCase,
	#category : #'Data-Layout-Tests-Data-Layout'
}

{ #category : #tests }
DataChartTest >> testChart [
	| dataChart |
	dataChart := DataChart new.
	self assert: dataChart chart class equals:RSChart. 
]

{ #category : #tests }
DataChartTest >> testData [
	| data dataChart |
	dataChart := DataChart new.
	data := 1 to: 20 by:1.5.
	dataChart data: data.
	self assert: dataChart data equals:data 
]

{ #category : #tests }
DataChartTest >> testKind [
	| instance |
	instance := DataChart from: 'scatter'.
	self assert: instance class equals: DataScatterChart.
	instance := DataChart from: 'foo'.
	self assert: instance isNil.
	
	
]
