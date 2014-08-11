IVS_SelectionAccuracy
=====================

R code to compute the selection accuracy metrics recommended for evaluating input variable selection (IVS) methods in
The IVS framework proposed in


The recommended selection accuracy (SA) score expresses the degree to which a selected input subset matches the true input subset. This score is given as follows:

`SA = gamma * k / K + (1 - gamma) * (1 - p / (P - K))`

where K is the total number of relevant inputs; k is the number of relevant inputs selected; p is the number of extraneous (irrelevant or redundant) inputs selected; P is the total number of inputs in the candidate input pool (hence P - K is the total number of extraneous inputs) and gamma is a weight ranging from 0 to 1, which influences the penalty applied to the selection of extraneous inputs in relation to the gain achieved from each correctly selected input. This score can range from 0 to 1, where: 

* SA = 1 corresponds to a correctly specified model
* SA = 0 corresponds to a completely mis-specified model, with no relevant inputs and all extraneous inputs selected.

In addition, the SA score given above can be broken into two sub-scores:

* `SAc = k / K`
* `SAe = 1 - p / (P - K)`

where SAc indicates the proportion of correct inputs that have been selected and SAe is based on the proportion of extraneous inputs that have been selected. Both of these terms can range from 0 to 1, where a value closer to 1 denotes a better model. The advantage of these scores is that they express the degree to which a model is over- or under-specified, which is important for differentiating between IVS algorithm results.
