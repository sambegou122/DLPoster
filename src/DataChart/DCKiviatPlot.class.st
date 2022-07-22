Class {
	#name : #DCKiviatPlot,
	#superclass : #DCCircularPlot,
	#category : #'DataChart-Core'
}

{ #category : #building }
DCKiviatPlot >> build [
	" this methode build the plot"
	|rowNames rows |
	rowNames := self data first.
	rows := self data allButFirst.
	self rowNames: rowNames rows: rows.
	"self kind build."
]

{ #category : #default }
DCKiviatPlot >> defaultKind [ 
	^ RSKiviat new.
]

{ #category : #accessing }
DCKiviatPlot >> mainShapes [
	^ self kind polygonShapes. 
]

{ #category : #building }
DCKiviatPlot >> rowNames: rowNames rows: rows [
	
	self kind 
		addRows: rows;
		axisNames: rowNames.
]

{ #category : #showing }
DCKiviatPlot >> show [
	"this methode allow to show the plot in the canvas"
	| canvas |
	self kind build.
	canvas := self kind canvas.
	^ canvas open
]
