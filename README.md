## Predicting the Percentage of Uninsured Constituents per State Based on Senators’ Votes on the Affordable Care Act
# About
Learing about the contentious debate surrounding the constitutional validity and efficacy of the Affordable Care Act (with 26 states challenging its constitutionality in 2012 alone) and various proposed plans to increase Americans' access during the 2020 presidential election, I was interested in learning more about how the stances of members of congress on major federal policies indirectly or directly affect their constituents. Since this question is extremely broad and requires analysis of a multitude of factors, I narrowed my focus on a simple project to see if there exists of a correlation between Americans' access to health insurance in 2011 and their senators's voting decisions on the Affordable Care Act(ACA) in 2009. 

# Methods
- Performed a cross-sectional analysis of the 2011 BRFSS Health Care Access/Coverage data published by the CDC.
- Fitted a linear model to the data using the lm function in R to analyze the correlation between the 2009 voting decisions of senators on the ACA and the percentage of their constitutions that were uninsured in 2011.

# Results
I calculated a slope of -1.4210 & constant of 17.9968, finding that there is a statistically significant difference between the percentage of uninsured constituents in states whose senators both support the ACA and states in which both senators opposed its passage.

<img width="820" alt="Screen Shot 2021-10-29 at 12 15 07 AM" src="https://user-images.githubusercontent.com/93302754/139374648-9b054de9-c2a9-4580-a700-8a649f7757bd.png">


<img width="1440" alt="Percentage of Constituents Without Healthcare by State in 2011" src="https://user-images.githubusercontent.com/93302754/139374338-657146ed-d958-47df-aa95-45dfed5d444a.png">

# Conclusion
There exists a correlation between Americans' access to health insurance in 2011 and their congresspeople's voting decisions on the ACA in 2009. This finding has lead me to ask even more questions: Do state legislators with the same political ideology as their senators vote in a similar manner on state-level healthcare legislation? What are the reasons for opposing legislation that increases access to healthcare despite having greater populations of uninsured constituents? Are there barriers to access to healthcare in states whose senators both oppose the ACA that are amplified by state-level policy decisions? I hope to pursue this vein of thought in my future data analysis projects. 
