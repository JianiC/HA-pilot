## Beast tree visulization
source("set_up.R")
Smith_beast<-read.beast("../Results/Smith_HA_mrca_set_p/Smith_HA_mrca_p_anot.tree")
p1<-ggtree(Smith_beast, mrsd="2003-2-23",size=0.5)+
  theme_tree2()+
  scale_x_continuous(breaks = seq(1965,2000,5),position = 'bottom',limits =c(1965,2004))

meta_Smith<- read.table("Smith_meta.txt", sep="\t", header=TRUE,check.names=FALSE, stringsAsFactor=F, fill=TRUE)
raw<-ggtree(Smith_beast)+geom_text(aes(label=node),size=2,color= "blue")

p1%<+% meta_Smith +
  geom_nodepoint(aes(label=label, subset=(node==451)),size=2,  color="blue")+
  geom_nodelab(aes(label="FU02", subset=(node == 451)))+
  geom_nodepoint(aes(label=label, subset=(node==438)),size=2,  color="blue")+
  geom_nodelab(aes(label="SY97", subset=(node == 438)))+
  geom_nodepoint(aes(label=label, subset=(node==398)),size=2,  color="blue")+
  geom_nodelab(aes(label="WU95", subset=(node == 398)))+
  geom_nodepoint(aes(label=label, subset=(node==395)),size=2,  color="blue")+
  geom_nodelab(aes(label="BE92", subset=(node == 395)))+
  geom_nodepoint(aes(label=label, subset=(node==351)),size=2,  color="blue")+
  geom_nodelab(aes(label="BE89", subset=(node == 351)))+
  geom_nodepoint(aes(label=label, subset=(node==311)),size=2,  color="blue")+
  geom_nodelab(aes(label="SI87", subset=(node == 311)))+
  geom_nodepoint(aes(label=label, subset=(node==296)),size=2,  color="blue")+
  geom_nodelab(aes(label="BK79", subset=(node == 296)))+
  geom_nodepoint(aes(label=label, subset=(node==272)),size=2,  color="blue")+
  geom_nodelab(aes(label="TX77", subset=(node == 272)))+
  geom_nodepoint(aes(label=label, subset=(node==286)),size=2,  color="blue")+
  geom_nodelab(aes(label="VI75", subset=(node == 286)))+
  geom_nodepoint(aes(label=label, subset=(node==270)),size=2,  color="blue")+
  geom_nodelab(aes(label="EN72", subset=(node == 270)))+
  geom_nodepoint(aes(label=label, subset=(node==258)),size=2,  color="blue")+
  geom_nodelab(aes(label="HK68", subset=(node == 258)))+
  geom_tippoint(aes(subset=(vaccine_strain=="vaccine")),color="red", fill = "red", shape=23, size=2)+
  (aes(color=cluster))+
  scale_color_brewer(palette ="Paired",na.value="black", 
                     breaks=c("HK68","EN72","VI75","TX77","BK79","SI87","BE89","BE92","WU95","SY97","FU02"))+
  geom_tiplab(aes(label=aa_mut, subset=(vaccine_strain=="vaccine")),color="#252525",size=2)->p




