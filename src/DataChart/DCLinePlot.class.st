"
This class represent the objet who manage the RSLine objet of Roassal-chart

For more information check the example Package.
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
