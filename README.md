# RGB-to-HSL
 
R' = R/255

G' = G/255

B' = B/255

Cmax = max(R', G', B')

Cmin = min(R', G', B')

Δ = Cmax - Cmin

![image](https://user-images.githubusercontent.com/38158565/176777736-7080b1fa-a706-4a07-8992-d6e4013a2e54.png)

![image](https://user-images.githubusercontent.com/38158565/176777822-9313c0c0-cab6-462e-84e6-21e6db131e8b.png)

![image](https://user-images.githubusercontent.com/38158565/176777867-657e8e32-7ae2-4e22-ab44-c32580b995f7.png)

# HSL-to-RGB
When 0 ≤ H < 360, 0 ≤ S ≤ 1 and 0 ≤ L ≤ 1:

C = (1 - |2L - 1|) × S

X = C × (1 - |(H / 60°) mod 2 - 1|)

m = L - C/2

![image](https://user-images.githubusercontent.com/38158565/176778020-8be24a48-eaeb-4b76-9057-f7964baf3c52.png)

(R,G,B) = ((R'+m)×255, (G'+m)×255,(B'+m)×255)

#Tela do programa
![image](https://user-images.githubusercontent.com/38158565/176778423-31941922-0502-458a-a72f-7c631617fd21.png)

