"
This class represent the objet who manage the RSLine objet of Roassal-chart
"
Class {
	#name : #DCLinePlot,
	#superclass : #DCChartPlot,
	#category : #'DataChart-Core'
}

{ #category : #default }
DCLinePlot >> defaultKind [
	^ RSLinePlot new
]
