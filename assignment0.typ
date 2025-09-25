
#set align(center)
#let content = text(weight: "bold", font: "Noto Sans", size: 15pt, "Assignment 0 - Introduction to Deep Learning\nGroup 53")
#rect(
  stroke: black,
  inset: (x: 65pt, y: 25pt),
  stack(
    spacing: 15pt,
    content,
  )
)

#set align(left)
= Task 1: Data dimensionality, distance-based classifiers
== 1.1
The first point of this task, ask us to calculate the center for each digit (from 0 to 9) from the MINST dataset in order to obtain a vector of dimension 256 ($16*16$ pixels) and a matrix of shape (10, 256).\
We have imported the dataset and merged the file `train_in` with `train_out` to have a single  labeled dataframe. Then we have calculated the center of each digit using the `groupby` function from pandas and the `mean` function.\
Once obtained the centers, we calculated the distance matrix by iterating over each pair of digit centers using two nested loops and computing the L2 norm (Euclidean distance) between them.



#figure(
  image("/Image/dm.png", width: 60%),
  caption: "Distance Matrix for the centers of each digit",
)

As is possible to see from the figure above, the digit that are more problematic to classify using only the centers are the 9 and 7 with the lower distance, where the most distance is between 0 and 1.\

== 1.2
As second part of task 1, we have to reduce the dimensionality of the data using three different techniques: PCA, U-MAP and T-SNE.\

#figure(
  image("/Image/pca.png", width: 80%),
  caption: "Distance Matrix for the centers of each digit",
)
#figure(
  image("/Image/umap.png", width: 80%),
  caption: "Distance Matrix for the centers of each digit",
)
#figure(
  image("/Image/tsne.png", width: 80%),
  caption: "Distance Matrix for the centers of each digit",
)
== 1.3
#figure(grid(columns: 2, row-gutter: 2mm, column-gutter: 1mm,

  image("/Image/train_knn.png"), image("Image/test_knn.png"), 

  "a) train set", "b) test set"),

  caption: "Caption"

)

== 1.4
Stesso risultato perchè KNN usa L2 norm e con n=1 il risultato è lo stesso. diversi n invece danno risulatit diversi.
#figure(grid(columns: 2, row-gutter: 2mm, column-gutter: 1mm,

  image("/Image/train_knn.png"), image("Image/test_knn.png"), 

  "a) train set", "b) test set"),

  caption: "Caption"

)

= Task 2: implement a multi-class perceptron algorithm

#pagebreak()
= Contributions
#set align(center)
#table(
  columns: (auto, auto, auto, auto),
  align: (center, center, center, center),
  [*Student*], [*Task 1*],[*Task 2*], [*Task 3*],
  "Filippo Bomben", "1.003", "2,007", "",
  "Sara Casagrande", "3.108", "ND", "",
  //"Gian Marco Tomietto", "1.703", "ND", "",
)