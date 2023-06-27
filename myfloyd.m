function[dist,mypath]=myfloyd(a,sb,db);
%输入：a-零阶矩阵；元素a(i,j)-顶点i到j之间的直达距离，可以是有向的
%sb-起点的标号；db-终点的标号
%输出：dist-最短的距离；%mypath-最短路的路径
n=size(a,1); path=zeros(n);
for k=1:n
    for i=1:n
        for j=1:n
            if a(i,j)>a(i,k)+a(k,j)
                a(i,j)=a(i,k)+a(k,j);
                path(i,j)=k;
            end
        end
    end
end
dist=a(sb,db);
parent=path(sb,:);%从起点sb到终点db的最短路上个顶点的前驱顶点
parent(parent==0)=sb;%path中的分量为0，表示该顶点的前驱是顶点
mypath=db;t=db;
while t~=sb
    p=parent(t);mypath=[p,mypath];
    t=p;
end