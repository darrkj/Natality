# CDC 2013 Birth Data R package

[Source](http://www.cdc.gov/nchs/data_access/VitalStatsOnline.htm)

More info coming soon.

## Set and install

```
install.packages("devtools")
devtools::install_github("darrkj/Natality")
library(Natality)
```

## Plotting the data

```
data(birthPS)
# Histogram of mother's age
hist(birthPS$MAGER)
```

## Complications

The larger data set is to large to store in a github repository in a single file. It is also to big for the 'moving datasets to lazyload DB' portion of building an R package. Storing it in a csv file is also a little clunky. The best way to work with this dataset is via an iport function. Have a function to load the data from the web into your workspace.

```
# This will take a minute
# Load the first half
import_birth(1)

# Load the second half
import_birth(2)
```

## Need a csv file

```
write.csv(birthUS1, file = 'file.csv')
```


![Fig 1](http://darrkj.github.io/images/MAGER.png)
