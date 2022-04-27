"
Baseline for repositoy https://github.com/sambegou122/DLPoster
"
Class {
	#name : #BaselineOfDataChart,
	#superclass : #BaselineOf,
	#category : #'BaselineOfDataChart-Baseline'
}

{ #category : #baselines }
BaselineOfDataChart >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		"https://github.com/sambegou122/DLPoster"
		"Dependencies"
		self dataFrame: spec.

		"Packages"
		spec
			package: 'DataChart' with: [ spec requires: 'DataFrame' ];
			"package: 'DataChart';"
			"package: 'DataFrameChart' with: [ spec requires: 'DataFrame' ];"
			package: 'DataChart-Tests'.
			
		"Groups"
		spec
			group: 'Core' with: #('DataChart');
			"group: 'DataFrame' with: #('Core' 'DataFrameChart');"
			group: 'Tests' with: #('Core' 'DataChart-Tests');
			group: 'default' with: #('Core' 'Tests') ]
]

{ #category : #baseline }
BaselineOfDataChart >> dataFrame: spec [
	spec
		baseline: 'DataFrame'
		with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ]
]
