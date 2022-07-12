"
This class represent the objet who manage the RSScatter objet of Roassal-chart

For more information check the example Package.
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
