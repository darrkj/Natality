# CDC 2013 Birth Data R package

[Source](http://www.cdc.gov/nchs/data_access/VitalStatsOnline.htm)


## Setup and install

```
install.packages("devtools")
devtools::install_github("darrkj/Natality")
library(Natality)
```

## Read source file

```
ps_data <- import('Nat2013PublicPS.r20141016')

```



## Plotting the data

```
head(birthPS)
# Histogram of mother's age
hist(birthPS$MAGER)
```

![Fig 1](http://darrkj.github.io/images/MAGER.png)

## Complications

The larger dataset is too large to store in a github repository in a single file. It is also to big for the 'moving datasets to lazyload DB' portion of building an R package to include it. Storing it in a csv file is also a little clunky becuse it the size explodes by two orders of magnitude. The best way to work with this dataset is via an import function. Below you can see how to use the function to load the data from the web into your workspace.

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

## Read other years of data

```
download_natality('ps', 2013)
p13 <- import("zips/Nat2013PublicPS.r20141016")
mean(as.numeric(p13$MAGER))

download_natality('ps', 2012)
p12 <- import("zips/Nat2012PublicPS.r20140107")
mean(as.numeric(p12$MAGER))
```
