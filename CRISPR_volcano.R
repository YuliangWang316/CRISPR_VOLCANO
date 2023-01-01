setwd("E:/TEST3/")
diff_gene <- read.table("pos.txt", sep="\t", header=TRUE, row.names=1)
diff_gene=as.data.frame(diff_gene)
gene_list<-diff_gene
colnames(gene_list)=c("padj","logFC")
gene_list$threshold = as.factor(abs(gene_list$logFC) > 0.58 & gene_list$padj < 0.05)
colored_point<-gene_list[gene_list$threshold == "TRUE",]

gene_list$threshold<-as.character(gene_list$threshold)


library("ggplot2")
pdf("vocano.pdf")

g = ggplot(data=gene_list, aes(x=logFC, y=-log10(padj))) + geom_point(alpha=1, size=5,shape=21,fill="Gray",color="Black")  + xlim(c(-1, 1)) + ylim(c(0, 3)) +xlab("log2 fold change") + ylab("-log10 p-value") + theme_set(theme_bw()) + theme(panel.grid.major=element_line(colour=NA)) 
print(g)
dev.off()
