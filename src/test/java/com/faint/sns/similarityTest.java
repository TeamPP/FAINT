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


public class similarityTest {
   
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
   

/*   @Test
   public void test() {
      
      double simil;
      double[] vectorA={1,2,3,4,5};
      double[] vectorB={6,7,8,9,10};
      
      simil=cosineSimilarity(vectorA, vectorB);
      
      System.out.println("유사도: "+simil);
      유사도: 0.9649505047327671

   }*/
   
   
/*   @Test
   public void test() {
      
      double simil;
      double[] vectorA={1,1,1,1,1};
      double[] vectorB={1,1,1,1,1};
      
      simil=cosineSimilarity(vectorA, vectorB);
      
      System.out.println("유사도: "+simil);
      유사도: 0.9999999999999998
   }*/
   
/*   @Test
   public void test() {
      double simil1;
      double simil2;
      double[] vectorA={10,20,1,1,0}; //코싸인 유사도는 음수 노노
      double[] vectorB={15,10,0,0,0};  //코싸인 유사도는 음수 노노
      
      double followSimil;  //팔로워 겹치는 정도
      int AfollowCnt=10;  //A의 팔로워수
      int BfollowCnt=20; //B의 팔로워수
      int unitfollowCnt=5; //A와 B의 공통 팔로워수
      
      //합집합(가중치 계산) 
      // A와B교집합/A와B합집합
      int hub=AfollowCnt+BfollowCnt-unitfollowCnt;
      followSimil=(double)unitfollowCnt/hub;
      
      int[] vectorC={10,5,1,1,0};
      int[] vectorD={15,10,0,0,0};
      
      simil1=cosineSimilarity(vectorA, vectorB);
      System.out.println("코싸인유사도: "+simil1);
      System.out.println("팔로워 겹치는 정도: "+followSimil);
      
      //코싸인 유사도랑 팔로워 겹치는 정도 곱
      System.out.println( "코싸인유사도* 팔로워 겹치는 정도: "+followSimil*simil1);
      
      simil2=Correlation(vectorC, vectorD);
      System.out.println("상관계수: "+simil2);
   }*/
	
	
	//유사도 구하기
		/*double simil1;
		double simil2;
		double simil3;
	    
	    simil1=cosineSimilarity(t[0], t[1]);  
	    simil2=cosineSimilarity(t[0], t[2]); 
	    simil3=cosineSimilarity(t[0], t[3]); 
	    
	    System.out.println("simil1:   "+simil1);
	    System.out.println("simil2:   "+simil2);
	    System.out.println("simil3:   "+simil3);*/
	
   
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
	List<ActivityDTO> activity=dao.activityTbl(1);   //아이디 1번
	
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
	
	System.out.println(cosineSimilarity(t[0], t[1]));
	System.out.println(cosineSimilarity(t[0], t[2]));
	System.out.println(cosineSimilarity(t[0], t[3]));
	
    //전체 테이블
	List<ActivityDTO> actTbl= dao.activityTbl(1); 
    
    double[][] actScore=new double[actTbl.size()][17];
    
	//정리
    for (int i = 0; i < actTbl.size(); i++) {
        System.out.println(i+" 유저?"+actTbl.get(i).getUserid());
        actScore[i][0]=actTbl.get(i).getUserid();
        
        actScore[i][1]=actTbl.get(i).getC1PostCnt();
        actScore[i][2]=actTbl.get(i).getC2PostCnt();
        actScore[i][3]=actTbl.get(i).getC3PostCnt();
        actScore[i][4]=actTbl.get(i).getC4PostCnt();
        actScore[i][5]=actTbl.get(i).getC5PostCnt();
        
        actScore[i][6]=actTbl.get(i).getC1ReplyCnt();
        actScore[i][7]=actTbl.get(i).getC2ReplyCnt();
        actScore[i][8]=actTbl.get(i).getC3ReplyCnt();
        actScore[i][9]=actTbl.get(i).getC4ReplyCnt();
        actScore[i][10]=actTbl.get(i).getC5ReplyCnt();
        
        actScore[i][11]=actTbl.get(i).getC1LikeCnt();
        actScore[i][12]=actTbl.get(i).getC2LikeCnt();
        actScore[i][13]=actTbl.get(i).getC3LikeCnt();
        actScore[i][14]=actTbl.get(i).getC4LikeCnt();
        actScore[i][15]=actTbl.get(i).getC5LikeCnt();
        
        
        System.out.println(Arrays.toString(actScore));
	}
    
    
    
    
    //나와 2번
    cosineSimilarity(t[0], t[1]);
    
	}

}