package com.faint.sns;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.faint.dto.ActivityDTO;
import com.faint.persistence.ActivityDAO;
import com.faint.persistence.TagDAO;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})


public class similarityTest2 {
   
	@Inject
	private ActivityDAO dao;
   
	
	@Inject
	private TagDAO tagDao;

   
   
   //corr 상관계수
/*     public static double Correlation(int[] xs, int[] ys) {
          //TODO: check here that arrays are not null, of the same length etc

          double sx = 0.0;
          double sy = 0.0;
          double sxx = 0.0;
          double syy = 0.0;
          double sxy = 0.0;

          int n = xs.length;

          for(int i = 0; i < n; ++i) {
            double x = xs[i];
            double y = ys[i];

            sx += x;
            sy += y;
            sxx += x * x;
            syy += y * y;
            sxy += x * y;
          }

          // covariation
          double cov = sxy / n - sx * sy / n / n;
          // standard error of x
          double sigmax = Math.sqrt(sxx / n -  sx * sx / n / n);
          // standard error of y
          double sigmay = Math.sqrt(syy / n -  sy * sy / n / n);

          // correlation is just a normalized covariation
          return cov / sigmax / sigmay;
        }*/
   


	   //코사인유사도
	  public static double cosineSimilarity(double[] vectorA, double[] vectorB) {
	       double dotProduct = 0.0;  //벡터의 내적 각 원소를 짝지어서 곱한뒤 합산
	       double normA = 0.0;
	       double normB = 0.0;
	       for (int i = 0; i < vectorA.length; i++) {
	           dotProduct += vectorA[i] * vectorB[i];
	           normA += Math.pow(vectorA[i], 2);
	           normB += Math.pow(vectorB[i], 2);
	       }   
	       return dotProduct / (Math.sqrt(normA) * Math.sqrt(normB));
	   }
	  
	//활동표 가져오기
	@Test
	public void test()throws Exception{
	List<ActivityDTO> activity=dao.activityTbl(4);   //아이디 7번
	
	//list-->array 변경
	ActivityDTO[] array2=activity.toArray(new ActivityDTO[activity.size()]);
	
	//2차원 배열에 넣기
	double[][] t=new double[activity.size()][15];
	
	for(int i=0; i<activity.size(); i++){
	t[i][0]=array2[i].getC1PostCnt();
	t[i][1]=array2[i].getC2PostCnt();
	t[i][2]=array2[i].getC3PostCnt();
	t[i][3]=array2[i].getC4PostCnt();
	t[i][4]=array2[i].getC5PostCnt();
	
	t[i][5]=array2[i].getC1ReplyCnt();
	t[i][6]=array2[i].getC2ReplyCnt();
	t[i][7]=array2[i].getC3ReplyCnt();
	t[i][8]=array2[i].getC4ReplyCnt();
	t[i][9]=array2[i].getC5ReplyCnt();
	
	t[i][10]=array2[i].getC1LikeCnt();
	t[i][11]=array2[i].getC2LikeCnt();
	t[i][12]=array2[i].getC3LikeCnt();
	t[i][13]=array2[i].getC4LikeCnt();
	t[i][14]=array2[i].getC5LikeCnt();
	}
	
	
	//유사도를 구한뒤 arr에 넣기
	//t[0]는 매개변수로 받은 userid의 활동표
	double[] simility=new double[activity.size()];
	for(int i=0; i<activity.size(); i++){
		simility[i]=cosineSimilarity(t[0], t[i]);
	}	
		
    //전체 테이블
	List<ActivityDTO> actTbl= dao.activityTbl(4);  //7번 아이디 
    
    double[][] actScore=new double[actTbl.size()-1][2];  //자기자신은 제외
   
	//정리
    for (int i = 0; i < actTbl.size()-1; i++) {
        actScore[i][0]=actTbl.get(i+1).getUserid();   //id 자기자신은 제외
        
        //코사인유사도
        if(Double.isNaN(simility[i+1])){   //NaN값이라면 0으로 대체
        	actScore[i][1]=0; 
        } else {  //유사도 있으면 넣어주기
        	actScore[i][1]=simility[i+1];
        }
	}
    
    for(int i=0; i<actScore.length; i++){
    	System.out.println(Arrays.toString(actScore[i]));   
    	//[6.0, 0.0]
    	//[20.0, 0.0]
    }
    
    
    //배열복사_유사도에 따른 정렬을 위해서
    double[][] tmp=new double[1][2]; 
    
    for(int i=actScore.length-1; i>0 ; i--){
        for(int j=0; j<i; j++){
        	if(actScore[j][1]<actScore[j+1][1]){
            	tmp[0]=actScore[j+1];
            	actScore[j+1]=actScore[j];
            	actScore[j]=tmp[0];
            }
        }
    }

    
    //정렬뒤 확인
    for(int i=0; i<actScore.length; i++){
    	System.out.println("정렬값:       "+Arrays.toString(actScore[i]));   
    	//[6.0, 0.0]
    	//[20.0, 0.0]
    }
    
    
    //추천할 유저의 id를 배열로 뽑음
    int[] recomm=new int[actScore.length];
    for(int i=0; i<actScore.length; i++){
    	recomm[i]=(int)actScore[i][0];   //0이면 제외하는 조건 추가할것
    }
    
    //추천할 유저의 id 배열 출력
    System.out.println("추천할 id값 입니다:        "+Arrays.toString(recomm));
    
	}
	
	
	
	
	

}