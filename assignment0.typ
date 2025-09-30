
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
== Task 1.1 <t>
The first point of this task, ask us to calculate the center for each digit (from 0 to 9) from the MINST dataset in order to obtain a vector of dimension 256 ($16*16$ pixels) and a matrix of shape (10, 256).\
We have imported the dataset and merged the file `train_in` with `train_out` to have a single  labeled dataframe. Then we have calculated the center of each digit using the `groupby` function from pandas and the `mean` function.\
Once obtained the centers, we calculated the distance matrix by iterating over each pair of digit centers using two nested loops and computing the L2 norm (Euclidean distance) between them.

<1>
#figure(
  image("/Image/dm.png", width: 60%),
  caption: "Distance Matrix for the centers of each digit" ,
)

As is possible to see from the #link(<1>)[Figure 1], the digit that are more problematic to classify, using only the centers, are the 9 and 7, where the most distanced classes are 0 and 1.\

== Task 1.2
As second part of task 1, we reduced the dimensionality of the data using three different techniques: PCA, U-MAP and T-SNE.\
=== PCA
We have used the PCA implementation from sklearn, setting the number of components to 2, in order to obtain a two dimension space, and setting the random state to 42 to have reproducible results.\
The #link(<2>)[Figure 2] shows the results where the different colors represent the different digits. Zero is the most separated class, where the other are in clusters mixed toghether.
<2>
#figure(
  image("/Image/pca.png", width: 80%),
  caption: "PCA results",
)

=== U-MAP
The same setting of PCA has been used for U-MAP in terms of dimensionality and reproducibility. The #link(<3>)[Figure 3] shows how U-MAP is able to describe and separate better the data using only two dimensions. The digits 7, 9 and 4 are the most closest ones but still separated.
<3>
#figure(
  image("/Image/umap.png", width: 80%),
  caption: "U-MAP results",
)
=== T-SNE
With T-SNE we have achived a result not good as U-MAP but still better than PCA. The #link(<4>)[Figure 4] shows cluster almost well separated but distributed in a larger space and less compact.
<4>
#figure(
  image("/Image/tsne.png", width: 80%),
  caption: "T-SNE results",
)
== Task 1.3

<t2>
We created a `nearest mean classifier` form scratch both on the train and test set: this method is based on evaluation of the L2 norm (Euclidean distance) between the different samples and the center dataset (ten vectors of 256 dimension made in the #link(<t>)[Task 1.1]). 
Looking at the confusion matrix of the train set in #link(<5>)[Figure 5], we can see that the most problematic digits to classify 
are 0 and 6 in both test and train set. There are also some misclassification between the classes 7 and 9 but not as many as we could expect, given the low distance between their centers in the distance matrix.\
The results are very similar between the two sets, with an accuracy of 0.86% for the train set and 0.80% for the test set: 
this is due to the different sample size of the train and the test set (1706 and 999 respectively). 


#pagebreak()
<5>
#figure(grid(columns: 2, row-gutter: 2mm, column-gutter: 1mm,

  image("/Image/train_knn.png"), image("Image/test_knn.png"), 

  "a) train set", "b) test set"),

  caption: "Confusion Matrices"

)

== Task 1.4
<t3>
As last subtask we implemented a `KNN (K-Nearest-Neighbor)` classifier.  
We iterated over different values of `k` (from 1 to 9) to find how the accuracy changes. We obtained the best results with `k=1`, this because with low values of `k` capture more details in the data, but can also lead to overfitting.\
We obtain the same accuracy, for both train and test set, as the `nearest mean classifier`, probably because `KNN` without tuning the hyperparameters `metric` and `p` use the L2 norm as well. This explains why the results are the same, as is possible to see in the confusion matrices in #link(<5>)[Figure 5].

= Task 2: implement a multi-class perceptron algorithm
Task 2 required us to implement a multi-class perceptron from scratch in order to classify the same MINST dataset.\
We have created the class `Perceptron` with attributes such as learning rate, number of epochs, weight and number of final classes, so it possible to use this class for other datasets with different number of labels.\
As methods we have implemented the `fit` function used to train the model, the `predict` method used to predict the labels using the trained weights and `accuracy` to calculate, as the name suggests, the accuracy of the predicted classes.\
== Fit method
The `fit` function takes as input the training data and the corresponding labels. First we initialize the weights, with values between 0 and 0.01, using the same shape of the input `X` data.\
Then we iterate with two loops, first over each epoch, and then for every samples in the training set. We implemented the forward pass using `z = x @ self.W + self.b` to perform the dot product betweem the input and the weights and adding the bias, and then we used the `argmax` to obtain the most probable class. In this iteration we also calculate the if the prediction is wrong, useful to update the weights and bias, and also the loss (MSE).\
For the weights and bias update we used another loop to iterate over each class. We adjust the bias as `bias = bias + learning_rate * error` and the weights as `weights = weights + learning_rate * error * x`.
== Results
We trained the model using different learning rates, specifically 0.001, 0.0001 and 0.00001, with 70 epochs and for each of them we plotted the loss curve and calculated the accuracy. In particular, we obtained the best result with a learning rate of 0.0001, reaching, as is possible to see in the #link(<6>)[Figure 6 and 7], an accuracy of almost 0.95% in the `train_set` where in the `test_set`the accuracy is 0.87%.


#figure(
  image("/Image/loss.png", width: 100%),
  caption: "Training loss during the epochs",
)
<6>
#figure(
  image("/Image/acc.png", width: 100%),
  caption: "Training accuracy during the epochs",
)
To achieve better results it is necessary to create a more complex Neural Network, with more layers in order to capture more details in the data. A single perceptron is not enough, but an accuracy of 0.87% in the `test_set`, is better than the results obtained in #link(<t2>)[Task 1.3] and #link(<t3>)[1.4] with the `nearest mean classifier` and `KNN`.
= Contributions
#set align(center)
#table(
  columns: (auto, auto, auto, auto),
  align: (center, center, center, center),
  [*Student*], [*Task 1*],[*Task 2*], [*Task 3*],
  "Filippo Bomben", "Code and Report", "Code and Report", "/",
  "Sara Casagrande", "Code and Report", "Report", "/",
  "Gian Marco Tomietto", "Report", "Code and Report", "/",
)
