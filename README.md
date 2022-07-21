# DLPoster

DLPoster is a data viewer on pharo in progress coding
We are for the moment only at the beginning. So it could be that the structure will change in the next few days. Available from pharo9 and more

### Installation

Run this script on your pharo9 playground

```st
Metacello new
    baseline: 'DataChart';
    repository: 'github://sambegou122/DLPoster;
    load.
```

### Use:

For a data visualization we will need a good data structure to build on.
For this we use the DataFrame database that you can find (SRC : https://github.com/PolyMathOrg/DataFrame#readme).
	
### Types:
For now we only have two possible display types for our data: Scatter and Line charts

Here are some examples

``` st
	DCExamples new exampleDCLine open
```
You will see

![cap2](https://user-images.githubusercontent.com/98162905/167152735-1690964c-8042-4531-9722-346740b81cb5.png)

we have allso the examples for scatterplot

``` st
	DCExamples new  exampleDCScatter open
```
Result:

![cap3](https://user-images.githubusercontent.com/98162905/167153485-bb0b9cf5-c229-41d7-9c5c-edd0d90d5909.png)


### Adding a Decoration

For decoration line 


