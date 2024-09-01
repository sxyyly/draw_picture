In 《Enhanced Accuracy in Local Differential Privacy via Leveraging Inherent Uncertainty》 project,we provide a comprehensive experimental study of our approaches.And in this project, we plot a series of relationships based on the results of our experimental analyses described above.



Code running environment: MATLAB R2020a-academic use



Code File Description

	Missing_data1.m:
 		(a) Plot of missing status perturbation probability p1 vs. conditional probability α. 
   		(b) Plot of missing status perturbation probability p1 vs. conditional probability β. 
   		(c) Plot of missing status perturbation probability p1 vs. privacy budget ε.

	Missing_data2.m: 
 		(a) Plot of the difference in average variance across all attribute values between the one-stage perturbation and two-stage perturbation schemes vs. missing status perturbation probability p1.
   		(b) Plot of the difference in average variance across all attribute values between the one-stage perturbation and two-stage perturbation schemes vs. missing rate δ.

	RR.m: 
 		(a) Plot of protocol mean squared error vs. conditional probability α. 
   		(b) Plot of protocol mean squared error vs. conditional probability β. 
	 	(c) Plot of protocol mean squared error vs. privacy budget ε.

	GRR.m: 
 		(a) Plot of protocol mean squared error vs. conditional probability α. 
   		(b) Plot of protocol mean squared error vs. conditional probability β.
	 	(c) Plot of protocol mean squared error vs. privacy budget ε. 
   		(d) Plot of protocol mean squared error vs. attribute domain size d.

	OUE.m：
 		(a) Plot of protocol mean squared error vs. conditional probability α. 
   		(b) Plot of protocol mean squared error vs. conditional probability β. 
	 	(c) Plot of protocol mean squared error vs. privacy budget ε. 
   		(d) Plot of protocol mean squared error vs. attribute domain size d.
