%CODED BY PUNEET DHEER 
%DATE:16-02-2017
%THIS CODE TRY TO FIND OUT THE "SEQUENTIAL PATTERN MATCHED" FOR EVERY SIZE FROM 2 TO
%LENGTH OF THE SIGNAL BETWEEN TWO SIGNALS
%EDITED BY: NONE

%INITIAL PARAMETERS
Ws=2;            %INITIAL WINDOW
X=X;             %FIRST SIGNAL PATTERN
Y=Y;             %SECOND SIGNAL PATTERN
Wss=2:length(X); %VECTOR OF WINDOWS
Tn=length(X);    %LENGTH OF PATTERN
T=0;
count=0;

c=cell(1,length(X)-1); %CELL TO INDICATE AS '1' THE MATCHED PATTERN
s=cell(1,length(X)-1); %CELL TO STORE WHICH PATTERN IS MATCHED

while(Ws<=length(X))
    Tnw = (Tn-Ws+1)/1;
    Wsy = Ws;
    Iy=1;
    Ix=1;
    Wsx = Ws; 
    T=T+1;
    for i=1:Tnw
        Ix=1; Wsx=Ws;
        y1=Y(1,Iy:Wsy) 
        
        %---------------------------------------------------------
        %FOR numerical value comparison, comment it when you are using
        %alphabets
%         yy=num2str(y1(1,:))
%         yyy= yy(find(~isspace(yy)))
%         y1=str2num(yyy)
        %---------------------------------------------------------
        flag=1;       %FLAGS
        flag1=1;
        for j=1:Tnw
            x1=X(1,Ix:Wsx)
            
            %-----------------------------------------------------
            %FOR numerical value comparison, comment it when you are using
            %alphabets
%             xx=num2str(x1(1,:)); 
%             xxx= xx(find(~isspace(xx)))
%             x1=str2num(xxx)
            %-----------------------------------------------------
            
            if x1==y1  %CHECK FOR TWO PATTERN EQUALITY
                disp('true')
                c{1,T}(i,j)=count+1;
                   
%               if flag==1
%                 s{1,T}(i,1)=y1; %FOR NUMERICAL VALUES
%                 flag=0;
%                 flag1=0;
%               end
                
                if flag==1
                    s{1,T}(i,j:(j+length(y1)-1))=y1; %FOR ALPHABETS
                    flag=0;
                end

%  /NO/               s{1,T}(i,end+1:(1+end+length(y1))-1)=y1;

                Ix=Ix+1;
                Wsx=Wsx+1;
            else
                disp('false')
                c{1,T}(i,j)=0;
                
%                 if flag1==1
%                      s{1,T}(i,j)=0;   %FOR NUMERICAL VALUES
%                      flag1=0
%                 end
                  if flag==1
                    s{1,T}(i,j)='0'; %FOR ALPHABETS
                  end
                  
%    /NO/             s{1,T}(i,end+1)='0';

                Ix=Ix+1;
                Wsx=Wsx+1; %SHIFTING OF WINDOW IN X SIGNAL
            end
        end
        Iy=Iy+1;
        Wsy=Wsy+1;   %SHIFTING OF WINDOW SIZE IN Y SIGNAL
    end
    Ws=Ws+1;  %INCREMENT OF WINDOW SIZE
end