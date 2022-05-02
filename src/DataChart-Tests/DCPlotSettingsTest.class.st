"
A DCPlotSettingsTest is a test class for testing the behavior of DCPlotSettings
"
Class {
	#name : #DCPlotSettingsTest,
	#superclass : #TestCase,
	#category : #'DataChart-Tests-Core'
}

{ #category : #tests }
DCPlotSettingsTest >> testBasic [
	| settings |
	settings := DCPlotSettings new.
	self assert: settings extent equals: settings defaultExtent.
	self assert: settings padding equals: settings defaultPadding.
	self assert: settings color isNil.
	self assert: settings title isNil.
	self assert: settings xlabel isNil.
	self assert: settings ylabel isNil.

]

{ #category : #tests }
DCPlotSettingsTest >> testBasicSetter [
	| settings |
	settings := DCPlotSettings new.
	settings
		extent: 500@ 400;
		padding: 30@30;
		color: Color purple;
		title: 'Hello World';
		xlabel: 'X axis';
		ylabel: 'Y axis'.	

	self assert: settings extent equals: 500@ 400.
	self assert: settings padding equals: 30@30.
	self assert: settings color equals: Color purple.
	self assert: settings title equals: 'Hello World'.
	self assert: settings xlabel equals: 'X axis'.
	self assert: settings ylabel equals: 'Y axis'.
]
