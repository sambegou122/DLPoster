"
This class represent the objet who manage the RSScatter objet of Roassal-chart
"
Class {
	#name : #DCScatterPlot,
	#superclass : #DCChartPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCScatterPlot >> defaultKind [
	^ RSScatterPlot new
]
